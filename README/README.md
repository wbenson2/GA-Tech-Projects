## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![Network Diagram](https://github.com/wbenson2/GA-Tech-Projects/blob/main/Diagrams/AzureNetworkGroupwithDocker.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the playbook file may be used to install only certain pieces of it, such as Filebeat.

  - _[Elk Install](https://github.com/wbenson2/GA-Tech-Projects/blob/main/Ansible/Intall-elk.yml.txt)_
  - _[Filebeat Install](https://github.com/wbenson2/GA-Tech-Projects/blob/main/Ansible/filebeat-playbook.yml.txt)_
  - _[Metricbeat Install](https://github.com/wbenson2/GA-Tech-Projects/blob/main/Ansible/metricbeat-playbook.yml.txt)_
  - _[DVWA Install](https://github.com/wbenson2/GA-Tech-Projects/blob/main/Ansible/dvwa_playbook.yml.txt)_

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly resilient, in addition to restricting access to the network.
- _Load balancers distributes netword traffic accross multiple servers which ensures no single serve bears too much demand._
- _Load balancers shift an attackers traffic from local machines and directs it to the public balancer._ 
- _A jump box serves as a gatway to gain entry into a remote netowrk. It allows ssh access to a trusted public key and prevents access to users without the key._

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the log files and system resources.
- _Filebeat watches for system log changes._
- _Metricbeat reports on system resource usage._

The configuration details of each machine may be found below.

| Name     | Function    | IP Address | Operating System |
|----------|-------------|------------|------------------|
| Jump Box | Gateway     | 10.0.0.4   | Linux            |
| Web-1    | Web Server  | 10.0.0.5   | Linux            |
| Web-2    | Web Server  | 10.0.0.6   | Linux            |   
| Web-3    | Web Server  | 10.0.0.7   | Linux            |
| Elk      | Kibana      | 10.1.0.5   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the jumpbox machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- _99.96.118.27_

Machines within the network can only be accessed by the jumpbox.
- _Jumpbox_
- _Public IP Address: 20.213.149.171_
- _Private IP Address: 10.0.0.4_

A summary of the access policies in place can be found in the table below.

| Name        | Publicly Accessible | Allowed IP Addresses    |
|-------------|---------------------|-------------------------|
| Jump Box    | Yes                 | 99.96.118.27            |
| Web 1,2 & 3 | No                  | Red-Team-LB 20.92.95.25 |
| Red-Team-LB | Yes                 | 20.92.95.25             |
| Elk         | Yes                 | 20.70.100.255:5601      |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- _the deployment can scale to a larger infrastructure without the need to deploy the configuration manually to individual machines._

The playbook implements the following tasks:
- _Install docker.io_
- _Install python3.pip_
- _Install the neccesary docker component module_
- _Increase virtual memory so that Docker Image has enough memory to launch_ 
- _Use the memory that the above command increased_
- _Download and launch the docker elk container using image sepb/elk:761_
- _Automatically enable docker service on system boot_

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![Docker Container Snapshot](https://github.com/wbenson2/GA-Tech-Projects/blob/main/Images/elk-docker-image-snapshot.png)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _10.0.0.5_
- _10.0.0.6_
- _10.0.0.7_

We have installed the following Beats on these machines:
- _Filebeat_
- _Metricbeat_

These Beats allow us to collect the following information from each machine:
- _Filebeat ships system log files to Elk Stack so that further analysis can be conducted. One thing that file beats logs is SSH login attempts. The Kibana dashboard will show you the time the login occured, if it was succesful, who logged in and what the IP address was._
- _Metricbeat collects system data such as CPU or memory usage and ships it to Elk Stack so further analysis can be conducted. An example of what metricbeat shows is the number of containers that are currently running or stopped._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the install-elk.yml file to /etc/ansible
- Update the /etc/ansible/hosts file to include the below sample command. Your IP address that you will specify is the private IP of your Elk VM:

-![Ansible Host File Elk Configure](https://github.com/wbenson2/GA-Tech-Projects/blob/main/Images/elk_configure.png) 
- Run the playbook, and navigate to http://[your_elk_server_ip]:5601/app/kibanato check that the installation worked as expected.

### Installing Elk

- Download the install-elk.yml playbook by running the command curl https://github.com/wbenson2/GA-Tech-Projects/blob/main/Ansible/install-elk.yml.txt > /etc/ansible
- Update the /etc/ansible/hosts file to include the below sample command. Your IP address that you will specify is the private IP of your Elk VM:

- ![Ansible Host File Elk Configure](https://github.com/wbenson2/GA-Tech-Projects/blob/main/Images/elk_configure.png)

- [Example Host File](https://github.com/wbenson2/GA-Tech-Projects/blob/main/Ansible/hosts.txt)
- _As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._