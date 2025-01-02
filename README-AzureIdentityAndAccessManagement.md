# Azure Identity and Access Management tasks

**Practical Task 1: Introduction to Microsoft Entra ID**

Create a basic Microsoft Entra ID setup for an organization to manage identity and access

*1. Create a new Microsoft Entra ID tenant*

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/create_tenant.png)

*2. Add at least two users to the directory.*

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/add_user1.png)

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/add_user2.png)

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/all_users.png)

*3. Create two groups named Developers and Admins.*

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/create_admins_group.png)

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/create_developers_group.png)

*4. Assign the users to appropriate groups.*

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/assign_user_to_developers.png)

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/assign_user_to_admins.png)

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/developers_user.png)

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/admins_user.png)

*5. Assign the Global Reader role to the Admins group.*

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/assign_global_reader_to_admins.png)

*6. Assign the Application Developer role to the Developers group.*

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/assign_application_developer_to_developers.png)

*7. Verify that the role assignments function as expected for both groups.*

Admins role verification: 

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/verify_admins_role.png)

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/verify_admins_role2.png)

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/verify_admins_role3.png)

Developers role verification:

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/verify_developers_role.png)

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/verify_developers_role1.png)

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/verify_developers_role2.png)

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/verify_developers_role3.png)

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/verify_developers_role4.png)

![Task](Azure_Identity_and_Access_Management/intro_to_microsoft_entra_id/verify_developers_role5.png)


**Practical Task 2: Enabling Single Sign-On (SSO) and Multi-Factor Authentication (MFA)**

Configure Single Sign-On (SSO) and Multi-Factor Authentication (MFA) for users in a Microsoft Entra ID
directory to enhance identity and access security

*1. Enable Single Sign-On (SSO) for your Microsoft Entra ID tenant.*

![Task](Azure_Identity_and_Access_Management/sso_and_mfa/dropbox_single_sign_on_app_reg.png)

![Task](Azure_Identity_and_Access_Management/sso_and_mfa/add_assignment.png)

![Task](Azure_Identity_and_Access_Management/sso_and_mfa/identity_provider_configuration.png)

![Task](Azure_Identity_and_Access_Management/sso_and_mfa/service_provider_configuration.png)

*2. Enforce Multi-Factor Authentication (MFA) for all users in the directory*

![Task](Azure_Identity_and_Access_Management/sso_and_mfa/conditional_access_users.png)

![Task](Azure_Identity_and_Access_Management/sso_and_mfa/conditional_access_grant.png)

![Task](Azure_Identity_and_Access_Management/sso_and_mfa/conditional_access_session.png)

*3. Configure conditional access policies to require MFA for high-risk sign-ins.*

![Task](Azure_Identity_and_Access_Management/sso_and_mfa/conditional_access_sign_in_risk.png)

*4. Verify that SSO and MFA settings are correctly applied for the users.*

![Task](Azure_Identity_and_Access_Management/sso_and_mfa/mfa_sign_in_as_group_user.png)

![Task](Azure_Identity_and_Access_Management/sso_and_mfa/mfa_code.png)

![Task](Azure_Identity_and_Access_Management/sso_and_mfa/sign_in_dropbox.png)

**Practical Task 3: Implementing Role-Based Access Control (RBAC)**

Implement Role-Based Access Control (RBAC) in Azure to manage access to resources based on roles and
ensure fine-grained access management.

*1. Create a custom role named Resource Viewer with read-only permissions for a specific resource
group.*

![Task](Azure_Identity_and_Access_Management/rbac/create_custom_role.png)

*2. Assign the Resource Viewer role to the Developers group created earlier.*

![Task](Azure_Identity_and_Access_Management/rbac/assign_resource_viewer_to_developers.png)

![Task](Azure_Identity_and_Access_Management/rbac/assign_resource_viewer_to_developers1.png)

![Task](Azure_Identity_and_Access_Management/rbac/assign_resource_viewer_to_developers2.png)

*3. Assign the built-in Contributor role to the Admins group for the same resource group.*

![Task](Azure_Identity_and_Access_Management/rbac/assign_contributor_to_admins.png)

![Task](Azure_Identity_and_Access_Management/rbac/assign_contributor_to_admins1.png)

![Task](Azure_Identity_and_Access_Management/rbac/assign_contributor_to_admins2.png)

*4. Verify that members of the Developers group have only read access and members of the Admins
group have full access to the resource group.*

Verify Developers member access:

![Task](Azure_Identity_and_Access_Management/rbac/developers_read_access_test.png)

Verify Admins member access:

![Task](Azure_Identity_and_Access_Management/rbac/admins_full_access_test.png)

![Task](Azure_Identity_and_Access_Management/rbac/admins_full_access_test1.png)

**Practical Task 4: Securing Sensitive Information with Azure Key Vault**

Set up Azure Key Vault to securely store and manage sensitive information such as keys, secrets, and
certificates.

*1. Create a new Azure Key Vault in your subscription.*

![Task](Azure_Identity_and_Access_Management/azure_key_vault/create_azure_key_vault.png)

*2. Add a secret to the Key Vault (e.g., a database connection string).*

![Task](Azure_Identity_and_Access_Management/azure_key_vault/add_a_secret.png)

*3. Set access policies to grant the Application Developer role (assigned to the Developers group)
permission to retrieve secrets from the Key Vault.*

![Task](Azure_Identity_and_Access_Management/azure_key_vault/set_access_policy.png)

![Task](Azure_Identity_and_Access_Management/azure_key_vault/set_access_policy1.png)

*4. Verify that only members of the Developers group can access the stored secret.*

Sign in as a Developer

![Task](Azure_Identity_and_Access_Management/azure_key_vault/sign_in_as_developers_user.png)

Sign in as an Admin

![Task](Azure_Identity_and_Access_Management/azure_key_vault/sign_in_as_admins_user.png)

**Practical Task 5: Creating and Assigning Basic Azure Policies**

Define and assign Azure Policies to enforce compliance with organizational standards for resource
management.

*1. Create an Azure Policy to enforce tagging for all newly created resources with a specific tag (e.g.,
Environment: Development).*

![Task](Azure_Identity_and_Access_Management/basic_azure_policies/create_policy_to_enforce_tagging.png)

*2. Assign the policy to a resource group.*

![Task](Azure_Identity_and_Access_Management/basic_azure_policies/assign_policy.png)

*3. Verify that any new resource created in the resource group without the required tag is marked as
non-compliant.*

![Task](Azure_Identity_and_Access_Management/basic_azure_policies/create_untagged_resource.png)

![Task](Azure_Identity_and_Access_Management/basic_azure_policies/deny_policy_action.png)

*4. Review and document the compliance status of the resource group.*

Add the required tag:

![Task](Azure_Identity_and_Access_Management/basic_azure_policies/add_required_tag.png)

![Task](Azure_Identity_and_Access_Management/basic_azure_policies/compliance_success_status.png)

**Practical Task 6: Using Policy Effects to Enforce Compliance**

Configure Azure Policies with different policy effects to enforce compliance and manage resources
according to organizational standards.

*1. Create a policy with the Audit effect to monitor and log untagged resources within a resource
group.*

![Task](Azure_Identity_and_Access_Management/policy_effects/create_audit_effect_policy.png)

![Task](Azure_Identity_and_Access_Management/policy_effects/assign_policy.png)

![Task](Azure_Identity_and_Access_Management/policy_effects/compliance_state1.png)

![Task](Azure_Identity_and_Access_Management/policy_effects/compliance_state2.png)

*2. Create a policy with the DeployIfNotExists effect to automatically add a specific tag (Owner: IT) to
any newly created resource.* 

The created policy is applied only to the resource type of the storage account:

![Task](Azure_Identity_and_Access_Management/policy_effects/create_deployIfNotExists_policy.png)

![Task](Azure_Identity_and_Access_Management/policy_effects/create_deployIfNotExists_policy1.png)

![Task](Azure_Identity_and_Access_Management/policy_effects/assign_deploy_policy.png)

![Task](Azure_Identity_and_Access_Management/policy_effects/policy_remediation.png)

![Task](Azure_Identity_and_Access_Management/policy_effects/created_storage.png)

![Task](Azure_Identity_and_Access_Management/policy_effects/compliance_state.png)

![Task](Azure_Identity_and_Access_Management/policy_effects/policy_remediation1.png)

![Task](Azure_Identity_and_Access_Management/policy_effects/remediation_task.png)

![Task](Azure_Identity_and_Access_Management/policy_effects/remediation_completed.png)

![Task](Azure_Identity_and_Access_Management/policy_effects/policy_completed_deployment.png)

![Task](Azure_Identity_and_Access_Management/policy_effects/deployed_storage.png)