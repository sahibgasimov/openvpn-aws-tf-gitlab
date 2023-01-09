![alt text](https://github.com/sahibgasimov/openvpn-aws-tf-gitlab/blob/main/openvpn.jpg "1*openvpn.jpg")

## Application deployment
* Deploys an **OpenVPN** and **Access Server** with Letsencrypt SSL Certificate on EC2 Ubuntu 22.04
* LetsEncrypt hook to put certificate into OpenVPN-AS config and restart openvpnas service
* The script deletes files every night named /var/log/openvpnas.log.15 and higher (up to .1000).

*Note: The original code of userdata script and instructions for data_tempalates below, I've got from https://github.com/ventx/Terraform-AWS-OpenVPNServer, I would like to thank repo owner Ventx for this great bootstrap script. I've slightly modified the script to fully meet my needs.

## VPN Settings
Customize your OpenVPNServer with these [Inputs](#Inputs)

## Logoutput on the EC2 Instance
openvpn logfile `/var/log/openvpn.log`
LetsEncrypt auto renew logfile `/var/log/letsencrypt-renew.log`

## Settings setup
For VPN Routing and advanced settings use the **Access Server command line interface tools**

To use `./sacli` navigate to `/usr/local/openvpn_as/scripts/ `

Default settings never route any client traffic through the VPN

You can change this in `userdata.sh` befor creating the instance but you also can change this after that on the EC2 Instance.

**sacli commands examples** _(no client traffic routing through the VPN connection)_

 ```bash
  ./sacli --key "vpn.client.routing.reroute_dns" --value "false" ConfigPut
  ./sacli --key "vpn.client.routing.reroute_gw" --value "false" ConfigPut

 ```
## Usage
If everything went well, you can access the server via SSH using public ip or SSM to your OpenVPN Access server via  browser.
The initial admin password of the openvpn will be stored in /home/ubuntu/passwd.txt

Check your specified Admin URL in the outputs of this terraform module

Username: `openvpn`

Password: `cat /home/ubuntu/passwdt.txt`

*Alternatively, userdata script allows another user named `admin` to get terminal access with the password(default password is "password") and find the console admin openvpn username password and URL information in the file /usr/local/openvpn_as/init.log


## Links

* https://openvpn.net/vpn-server-resources/managing-settings-for-the-web-services-from-the-command-line/


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| ami | AWS AMI to use | string | ami-0ff39345bd62c82a5 | no |
| adminurl | openvpn admin URL | string | m/a | yes |
| domain | Domain Name | string | n/a | yes |
| instancename | Name of the Instance | string | n/a | yes |
| instancetype | AWS Instance Type | string | n/a | yes |
| key\_city | OpenVPN CA City Name | string | n/a | yes |
| key\_country | OpenVPN CA Country Name | string | n/a | yes |
| key\_email | OpenVPN CA Email Contact | string | n/a | yes |
| key\_org | OpenVPN CA Organisation Name | string | n/a | yes |
| key\_ou | OpenVPN Organisation Unit Name | string | n/a | yes |
| key\_province | OpenVPN CA Province Name | string | n/a | yes |
| keyname | SSH Access Key | string | n/a | yes |
| subdomain | Subdomain name | string | n/a | yes |
| owner | AWS Tag for Owner | string | n/a | yes |
| profile | Aws Profile to use | string | n/a | yes |
| region | Region to use | string | n/a | yes |
| sslmail | LetsEncrypt Contact Email | string | n/a | yes |
| subdomain | Subdomain | string | n/a | yes |
| subnetid | Subnet for the EC2 instance | string | n/a | yes |
| vpc | AWS VPC to be used | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| Domain Name | TLD for the OpenVPNServer |
| adminurl | Admin Access URL for the OpenVPNServer |
| arn | Your VPC ARN |
| instancearn | Instance ARN |
| instancetype | Instance Type |
| iprange | VPC Iprage |
| keyname | SSH Access Key Name |
| privateip | Instance Private IP |
| pubplicip | The Instance Public IP |
| route table | Route Table |
| sg\_id | SecurityGroup ID |
| sg\_name | SecurityGroup Name |
| userdata | Userdata Hash |
| vpc\_id | VPC ID |
| vpc\_name | VPC Name |

## Gitlab 

Create gitlab-ci.yaml file 

```
image:
  name: hashicorp/terraform:light
  entrypoint:
    - '/usr/bin/env'

before_script:
  - rm -rf .terraform
  - terraform --version
  - mkdir -p ./terraform/project
  - terraform init

stages:
  - validate
  - plan
  - apply
  - destroy

validate:
  stage: validate
  script: 
    - terraform validate

plan:
  stage: plan
  script:
    - set
    - echo $AWS_SECRET_ACCESS_KEY
    - echo $AWS_ACCESS_KEY_ID
    - mkdir -p ./terraform/project
    - chmod 777 terraform/project
    - cd terraform/project
    - ls
    - terraform init
    - terraform plan
  dependencies:
    - validate

apply:
  stage: apply
  script:
    - set
    - echo $AWS_SECRET_ACCESS_KEY
    - echo $AWS_ACCESS_KEY_ID
    - mkdir -p ./terraform/project
    - chmod 777 terraform/project
    - cd terraform/project
    - ls
    - terraform init
    - terraform apply --auto-approve
  dependencies:
      - plan
  when: manual

destroy:
  stage: destroy
  script:
    - set
    - echo $AWS_SECRET_ACCESS_KEY
    - echo $AWS_ACCESS_KEY_ID
    - mkdir -p ./terraform/project
    - chmod 777 terraform/project
    - cd terraform/project
    - ls
    - terraform init
    - terraform destroy --auto-approve
  dependencies:
    - apply
  when: manual
  
```
