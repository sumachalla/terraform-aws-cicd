# github-aws-cicd

Terraform project to create VPC,EC2, Subnets and CICD pipeline to create infrastructure modules <br/>
 Note: terraform state files are saved on S3 bucket.<br/>
 <br/>
infrastructure:<br/>
  modules:<br/>
 	  VPC: Creates VPC with private and public subnet on each avaialability zone,<br/>
 				    route table for public subnets, Internet Gateway,load balancer.<br/>
 		EC2: Creates EC2 instance on each availability zone, Deploy httpd with index.html using YAML file.<br/>
 		
 cicd-pipeline:<br/>
 		Prerequisite: Create Secrets in Secret Manager for docker hub and github.<br/>
 					 Create a connection for github under CodePipeline -> Settings <br/>	
       Run Terraform commands locally on this directory to create CICD pipeline for the infrastructure modules. Source: Github repository				 
 					
           
           
           
 								
