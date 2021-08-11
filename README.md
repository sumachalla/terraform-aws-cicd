# github-aws-cicd

infrastructure:<br/>
  modules:<br/>
 	  VPC: Creates VPC with private and public subnet on each avaialability zone,<br/>
 				    route table for public subnets, Internet Gateway,load balancer.<br/>
 		EC2: Creates EC2 instance on each availability zone, Deploy httpd with index.html using YAML file.<br/>
 		
 cicd-pipeline:<br/>
 		Prerequisite: Create Secrets in Secret Manager for docker hub and github.<br/>
 					 Create a connection for github under CodePipeline -> Settings <br/>	
       Run Terraform commands to create CICD pipeline for the infrastructure modules. Source: Github repository				 
 					 
 								
