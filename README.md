1   What is basic usage of terraform?
    
    1: terraform init (initialize the backend)
    2: terraform plan ()
    3: terraform apply
    4: terraform destory

2   what is prerequesite of terraform? and how to establish connection between aws and terraform? 

    1: create your own acocunt in AWS
    2: create user group and add policy
    3: create user
    4: create main.tf sample, 
    5: install aws command line (aws cli)
    6: run "aws configure", pass your access id and secret key

3   what is terraform state file?

    1: it stands for Terraform's representation of world
    2: it is Json file format, it contains every resource and data object
    3: it contains sensitive info (e.g. database password)
    4: it can be store remotely and locally

4   How does terraform plan, apply and destroy work? 

    1: it is meant to do comparsion between terraform config(Desire state) and terraform state(acatual state)
    if found the difference == true
        notify the AWS provider
        then
        using the terraform apply to add service to AWS provider (e.g. add virtual machine)   

    Terraform destroy -> it can destroy the all of resource as associate with this project
    
5   What is S3 Bucket? 
    1: Amazon Simple Storage Service is object storing service 
    ![image](https://user-images.githubusercontent.com/101307724/207036366-4d8a0b00-5ef3-4ec5-8fb2-2f4cfcbaebd6.png)

