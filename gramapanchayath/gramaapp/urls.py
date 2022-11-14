from django.urls import path

from gramaapp import views

urlpatterns=[

path('',views.main,name='main'),

path('logincode',views.logincode,name='logincode'),




path('adminhome',views.adminhome,name='adminhome'),

path('deleteservice/<int:id>',views.deleteservice,name='deleteservice'),
path('editservice/<int:id>',views.editservice,name='editservice'),
path('serviceupdate',views.serviceupdate,name='serviceupdate'),

path('addservice',views.addservice,name='addservice'),


path('serviceadd',views.serviceadd,name='serviceadd'),


path('addandmanagestaff',views.addandmanagestaff,name='addandmanagestaff'),

path('manageservice',views.manageservice,name='manageservice'),


path('addstaff',views.addstaff,name='addstaff'),

path('staffadd',views.staffadd,name='staffadd'),

path('updatestaff/<int:id>',views.updatestaff,name='updatestaff'),

path('staffupdate',views.staffupdate,name='staffupdate'),

path('deletestaff/<int:id>',views.deletestaff,name='deletestaff'),



path('updatestatusadmin',views.updatestatusadmin,name='updatestatusadmin'),

path('viewreqadmin/<int:id>',views.viewreqadmin,name='viewreqadmin'),


path('acceptadmin/<int:id>',views.acceptadmin,name='acceptadmin'),

path('rejectadmin/<int:id>',views.rejectadmin,name='rejectadmin'),

path('reasonreject_admin',views.reasonreject_admin,name='reasonreject_admin'),

path('reasonforreject',views.reasonforreject,name='reasonforreject'),
# path('viewdocsuploaded',views.viewdocsuploaded,name='viewdocsuploaded'),




path('downloaddocuments/<int:id>',views.downloaddocuments,name='downloaddocuments'),
path('downloaddocuments_staff/<int:id>',views.downloaddocuments_staff,name='downloaddocuments_staff'),
path('viewmorestatusadmin/<int:id>',views.viewmorestatusadmin,name='viewmorestatusadmin'),

path('staffhome',views.staffhome,name='staffhome'),
path('updatestatusstaff',views.updatestatusstaff,name='updatestatusstaff'),

path('viewmorestaff/<int:id>',views.viewmorestaff,name='viewmorestaff'),

path('viewservice',views.viewservice,name='viewservice'),

path('userreg',views.userreg,name='userreg'),

path('registeruser',views.registeruser,name='registeruser'),

path('viewservicereq_staff/<int:id>',views.viewservicereq_staff,name='viewservicereq_staff'),

path('forward/<int:id>',views.forward,name='forward'),

path('reject/<int:id>',views.reject,name='reject'),

path('reasonreject_staff',views.reasonreject_staff,name='reasonreject_staff'),

path('reason11',views.reason11,name='reason11'),

path('whyrejected/<int:id>',views.whyrejected,name='whyrejected'),
path('applyservice/<int:id>',views.applyservice,name='applyservice'),

path('reason',views.reason,name='reason'),

path('searchservice',views.searchservice,name='searchservice'),

path('searchservices',views.searchservices,name='searchservices'),

path('uploadcertificate/<int:id>',views.uploadcertificate,name='uploadcertificate'),

path('certificateadd',views.certificateadd,name='certificateadd'),

path('viewuploads/<int:id>',views.viewuploads,name='viewuploads'),




path('userhome',views.userhome,name='userhome'),

path('viewapplicationstatus',views.viewapplicationstatus,name='viewapplicationstatus'),
path('logout',views.logout,name='logout'),























]