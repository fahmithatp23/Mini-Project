from datetime import datetime

from django.contrib import auth
from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from django.shortcuts import render

from gramaapp.models import *


def main(request):
    return render(request,'LOGIN.html')


def logincode(request):
    uname = request.POST['textfield']
    pw = request.POST['textfield2']
    try:
        ob = login.objects.get(username=uname, password=pw)
        if ob.type == 'admin':
            request.session['lid'] = ob.id
            obb=auth.authenticate(username='admin',password='admin')
            auth.login(request,obb)
            return HttpResponse('''<script>alert("welcome admin");window.location='/adminhome'</script>''')
        elif ob.type == 'staff':
            request.session['lid'] = ob.id
            obb = auth.authenticate(username='admin', password='admin')
            auth.login(request, obb)
            return HttpResponse('''<script>alert("welcome staff");window.location='/staffhome'</script>''')
        elif ob.type == 'user':
            request.session['lid'] = ob.id
            obb = auth.authenticate(username='admin', password='admin')
            auth.login(request, obb)
            return HttpResponse('''<script>alert("welcome user");window.location='/userhome'</script>''')


    except:
        return HttpResponse('''<script>alert("invalid user");window.location='/'</script>''')



def adminhome(request):
    return render(request,'admin/ADMINHOME.html')


@login_required(login_url='/')
def addservice(request):
    return render(request,'admin/ADDSERVICE.html')

@login_required(login_url='/')
def serviceadd(request):
    sname=request.POST['textfield']
    desc=request.POST['textarea']
    doc=request.POST['textarea2']
    amounts=request.POST['textfield4']
    ob=services()
    ob.servicename=sname
    ob.description=desc
    ob.documents=doc
    ob.amount=amounts
    ob.save()
    return HttpResponse('''<script>alert("services added successfully");window.location='/manageservice#about'</script>''')


@login_required(login_url='/')
def editservice(request,id):
    ob = services.objects.get(id=id)
    request.session['se_id'] = id

    return render(request,'admin/EDITSERVICE.html',{'val':ob})


@login_required(login_url='/')
def serviceupdate(request):
    sname = request.POST['textfield']
    desc = request.POST['textarea']
    doc = request.POST['textarea2']
    amounts = request.POST['textfield4']
    ob=services.objects.get(id=request.session['se_id'] )
    ob.servicename=sname
    ob.description=desc
    ob.documents = doc
    ob.amount = amounts
    ob.save()
    return HttpResponse('''<script>alert("services updated successfully");window.location='/manageservice#about'</script>''')

@login_required(login_url='/')
def deleteservice(request, id):
    ob = services.objects.get(id=id)
    ob.delete()

    return HttpResponse('''<script>alert("deleted");window.location='/manageservice#about'</script>''')

@login_required(login_url='/')
def addandmanagestaff(request):
    ob=staff.objects.all()
    return render(request,'admin/ADDANDMANAGESTAFF.html',{'val':ob})


@login_required(login_url='/')
def manageservice(request):
    ob=services.objects.all()
    return render(request,'admin/MANGESERVICE.html',{'val':ob})


@login_required(login_url='/')
def addstaff(request):
    return render(request,'admin/REGSTAFF.html')

@login_required(login_url='/')
def staffadd(request):
    try:
        fname = request.POST['textfield']
        lname = request.POST['textfield2']
        place = request.POST['textfield3']
        post = request.POST['textfield4']
        pin = request.POST['textfield5']
        phone = request.POST['textfield6']
        email = request.POST['textfield7']
        username=request.POST['textfield8']
        password = request.POST['textfield9']
        lob = login()
        lob.username = username
        lob.password = password
        lob.type = 'staff'
        lob.save()
        uob =staff()
        uob.lid = lob
        uob.fname = fname
        uob.lname = lname
        uob.email = email
        uob.place = place
        uob.post = post
        uob.pin = pin
        uob.phone = phone
        uob.save()
        return HttpResponse('''<script>alert("registered successfully");window.location='/addandmanagestaff#about'</script>''')
    except:
        return HttpResponse( '''<script>alert("Email already exist");window.location='/addandmanagestaff#about'</script>''')


@login_required(login_url='/')
def updatestaff(request,id):
    ob = staff.objects.get(id=id)
    request.session['sid'] = id
    return render(request,'admin/EDITSTAFF.html',{'val':ob})

@login_required(login_url='/')
def staffupdate(request):
    fname = request.POST['textfield']
    lname = request.POST['textfield2']
    place = request.POST['textfield3']
    post = request.POST['textfield4']
    pin = request.POST['textfield5']
    phone = request.POST['textfield6']
    email = request.POST['textfield7']
    ob = staff.objects.get(id=request.session['sid'])
    ob.fname = fname
    ob.lname = lname
    ob.place = place
    ob.post = post
    ob.pin = pin
    ob.phone = phone
    ob.email = email
    ob.save()
    return HttpResponse('''<script>alert("updated");window.location='/addandmanagestaff#about'</script>''')


@login_required(login_url='/')
def deletestaff(request,id):
    ob = staff.objects.get(lid__id=id)
    ob.delete()
    iob = login.objects.get(id=id)
    iob.delete()
    return HttpResponse('''<script>alert("deleted");window.location='/addandmanagestaff#about'</script>''')


@login_required(login_url='/')
def updatestatusadmin(request):
    ob=servicerequests.objects.filter(status='forward')
    print("aaaaaaaaaaaaaaaaaaaaaaa",request.session['lid'])
    return render(request,'admin/UPDATESTATUS_ADMIN.html',{'val':ob})


@login_required(login_url='/')
def viewreqadmin(request,id):
    ob = servicerequests.objects.filter(uid__lid__id=id, status='forward')
    return render(request, 'admin/VIEWREQADMIN.html', {'val': ob})



@login_required(login_url='/')
def viewmorestatusadmin(request,id):
    ob = servicerequests.objects.get(id=id)
    print(ob,"qqqqqqqqqqqqqqqqqqqq")
    return render(request,'admin/VIEWMORESTATUS_ADMIN.html',{'val':ob})

def downloaddocuments(request,id):
    ob=documents.objects.filter(reqid__id=id)
    print(ob)
    return render(request, 'admin/DOWNLOADDOCS_ADMIN.html',{'val':ob})



@login_required(login_url='/')
def acceptadmin(request,id):
    ob = servicerequests.objects.get(id=id)
    ob.status = 'accept'
    ob.save()
    return HttpResponse('''<script>alert("accepted");window.location='/adminhome'</script>''')


@login_required(login_url='/')
def rejectadmin(request,id):
    return render(request, 'admin/rejectedreason_admin.html', {'rid': id})


@login_required(login_url='/')
def reasonreject_admin(request):
    return render(request,'admin/rejectedreason_admin.html')


@login_required(login_url='/')
def reasonforreject(request):
    reas=request.POST['textfield']
    rid=request.POST['rid']

    print(reas,rid,"aaaaaaaaaaaaaaaaaaaaaaaa")

    ob=servicerequests.objects.get(id=rid)
    ob.status='reject'
    ob.save()

    ob=reasons()
    ob.reason=reas
    ob.reqid=servicerequests.objects.get(id=rid)
    ob.staffid=login.objects.get(id=request.session['lid'])
    ob.save()

    return HttpResponse('''<script>alert("reason added");window.location='/adminhome'</script>''')







def staffhome(request):
    return render(request,'staff/STAFFHOME.html')


@login_required(login_url='/')
def updatestatusstaff(request):
    from django.db.models import Subquery
    ob=servicerequests.objects.filter(status='pending')
    print(ob,"=================")
    ob1=user.objects.filter(id__in=Subquery(ob.values('uid')))
    print(ob1,"===========")
    return render(request,'staff/UPDATESTATUS_STAFF.html',{'val':ob1})


@login_required(login_url='/')
def viewservicereq_staff(request,id):
    ob=servicerequests.objects.filter(uid__lid__id=id,status='pending')
    return render(request, 'staff/VIEWSERVICEREQ_STAFF.html',{'val':ob})



@login_required(login_url='/')
def viewmorestaff(request,id):
    ob=servicerequests.objects.get(id=id)
    return render(request,'staff/VIEWMORESTATUS_STAFF.html',{'val':ob})


def downloaddocuments_staff(request,id):
    ob=documents.objects.filter(reqid__id=id)
    print(ob)
    return render(request, 'staff/DOWNLOADDOCS.html',{'val':ob})


@login_required(login_url='/')
def forward(request,id):
    ob=servicerequests.objects.get(id=id)
    ob.status='forward'
    ob.save()
    return HttpResponse('''<script>alert("forwarded");window.location='/staffhome'</script>''')


@login_required(login_url='/')
def reject(request,id):
    # ob=servicerequests.objects.get(id=id)
    # ob.status='reject'
    # ob.save()
    return render(request,'staff/rejectedreason_staff.html',{'rid':id})


@login_required(login_url='/')
def reasonreject_staff(request):
    return render(request,'staff/rejectedreason_staff.html')


@login_required(login_url='/')
def reason11(request):
    reas=request.POST['reason']
    rid=request.POST['rid']

    print(reas,rid,"aaaaaaaaaaaaaaaaaaaaaaaa")

    ob=servicerequests.objects.get(id=rid)
    ob.status='reject'
    ob.save()

    ob=reasons()
    ob.reason=reas
    ob.reqid=servicerequests.objects.get(id=rid)
    ob.staffid=login.objects.get(id=request.session['lid'])
    ob.save()

    return HttpResponse('''<script>alert("reason added");window.location='/staffhome'</script>''')


@login_required(login_url='/')
def viewservice(request):
    ob=services.objects.all()
    return render(request,'staff/VIEWSERVICE.html',{'val':ob})

def userreg(request):
    return render(request,'user/REGISTERUSER.html')
def registeruser(request):
    fname = request.POST['textfield']
    lname = request.POST['textfield2']
    gender = request.POST['radiobutton']
    place = request.POST['textfield3']
    post = request.POST['textfield4']
    pin = request.POST['textfield5']
    phone = request.POST['textfield6']
    email = request.POST['textfield7']
    username = request.POST['textfield8']
    password = request.POST['textfield9']
    lob = login()
    lob.username = username
    lob.password = password
    lob.type = 'user'
    lob.save()
    uob = user()
    uob.lid = lob
    uob.fname = fname
    uob.lname = lname
    uob.gender = gender
    uob.email = email
    uob.place = place
    uob.post = post
    uob.pin = pin
    uob.phone = phone
    uob.save()
    return HttpResponse('''<script>alert("registered successfully");window.location='/'</script>''')

@login_required(login_url='/')
def applyservice(request,id):
    ob=services.objects.get(id=id)

    return render(request,'user/APPLYSERVICE.html',{'val':ob,'sid':id})


@login_required(login_url='/')
def reason(request):
    return render(request,'user/REASON.html')


@login_required(login_url='/')
def searchservice(request):
    ob=services.objects.all()
    return render(request,'user/SEARCHSERVICE.html',{'val2':ob})

@login_required(login_url='/')
def searchservices(request):
    service=request.POST['select']
    ob = services.objects.all()
    oob=services.objects.filter(id=service)
    return render(request, 'user/SEARCHSERVICE.html',{'val':oob,'val2':ob, 'val3':int(service)})



@login_required(login_url='/')
def uploadcertificate(request,id):

    ob = services.objects.get(id=id)
    c = ob.documents
    crtfct = c.split(",")
    print(crtfct)
    oob=servicerequests()
    oob.date=datetime.today()
    oob.status='pending'
    oob.serviceid=services.objects.get(id=id)
    oob.uid=user.objects.get(lid__id=request.session['lid'])
    oob.save()
    request.session['rid']=oob.id
    print(request.session['rid'],"======================")
    dob = documents.objects.filter(reqid__id=request.session['rid'],)
    print(dob, "pppp")
    return render(request,'user/UPLOADCERTIFICATE.html',{'crtfc':crtfct,'data':dob})

# def viewdocsuploaded(request):
#     dob=documents.objects.filter(reqid__uid__lid__id=request.session['lid'])
#     print(dob,"pppp")
#     return render(request, 'user/UPLOADCERTIFICATE.html',{'data':dob})


@login_required(login_url='/')
def viewuploads(request,id):
    pob = documents.objects.filter(reqid__id=id)
    return render(request,'user/VIEWUPLOADEDDOCS.html',{'val':pob})






def certificateadd(request):
    btn=request.POST['Submit']
    if btn=="UPLOAD":

        type=request.POST['select']
        document=request.FILES['file']
        ob = documents.objects.filter(reqid=servicerequests.objects.get(id=request.session['rid']),
                                      certificatetype=type)

        if len(ob)==0:
            fp=FileSystemStorage()
            fs=fp.save(document.name,document)
            ob=documents()

            ob.certificatetype=type
            ob.certificate=fs
            ob.reqid=servicerequests.objects.get(id=request.session['rid'])
            ob.save()

        rid=servicerequests.objects.get(id=request.session['rid'])

        ob = services.objects.get(id=rid.serviceid.id)
        c = ob.documents
        crtfct = c.split(",")
        dob = documents.objects.filter(reqid__id=request.session['rid'], )
        print(dob, "pppp")
        return render(request,'user/UPLOADCERTIFICATE.html',{'crtfc':crtfct,"data":dob})
    else:
        return HttpResponse('''<script>alert("finished");window.location='/userhome'</script>''')





def userhome(request):
    return render(request,'user/USERHOME.html')

def viewapplicationstatus(request):
    ob=servicerequests.objects.filter(uid__lid__id=request.session['lid'])
    return render(request,'user/VIEWAPPLICATIONSTATUS.html',{'val':ob})

def whyrejected(request,id):
    ob=reasons.objects.filter(reqid__id=id)
    print(ob[0].id)
    s="Admin"
    if(int(ob[0].id)!=1):
        obb=staff.objects.get(lid__id=ob[0].id)
        s=obb.fname+" "+obb.lname

    return render(request, 'user/REASON.html',{'val':ob,"f":s})



def logout(request):
    auth.logout(request)
    return render(request,"LOGIN.HTML")




