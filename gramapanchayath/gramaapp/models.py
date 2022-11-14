from django.db import models

class login(models.Model):
    username=models.CharField(max_length=90)
    password = models.CharField(max_length=90)
    type = models.CharField(max_length=90)

class user(models.Model):
    fname = models.CharField(max_length=90)
    lname = models.CharField(max_length=90)
    gender = models.CharField(max_length=90)
    email= models.CharField(max_length=90)
    place = models.CharField(max_length=90)
    post = models.CharField(max_length=90)
    pin = models.CharField(max_length=90)
    phone = models.CharField(max_length=90)
    lid = models.ForeignKey(login, on_delete=models.CASCADE)

class staff(models.Model):
    fname = models.CharField(max_length=90)
    lname = models.CharField(max_length=90)
    email = models.CharField(max_length=90)
    place = models.CharField(max_length=90)
    post = models.CharField(max_length=90)
    pin = models.CharField(max_length=90)
    phone = models.CharField(max_length=90)
    lid = models.ForeignKey(login, on_delete=models.CASCADE)
class services(models.Model):
    servicename = models.CharField(max_length=90)
    description = models.CharField(max_length=1000)
    documents = models.CharField(max_length=1000)
    amount= models.CharField(max_length=90)

class servicerequests(models.Model):
    serviceid = models.ForeignKey(services, on_delete=models.CASCADE)
    uid = models.ForeignKey(user, on_delete=models.CASCADE)
    date = models.DateField()
    status= models.CharField(max_length=90)

class documents(models.Model):
    reqid = models.ForeignKey(servicerequests, on_delete=models.CASCADE)
    certificatetype = models.CharField(max_length=90)
    certificate = models.CharField(max_length=90)

class reasons(models.Model):
    reqid = models.ForeignKey(servicerequests, on_delete=models.CASCADE)
    staffid = models.ForeignKey(login, on_delete=models.CASCADE)
    reason = models.CharField(max_length=90)





