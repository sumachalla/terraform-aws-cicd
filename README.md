# github-aws-cicd

infrastructure: 

 modules: 
 	 VPC: Creates VPC with private and public subnet on each avaialability zone,
 				route table for public subnets, Internet Gateway,load balancer.
 		EC2: Creates EC2 instance on each availability zone, Deploy httpd with index.html using YAML file.
 		
 cicd-pipeline:
 		Prerequisite: Create Secrets in Secret Manager for docker hub and github.
 					 Create a connection for github under CodePipeline -> Settings
 					 
 		- It pulls the code from github repository. Run terrafrom plan, terraform apply & Destroy after manual approval.				 
 					 
 								
