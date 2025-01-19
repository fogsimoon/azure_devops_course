# Azure Compute Services Practical tasks

**Practical Task 1: Linux Virtual Machine Setup and NSG Configuration**

*Create and configure a Linux Virtual Machine (VM) on Azure and secure it with a Network Security Group (NSG)*

Create a Linux VM (Ubuntu or CentOS) in Azure

![Task](linux_vm_setup_and_nsg_conf/create_vm_basics.png)

![Task](linux_vm_setup_and_nsg_conf/create_vm_basics1.png)

![Task](linux_vm_setup_and_nsg_conf/create_vm_basics2.png)

![Task](linux_vm_setup_and_nsg_conf/create_vm_disks.png)

![Task](linux_vm_setup_and_nsg_conf/create_vm_networking.png)

Connect to the VM via SSH using a public-private key pair

![Task](linux_vm_setup_and_nsg_conf/access_via_ssh.png)

Install and configure an Nginx web server on the VM

![Task](linux_vm_setup_and_nsg_conf/install_nginx.png)

Create and configure a Network Security Group (NSG) to allow only HTTP (port 80) and SSH (port 22) traffic

![Task](linux_vm_setup_and_nsg_conf/create_nsg.png)

![Task](linux_vm_setup_and_nsg_conf/allow_http.png)

![Task](linux_vm_setup_and_nsg_conf/allow_ssh.png)

![Task](linux_vm_setup_and_nsg_conf/assign_subnet.png)

Test access to the Nginx web server from a browser

![Task](linux_vm_setup_and_nsg_conf/test_access_to_vm.png)

Verify that any other ports are blocked by the NSG

![Task](linux_vm_setup_and_nsg_conf/check_ports.png)

**Practical Task 2: Windows Virtual Machine and RDP Access Setup**

*Set up a Windows Virtual Machine (VM) on Azure and configure access via Remote Desktop Protocol (RDP)*

Create a Windows VM (e.g., Windows Server 2019) in Azure

![Task](windows_vm_and_rdp_access_setup/create_vm_basics.png)

Enable and configure Remote Desktop Protocol (RDP) for secure access to the VM

![Task](windows_vm_and_rdp_access_setup/create_vm_basics1.png)

![Task](windows_vm_and_rdp_access_setup/create_vm_disks.png)

![Task](windows_vm_and_rdp_access_setup/create_vm_networking.png)

Connect to the VM via RDP using Azure credentials

![Task](windows_vm_and_rdp_access_setup/connect_to_vm.png)

Install a web server role (IIS) and deploy a simple test HTML page

![Task](windows_vm_and_rdp_access_setup/install_iis.png)

![Task](windows_vm_and_rdp_access_setup/setup_app.png)

![Task](windows_vm_and_rdp_access_setup/enable_browsing.png)

Verify access to the test page from a browser

![Task](windows_vm_and_rdp_access_setup/verify_access.png)

Ensure that unnecessary ports are closed, allowing only RDP (port 3389) and HTTP (port 80)

![Task](windows_vm_and_rdp_access_setup/check_ports.png)

**Practical Task 3: Configuring an Azure Load Balancer**

*Create and configure a Basic Azure Load Balancer to distribute traffic across multiple virtual machines*

Create two Linux virtual machines in the same region and virtual network using the Azure Free Tier

VM1 creation

![Task](load_balancer/create_vm1_basics.png)

![Task](load_balancer/create_vm1_disks.png)

![Task](load_balancer/create_vm1_networking.png)

VM2 creation

![Task](load_balancer/create_vm2_basics.png)

![Task](load_balancer/create_vm2_disks.png)

![Task](load_balancer/create_vm2_networking.png)

Install and configure a web server (e.g., Nginx on Linux or IIS on Windows) on both VMs with unique content for testing

![Task](load_balancer/connect_to_vm1.png)

![Task](load_balancer/install_nginx_vm1.png)

![Task](load_balancer/connect_to_vm2.png)

![Task](load_balancer/install_nginx_vm2.png)

Create a Basic Load Balancer in Azure (included in the free tier) and configure it to balance HTTP (port 80) traffic between the two virtual machines

![Task](load_balancer/create_lb.png)

![Task](load_balancer/conf_pub_ip.png)

![Task](load_balancer/backendpool.png)

Configure a health probe to monitor the availability of the VMs

![Task](load_balancer/conf_health_probe.png)

Test the Load Balancer by accessing its public IP address from a browser and verify that traffic is routed to both VMs (by observing the unique content from each server)

![Task](load_balancer/lb_frontend_ip.png)

![Task](load_balancer/test_vm1.png)

![Task](load_balancer/test_vm2.png)

Verify that the Load Balancer removes unavailable VM from the traffic pool when it fails the health probe

![Task](load_balancer/lb_health_status_before.png)

Stop VM2

![Task](load_balancer/stop_vm2.png)

![Task](load_balancer/lb_health_status_after.png)

**Practical Task 4: Configuring a Basic Load Balancer with Virtual Machine Scale Sets (VMSS)**

*Set up a Basic Azure Load Balancer to distribute traffic across a Virtual Machine Scale Set (VMSS)*

Create a Virtual Machine Scale Set (VMSS) in Azure using Linux or Windows instances within the free tier (for example B1s size). Limit the scale set to two VM instances to avoid exceeding the free-tier 750-hour limit

![Task](load_balancer_and_vmss/create_vmss_basics.png)

![Task](load_balancer_and_vmss/create_vmss_basics1.png)

![Task](load_balancer_and_vmss/create_vmss_disks.png)

![Task](load_balancer_and_vmss/create_vmss_networking.png)

Configure the Basic Load Balancer to distribute HTTP (port 80) traffic across the VM instances in the scale set and add a health probe to monitor the availability of instances in the VMSS

![Task](load_balancer_and_vmss/create_lb.png)

Add a custom configuration to install and configure a Nginx web server on each Linux VM instance

![Task](load_balancer_and_vmss/add_script.png)

Load balancer health status with two VMs in the scale set

![Task](load_balancer_and_vmss/lb_health_status.png)

Scale the VMSS manually by increasing the number of instances to verify the Load Balancer routes traffic to the newly added VMs

![Task](load_balancer_and_vmss/manual_scaling.png)

![Task](load_balancer_and_vmss/vms_after_scaling.png)

Newly added VM

![Task](load_balancer_and_vmss/new_vm.png)

Test the setup by accessing the Load Balancer's public IP address and verifying traffic distribution across multiple VM instances

![Task](load_balancer_and_vmss/lb_pub_ip.png)

Test access to the newly added VM

![Task](load_balancer_and_vmss/test_access_to_added_vm.png)

Verify that the Load Balancer removes an unavailable instance from the traffic pool when it fails the health probe

![Task](load_balancer_and_vmss/health_status_before.png)

![Task](load_balancer_and_vmss/stop_vm2.png)

![Task](load_balancer_and_vmss/health_status_after.png)

**Practical Task 5: Deploying a Web Application Using Azure App Services**

*Set up and deploy a simple web application using Azure App Services*

Create an Azure App Service (Web App) using the Azure Free Tier. Select the runtime stack of your choice (e.g., .NET, Python, Node.js) during the setup

![Task](web_app_and_azure_app_services/create_webapp.png)

Link GitHub repository to deploy code to Azure App Service

![Task](web_app_and_azure_app_services/github_integration.png)

Develop or use a sample web application (e.g., a "Hello World" app)

![Task](web_app_and_azure_app_services/added_logs.png)

Push code and trigger deployment

![Task](web_app_and_azure_app_services/deploy_app.png)

Test the deployed application by accessing its URL provided by Azure App Services

![Task](web_app_and_azure_app_services/test_deployed_app.png)

Enable App Service Logs

![Task](web_app_and_azure_app_services/enable_logging.png)

Verify that application logs are being generated

![Task](web_app_and_azure_app_services/verify_generated_app_logs.png)

**Practical Task 6: Creating and Deploying an Azure Function to Process HTTP Requests**

*Set up and deploy an Azure Function that processes HTTP requests directly from the Azure portal*

Create a new Function App using the Consumption (Serverless) plan within the free tier. Select the HTTP trigger template. Choose a language of your choice (e.g., C#, JavaScript, or Python)

![Task](azure_function/create_func.png)

Test the function using the Test/Run feature in the Azure portal to send HTTP requests

![Task](azure_function/test_func_input.png)

Verify the Function responds appropriately with and without the name parameter

![Task](azure_function/test_func_output.png)

Test the Function using a browser or a tool like Postman to ensure it's externally accessible

![Task](azure_function/test_func_postman.png)

![Task](azure_function/test_func_postman_name.png)

Check metrics like execution count, response time, and errors in the the Monitor tab of the Function App

![Task](azure_function/execution_count.png)

![Task](azure_function/response_time.png)
