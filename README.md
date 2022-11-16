
## Authors

- Ahmed Ali


## 🚀 About Me
I'm a DevOps Engineer...


# CICD Pipeline helloworld nodejs app using /Docker/Jenkins/Terraform/GKE with Slack Notification. (INFRA-REPO)


![image](https://drive.google.com/uc?export=view&id=1kfFk58q_RHBJKEIvW1BKi5RREnmaeA31)


## Demo
This Repo contains the infrastructure section of the CICD Pipeline project I'm gonna explain Terraform code to create Google Kuberentes Cluster and how to deploy Jenkins master and configure Jenkins Slave as a pod in Our Cluster.


Check application section in this Repo : https://github.com/Ahmed-Ali-Elbaz/APP-REPO-FINAL


## Tools

#### Terraform :

```http
  - Provision the infrastructure as a code.
```


#### Kubernetes :

```http
  - Where we will deploy Jenkins Master & Slave & helloworld app on it.
```

#### Jenkins :

```http
  - Create CICD pipeline to build and push the image of our helloworld app and integrate our pipeline with Slack.
```


## Terraform 
1- Configure the Provider (Google Cloud)
```bash
  # terrform init
```
![image](https://drive.google.com/uc?export=view&id=1FnFvZzTYkkEbWfo-opvKrpxv8sWgZEu9)


2- Create VPC with name "vpc_network"

![image](https://drive.google.com/uc?export=view&id=1dQYLBdKLpoMuncG8SNLXW3unqNiG7Qwj)

3- Create 2 Subnets (management-subnet) where we will create bastion VM in it & (restricted-subnet) will contain our private cluster

![image](https://drive.google.com/uc?export=view&id=1XTkZVE91ZE62n5W1BsKQjXoxLH3DBnor)

4- Create a VM act as a bastion in Management subnet to access the private cluster

![image](https://drive.google.com/uc?export=view&id=1IGktWw5bOTG11RPkDCn4aj7MYqaoUJn7)
 
5- Create NAT Gateway to allow our bastion & cluster to access internet.

![image](https://drive.google.com/uc?export=view&id=1Rq18cnqhOWcwyaH3PCJ5Hl5gqqYeVdfT)

6- Create Firewall allow SSH to our VM

![image](https://drive.google.com/uc?export=view&id=17VzoOSv_8egeUgzN1X5jLMCU9dPNargd)

7- Create a Service Account with Role "container.admin" which we will give it to our VM and Jenkins to Access our GKE Cluster

![image](https://drive.google.com/uc?export=view&id=1tLv8yvnQtFKEfpnfJSFEzO0HaQ6VVOwz)

7- Create a Service Account with Role "container.admin" which we will give it to our VM and Jenkins to Access our GKE Cluster

![image](https://drive.google.com/uc?export=view&id=1tLv8yvnQtFKEfpnfJSFEzO0HaQ6VVOwz)

8- Create a Private cluster with  Service Account

![image](https://drive.google.com/uc?export=view&id=1DBA_HtyioU9QOMuSWvz2IQNJaLv5wmML)

![image](https://drive.google.com/uc?export=view&id=1Z1L6ZYFM8A7yM-FmqCwRcp-JOwGhbUnL)

![image](https://drive.google.com/uc?export=view&id=1FsTGZzDsPQqYFUAeYYqmu7rOBSvOnmPn)









## Jenkins deployment files
1- Create a custom image for Jenkins Slave with docker & kubectl & gcloud & openssh
   Create a custom image for Jenkins Master with kubectl in case we user master for any reason I will install docker on it using init container in the next step
```bash
  # docker build . -t ahmedhedihed/jenkinsmaster:v1
  # docker build . -t ahmedhedihed/jenkinsslave:v1
  # docker push ahmedhedihed/jenkinsmaster:v1
  # docker push ahmedhedihed/jenkinsslave:v1
```
![image](https://drive.google.com/uc?export=view&id=12AYgwHxeZg8u8asDqcuSZv0_pGNPtPEp)
![image](https://drive.google.com/uc?export=view&id=1xw5hM4sjgdi0fSgQaWhfqD6Hjrkv7KP9)

![image](https://drive.google.com/uc?export=view&id=1txFLVJqvEfP-RW0KslyV-_8nIshIOtcg)

2- Create a deployment files for Jenkins Master & Jenkins Slave and we will run these commands from bastion vm to deploy them on the Cluster
```bash
  # kubectl create ns jenkins
  # kubectl apply -f master.yaml
  # kubectl apply -f slave.yaml
```
![image](https://drive.google.com/uc?export=view&id=1P8b7OWmLx4BYwvfmZ5oAIKbpFMAbytVp)

![image](https://drive.google.com/uc?export=view&id=1Kqzx_jux7tJYL8NAxpeiW6bjofoQL6h9)

![image](https://drive.google.com/uc?export=view&id=19MIp9bv2sUjVicomw06IEZjQ8awyRD-n)

3- I will configure Jenkins master with Password and a new user

![image](https://drive.google.com/uc?export=view&id=1wWSqq1Onnbqx85NCOa3INAa6iOwbKbtp)

4- I will configure the Jenkins slave pod as a slave to jenkins to run pipeline on it and I will exec to it to start ssh and create a Password for jenkins user which we will use it to configure this node on jenkins
```bash
  # kubectl exec -it <slave pod name> bash -n jenkins

```
![image](https://drive.google.com/uc?export=view&id=1lJoTmoQh8o0pZ7403tc21cdEdB397iR-)

![image](https://drive.google.com/uc?export=view&id=1VK7sXQMxCGvZEjADUZ9RQU2n5HY0KX1-)

![image](https://drive.google.com/uc?export=view&id=1WP-TxvS7Uv0x-egqAbneTLwDFfJlFCmM)

5- I will Create a new pipeline to deploy our helloworld node.js app

![image](https://drive.google.com/uc?export=view&id=1V-ZGysttM_GahLHYzbD1psFQJrvkRHq9)

6- I will install Slack Notifications plugin and configure it to be used in our pipeline/ test connection (Success)

![image](https://drive.google.com/uc?export=view&id=1CzTbyCfnKH-Lcydpn0DfJMTpbfMIW3lc)

## Appendix

Pipeline script will be in application section in this Repo : https://github.com/Ahmed-Ali-Elbaz/APP-REPO-FINAL
