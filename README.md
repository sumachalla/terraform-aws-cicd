# terraform-aws-cicd

Terraform project to create VPC,EC2, Subnets and CICD pipeline to create infrastructure modules <br/>
 Note: terraform state files are saved on S3 bucket.<br/>
 <br/>
 ### cicd-pipeline:
 #### Prerequisite:
   
       Create Secrets in Secret Manager for docker hub and github.
       Create a connection for github under CodePipeline -> Settings 
       Run Terraform commands locally on this directory to create CICD pipeline for the infrastructure modules. Source: Github repository				 
 			
### Infrastructure:
  #### modules:
    VPC: Creates VPC with private and public subnet on each avaialability zone, route table for public subnets, Internet Gateway,load balancer.
    EC2: Creates EC2 instance on each availability zone, Deploy httpd with index.html using YAML file.
 		
 		
           
           
           
 								
