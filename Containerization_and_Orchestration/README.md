# Containerization and Orchestration_Practical Tasks

**Practical Task 1: Deploy a Docker Container to Azure Container Instances (ACI) via Azure Portal**

**Requirements:**

1. Create a lightweight Docker image for a simple web application (e.g., a Python Flask app)
with minimal dependencies to reduce resource usage.
2. Push the Docker image to Azure Container Registry (ACR) using a low-cost storage option.
3. Use a lightweight ACI instance (e.g., B1s) to deploy the Docker container from ACR.
4. Verify the deployment by accessing the web application via the public IP address provided
by ACI.
5. Remove the ACI container after verifying the deployment to stop billing.

App used for deployment: https://github.com/patrickloeber/flask-todo

![Task](aci/cr1.png)

![Task](aci/cr2.png)

![Task](aci/df.png)

![Task](aci/code_env.png)

![Task](aci/bsenv.png)

![Task](aci/bdf.png)

![Task](aci/timg.png)

![Task](aci/pimg.png)

![Task](aci/repo.png)

![Task](aci/ins1.png)

![Task](aci/ins2.png)

![Task](aci/ins3.png)

![Task](aci/app1.png)

![Task](aci/app2.png)

**Practical Task 2: Configure Environment Variables in ACI via Azure Portal**

**Requirements:**

1. Modify your Docker image to read configuration values from environment variables,
ensuring minimal environmental complexity.
2. Reuse the ACI instance from Task 1 to deploy the container and specify the necessary
environment variables.
3. Verify that the application is correctly using the environment variables by checking its
output.
4. Remove the ACI container after verifying that the application correctly uses the
environment variables.

![Task](aci_env/bim.png)

![Task](aci_env/pim.png)

![Task](aci_env/ci1.png)

![Task](aci_env/ci2.png)

![Task](aci_env/ci3.png)

![Task](aci_env/ci4.png)

![Task](aci_env/app1.png)

![Task](aci_env/app2.png)

**Practical Task 3: Scale Out with Azure Container Instances via Azure Portal**

**Requirements:**

1. Deploy a stateless Docker container to Azure Container Instances using a lightweight
configuration (e.g., B1s instances).
2. Manually scale out to the minimum number of instances required (e.g., 2–3) to test load
distribution.
3. Stop all ACI instances after completing the testing to reduce ongoing costs.

![Task](aci_scale/df.png)

![Task](aci_scale/ind.png)

![Task](aci_scale/enp.png)

![Task](aci_scale/pim.png)

![Task](aci_scale/ci1.png)

![Task](aci_scale/ci2.png)

![Task](aci_scale/ci3.png)

![Task](aci_scale/ci4.png)

![Task](aci_scale/h1.png)

![Task](aci_scale/ci5.png)

![Task](aci_scale/ci6.png)

![Task](aci_scale/ci7.png)

![Task](aci_scale/h2.png)

**Practical Task 4: Secure a Docker Container in ACI with Managed Identity via Azure Portal**

**Requirements:**

1. Deploy a Docker container to Azure Container Instances using the existing lightweight ACI
setup from previous tasks.
2. Configure a Managed Identity for the ACI and securely access an Azure service (e.g., Azure
Key Vault) with minimal permissions and access scope.
3. Retrieve only a single secret from Azure Key Vault for testing purposes.
4. Remove the ACI container after verifying secure access.

![Task](aci_secure/ci1.png)

![Task](aci_secure/ci2.png)

![Task](aci_secure/ci3.png)

![Task](aci_secure/sai.png)

![Task](aci_secure/kv.png)

![Task](aci_secure/kv1.png)

![Task](aci_secure/scr.png)

![Task](aci_secure/kv_sh.png)

**Practical Task 5: Deploy a Kubernetes Cluster with AKS via Azure Portal**

**Requirements:**

1. Create an Azure Kubernetes Service (AKS) cluster with the smallest VM size (e.g., B2s) and
the minimum number of nodes (e.g., 1–2).
2. Connect to the AKS cluster using Azure Cloud Shell with kubectl.
3. Deploy a lightweight Nginx application for verification.
4. Delete the AKS cluster immediately after testing to avoid additional VM and cluster costs.

![Task](aks/ind.png)

![Task](aks/df.png)

![Task](aks/bim.png)

![Task](aks/cr.png)

![Task](aks/pim.png)

![Task](aks/repo.png)

![Task](aks/cl.png)

![Task](aks/cl1.png)

![Task](aks/cl2.png)

![Task](aks/cl3.png)

![Task](aks/cl4.png)

![Task](aks/cl5.png)

![Task](aks/nd.png)

![Task](aks/ns.png)

![Task](aks/apln.png)

![Task](aks/pods.png)

![Task](aks/pod1.png)

![Task](aks/pod2.png)

![Task](aks/pod3.png)

**Practical Task 6: Deploy a Containerized Application on AKS**

**Requirements:**

1. Build a lightweight Docker image for a simple web application (e.g., a Node.js app with
minimal dependencies) and push it to Azure Container Registry (ACR).
2. Reuse the AKS cluster from Task 5 to deploy the application using a Kubernetes deployment
and service manifest file.
3. Test the application for a limited time and remove the deployment afterward.

![Task](aks_app/serv.png)

![Task](aks_app/df.png)

![Task](aks_app/pim.png)

![Task](aks_app/repo.png)

![Task](aks_app/mnfs.png)

![Task](aks_app/apls.png)

![Task](aks_app/app.png)

**Practical Task 7: Configure and Use ConfigMaps and Secrets in AKS**

**Requirements**

1. Create a ConfigMap to store non-sensitive configuration data with only the required keyvalue pairs for the application.
2. Create a Kubernetes Secret to store sensitive data (e.g., API keys) with the least amount of
information needed.
3. Update the application deployment to use the ConfigMap and Secret.
4. Remove the ConfigMap, Secret, and deployment after testing.

App used for deployment: https://github.com/davidarchanjo/spring-boot-crud-rest

![Task](aks_confmap_secr/appyml.png)

![Task](aks_confmap_secr/df.png)

![Task](aks_confmap_secr/dcmp.png)

![Task](aks_confmap_secr/env.png)

![Task](aks_confmap_secr/cr.png)

![Task](aks_confmap_secr/pim.png)

![Task](aks_confmap_secr/cl.png)

![Task](aks_confmap_secr/cl1.png)

![Task](aks_confmap_secr/conf.png)

![Task](aks_confmap_secr/scr.png)

![Task](aks_confmap_secr/postgr.png)

![Task](aks_confmap_secr/postgrsvc.png)

![Task](aks_confmap_secr/app.png)

![Task](aks_confmap_secr/appsvc.png)

![Task](aks_confmap_secr/apls.png)

![Task](aks_confmap_secr/check.png)

**Practical Task 8: Scale Applications in AKS**

**Requirements:**

1. Deploy a stateless application to the AKS cluster using minimal resource specifications.
2. Use the kubectl scale command to manually scale the application to only 2–3 replicas for
testing.
3. Set up Horizontal Pod Autoscaler (HPA) with reasonable CPU usage thresholds to minimize
pod creation.
4. Simulate load on the application for a short duration and remove the deployment after
observing the scaling behavior.

![Task](aks_scale/mnfs.png)

![Task](aks_scale/scl.png)

![Task](aks_scale/svc.png)

![Task](aks_scale/mtrserv.png)

![Task](aks_scale/load.png)

![Task](aks_scale/hpa.png)

![Task](aks_scale/depl.png)

![Task](aks_scale/depldesc.png)

![Task](aks_scale/deplaft.png)

**Practical Task 9: Rolling Update of an Application in AKS**

**Requirements:**

1. Deploy a lightweight version of your application to the AKS cluster.
2. Update the Docker image to a new version with minimal changes (e.g., color change).
3. Perform a rolling update using kubectl set image with minimal replicas to reduce resource
usage.
4. Verify the update process quickly and remove the deployment after the update.

![Task](aks_rolling/ind.png)

![Task](aks_rolling/df.png)

![Task](aks_rolling/mnfs.png)

![Task](aks_rolling/apls.png)

![Task](aks_rolling/v1.png)

![Task](aks_rolling/ind1.png)

![Task](aks_rolling/pim.png)

![Task](aks_rolling/imgs.png)

![Task](aks_rolling/rollout.png)

![Task](aks_rolling/pod.png)

![Task](aks_rolling/depl.png)

**Bonus task. GitOps with AKS**

**Requirements:**

1. Setup ArgoCD on Azure Kubernetes Services
2. Perform image update on cluster

![Task](gitops/ngdpl.png)

![Task](gitops/ngsvc.png)

![Task](gitops/appl.png)

![Task](gitops/argoapl.png)

![Task](gitops/argosvc.png)

![Task](gitops/argopod.png)

![Task](gitops/argosecr.png)

![Task](gitops/repo.png)

![Task](gitops/depl1.png)

![Task](gitops/events.png)

![Task](gitops/depls.png)

![Task](gitops/v1.png)

![Task](gitops/upgv2.png)

![Task](gitops/depl2.png)

![Task](gitops/v2.png)

