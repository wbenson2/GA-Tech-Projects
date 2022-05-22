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

![Docker Container Snapshot](elk-docker-image-snapshot)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- _TODO: List the IP addresses of the machines you are monitoring_

We have installed the following Beats on these machines:
- _TODO: Specify which Beats you successfully installed_

These Beats allow us to collect the following information from each machine:
- _TODO: In 1-2 sentences, explain what kind of data each beat collects, and provide 1 example of what you expect to see. E.g., `Winlogbeat` collects Windows logs, which we use to track user logon events, etc._

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the _____ file to _____.
- Update the _____ file to include...
- Run the playbook, and navigate to ____ to check that the installation worked as expected.

_TODO: Answer the following questions to fill in the blanks:_
- _Which file is the playbook? Where do you copy it?_
- _Which file do you update to make Ansible run the playbook on a specific machine? How do I specify which machine to install the ELK server on versus which to install Filebeat on?_
- _Which URL do you navigate to in order to check that the ELK server is running?

_As a **Bonus**, provide the specific commands the user will need to run to download the playbook, update the files, etc._