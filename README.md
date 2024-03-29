## Deployment of high-availability web app using CloudFormation

 This project creates a CloudFormation stack using Infrastructure as Code principles while prioritizing high-availability and security considerations. The cloud infrastructure is built using YAML templates, as required for the project, with some parameters stored in JSON files.

 This repository includes the solution scripts and screenshots for Udacity Cloud Devops Nanodegree - Course 2 Project.

<br >

### Architechture

![screenshot](./diagram.jpeg)

### Requirements implemented

### Server specs

1. Developer need to create a Launch Configuration for your application servers in order to deploy four servers, two located in each of your private subnets. The launch configuration will be used by an auto-scaling group.

2. Two vCPUs and at least 4GB of RAM will be needed. The Operating System to be used is Ubuntu 18. So, choose an Instance size and Machine Image (AMI) that best fits this spec.

3. Be sure to allocate at least 10GB of disk space so that you don't run into issues.

### Security Groups and Roles

1. Since the application archive will be downloaded from an S3 Bucket, an IAM Role will be needed to be created that allows your instances to use the S3 Service.

2. The app communicates on the default HTTP Port: 80, so your servers will need this inbound port open since you will use it with the Load Balancer and the Load Balancer Health Check. As for outbound, the servers will need unrestricted internet access to be able to download and update their software.

3. The load balancer should allow all public traffic (0.0.0.0/0) on port 80 inbound, which is the default HTTP port. Outbound, it will only be using port 80 to reach the internal servers.

4. The application needs to be deployed into private subnets with a Load Balancer located in a public subnet.

5. One of the output exports of the CloudFormation script should be the public URL of the LoadBalancer. Bonus points if you add http:// in front of the load balancer DNS Name in the output, for convenience.

<br >

### Project Setup

- A network stack is created with a Cloudformation script.

     ```./cliCommands/create.sh udacityCldDvpsC2NetworkStack network.yml network-parameters.json```


- A servers stack is created with a Cloudformation script:

    ```./cliCommands/create.sh udacityCldDvpsC2ServersStack servers.yml server-parameters.json```


- The update command can be run after updating the scripts:

    ```./cliCommands/update.sh udacityCldDvpsC2ServersStack servers.yml server-parameters.json```

- The delete command removes all the resources and the Cloudformation stack that was created:

    ```./cliCommands/delete.sh udacityCldDvpsC2ServersStack```

- You can visit the EC2 page in AWS console and click Load Balancer in the left panel. You can find the DNS name of load balancer under Description tab. The DNS name in my case is [http://udaci-webap-czffj7hi77p1-1772300060.eu-central-1.elb.amazonaws.com/](http://udaci-webap-czffj7hi77p1-1772300060.eu-central-1.elb.amazonaws.com/)

    **I have shared this link for reviewer in Udacity to check the result of my project. It will not be available when you click it in future, definitely, due to of its cost.**