1   Type of Infrastructure as code tools?

    1: Configuration management "Ansible, puppet, saltstack"
    2: Server templating "Docker, Packer, Vagrant"
    3: Provisioning tools "Terraform, CloudFormation"

1   What is Terraform?

    1: free and open source tool which is developed by hashcrop
    2: it can deploye the IAC across muti platform such as physicial machines, VMware, AWS, GCP and Azure
    3: Teeraform uses the HashiCorp Configuration language

1   What is Desire Sate and current state?  

    1: Terraform can deploye the Resired state into current state, Desired state stands for current .tf file, the current state stands for current infrastructure Configuration 

1   The structure of HCL file (.tf extension file)

    1: <block> <"parameters tpye, paramters name"> {
        key1 =  value1
        key2 =  value2
        (argument) = (value)
    }
    2: resource "local_files" "pet" {
        filename="/root/pets.txt"
        content = "we love pets"
    }
    3: resource "aws_instance" "webserver"{
        ami= "ami-xxxxx"
        instance_type = "t2.micro"
    }

    4: resource "aws_s3_bucket" "date" {
        bucket = "webserver-bucket-xxx"
        acl ="private"
    }

1   Teeraform config file type

    1: main.tf   (main config file containing resource definition)
    2: variables.tf (contrains variable declarations)
    3: outputs.tf (contain outputs from resource)
    4: provider.tf (contains provider definition)

1   What is random provider?

    1: random provider is logic provider which can be called from another resource

    resource random_id "server_id"{
        keepers = {
            ami_id = var.ami_id
        }

        byte_length = 8
    }

    resource "aws_instance" "server" {
        tags= {
            Name = "web-server ${random_id.server.hex}"
        }
         ami = random_id.server_id.keepers.ami_id
    }

1   Terraform variables 

    1: We can put reused variables into variables.tf 
    2: variables support many data structure and types
    variable "content" {
        ## this is key type in variables
        default = {
            "one"   = "i love pets"
            "two"   = "i love dog"
            "three" = "i love cat"
        }
        ## this is list type in variables
        description= ["dog","pets","cat"]
        type = list(any)
        
        ## this is set type in variables , set type does not allow dupulicated value
        description= ["dog","pets","dog"]
        type = set(any)

        ## this is object tpye, i personally prefer to use this 
        variable "object_test" {
            type = object({
                name         = string
                color        = string
                age          = number
                food         = list(any)
                favorite_pet = bool

            })

            default = {
                age = 1
                color = "red"
                favorite_pet = true
                food = ["chicken","beef"]
                name = "Winnie-pooh"
            }
            }

            }
    3: Variable definition precedence: 
        1 :env variables
        2 :terraform.tfvars
        3 :*.auto.tfvar
        4 : terraform apply -var xxx="sss"

        The command line variable has highest permission to reload variables
        
1   terraform dependency

    1: we can use depends_on to create dependency between different resources
    2:resource "local_file" "whale" {
                filename="/root/whale"
                content="whale"
                depends_on=[local_file.krill]
                }
                resource "local_file" "krill" {
                filename="/root/krill"
                content="krill"

                }

1   Output variables

    1: this variable can store value and output value in command line or files

1   the workflow of terraform

    1: Write terraform file (.tf extension)
    2: terraform init (terraform file initilization)
    3: terraform plan (review execution plan)
    4: terraform apply (apply terraform changes to platform )
    5: terraform show (it shows the terraform config under current folder)

1   What is basic usage of terraform?
    
    1: terraform init (initialize the backend)
    2: terraform plan ()
    3: terraform apply
    4: terraform destory 
    5: terraform validate
    6: terraform show (show the current state)
    7: terraform providers (show the current providers)
    8: terraform output (list out all of output)
    9: terraform graph

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

6   Type of Infrastructure as code tools?

    1: Configuration management "Ansible, puppet, saltstack"
    2: Server templating "Docker, Packer, Vagrant"
    3: Provisioning tools "Terraform, CloudFormation"

7   inmutable infrastructure 

    1: when we update the resource, it destroy previous resource and create new one. it is desirable approach to manage update for all cases

    2: this issue can be solved by using life cycle rule

8   terraform life cycle

    1: it will create the new resource , then destory old one. If we set it to be true

        lifecycle {
        create_before_destroy = true
        }
    2: If we dont want to destory old resource (e.g.SQL database)
        lifecycle {
            # create_before_destroy = true
            prevent_destroy = true
        }

    3: Ignore_change, if we want to ignore changes
        lifecycle {
            # create_before_destroy = true
            ignore_changes=[
                tags
            ]
        }

9   Terraform date source vs Resource

    1: what is the data source of terraform

    it uses keywords data, it only reads infrastructure

    2: what is resource ?

    it uses keywords resource, it can creates, updates and destroys infrastructure. it is also called managed resources

10  Terraform count
    1: it can run the resource manys times 
    issue: it will do same resource many time

    2: solution:
        set variable to be list type.
        ## resource
        resource "local_file" "pet" {
        filename = var.filename[count.index]
        content  = var.contents[count.index]
        count    = 3
        }
        ## variables
        variable "contents"{
        default=["i love dog", "i love cat", "i love pets"]
        }
    3 Notice: the count number must match with another

11  Terraform foreach
    1: for each argument only work with map or set

    2: we can convert the list to set by using toset()

    3: set type does not allow duplicated value 
