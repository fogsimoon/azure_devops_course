# Azure Storage and Databases Practical tasks

**Practical Task 1: Upload and Retrieve Files with Azure Blob Storage**

*Use Azure Blob Storage for storing and retrieving files*

Create a new storage account in Azure

![Task](blob_upload_retrieve_files/create_storage_account.png)

Set up a Blob container named "my-container" with public access

![Task](blob_upload_retrieve_files/public_access.png)

Upload a sample text file to the Blob container using the Azure portal

![Task](blob_upload_retrieve_files/upload_file.png)


Use Azure Storage Explorer to manage and view blobs in your container

![Task](blob_upload_retrieve_files/sas.png)

![Task](blob_upload_retrieve_files/storage_explorer_connect.png)

![Task](blob_upload_retrieve_files/view_file.png)

Download the uploaded file to verify successful retrieval

![Task](blob_upload_retrieve_files/download_file.png)

**Practical Task 2: Lifecycle Management for Blob Storage**

*Implement lifecycle management policies to optimize storage costs*

Create a storage account and a Blob container named "lifecycle-container"

![Task](lifecycle_management_blob_storage/create_storage_account_basics.png)

![Task](lifecycle_management_blob_storage/create_storage_account_advanced.png)

![Task](lifecycle_management_blob_storage/create_storage_account_networking.png)

![Task](lifecycle_management_blob_storage/create_storage_account_encr.png)

![Task](lifecycle_management_blob_storage/create_container.png)


Upload multiple files of varying sizes to the container

![Task](lifecycle_management_blob_storage/upload_files.png)

Create a lifecycle management policy to move blobs to the Cool tier after 30 days and delete blobs older than 90 days

![Task](lifecycle_management_blob_storage/rule.png)

![Task](lifecycle_management_blob_storage/rule1.png)

Simulate policy execution by manually testing with different file creation timestamps and verify that blobs are moved or deleted according to the policy

![Task](lifecycle_management_blob_storage/cool_tier.png)

Enabled soft delete policy

![Task](lifecycle_management_blob_storage/enabled_soft_deletion.png)

List available blobs

![Task](lifecycle_management_blob_storage/list_blobs.png)

List deleted blobs

![Task](lifecycle_management_blob_storage/list_deleted_blobs.png)


**Practical Task 3: Implementing an Azure Queue for Message Storage**

*Create and manage an Azure Queue to store and process messages*

Create a storage account and enable the Queue service

![Task](queue_for_message_storage/create_storage_account.png)

![Task](queue_for_message_storage/create_storage_account1.png)

Create a queue named "task-queue"

![Task](queue_for_message_storage/create_queue.png)

Use Azure Storage Explorer or the Azure portal to add messages to the queue

![Task](queue_for_message_storage/add_message.png)

Retrieve and process messages directly using Azure Storage Explorer or the Azure portal interface

![Task](queue_for_message_storage/deque_message_explorer.png)

![Task](queue_for_message_storage/view_message.png)

![Task](queue_for_message_storage/deque_message.png)

Verify that processed messages are removed from the queue manually

![Task](queue_for_message_storage/empty_queue.png)

**Practical Task 4: Configuring Azure File Share and Mounting on a Local Machine**

*Set up and access Azure File Storage for shared file access*

Create a storage account and set up an Azure File Share

![Task](file_share_and_mounting_on_vm/create_fileshare.png)

Upload a file to the file share using the Azure portal

![Task](file_share_and_mounting_on_vm/upload_file.png)

Generate a connection script for Windows or Linux and use it to mount the file share on your local machine

![Task](file_share_and_mounting_on_vm/generate_script.png)

![Task](file_share_and_mounting_on_vm/create_vm.png)

Verify the mounted file share and ensure it displays the uploaded file

![Task](file_share_and_mounting_on_vm/run_script.png)

Add another file to the file share from the local machine and confirm it reflects in Azure

![Task](file_share_and_mounting_on_vm/create_file.png)

![Task](file_share_and_mounting_on_vm/verify_file.png)

**Practical Task 5: Storing and Querying Data with Azure Table Storage**

*Set up and use Azure Table Storage for structured data*

Create a storage account and enable the Table service

Create a table named "employee-data"

![Task](storing_and_quering_table_storage/create_table.png)

Add sample data (e.g., employee IDs, names, and roles) to the table using Azure Storage Explorer or Azure CLI

![Task](storing_and_quering_table_storage/add_columns_data.png)

![Task](storing_and_quering_table_storage/added_data.png)

![Task](storing_and_quering_table_storage/added_data1.png)

Query the table for specific data using filters (e.g., "Role = Developer")

![Task](storing_and_quering_table_storage/filter_by_role.png)

Delete specific entries from the table and verify the changes

![Task](storing_and_quering_table_storage/delete_row.png)

![Task](storing_and_quering_table_storage/verify_changes.png)

**Practical Task 6: Configuring Shared Access Signatures (SAS) for Secure Access**

*Secure Azure Storage services using SAS tokens*

Create a storage account with Blob, File, Queue, and Table services enabled

![Task](sas_for_secure_access/create_account.png)

![Task](sas_for_secure_access/create_account1.png)

![Task](sas_for_secure_access/create_account2.png)

Create a container

![Task](sas_for_secure_access/create_container.png)

Generate a Shared Access Signature (SAS) token for Blob storage with limited permissions (e.g., read-only access)

![Task](sas_for_secure_access/blob_storage_permissions.png)

![Task](sas_for_secure_access/generate_sas_for_blob.png)

Share the SAS token URL and verify access to the Blob container with the token

![Task](sas_for_secure_access/connect_to_blob_storage.png)

View blob properties

![Task](sas_for_secure_access/view_blob_properties.png)

![Task](sas_for_secure_access/upload_file_to_storage.png)

Failure to upload a file to the storage

![Task](sas_for_secure_access/upload_file_failure.png)

Repeat the process for File, Queue, and Table services with different permissions

File

![Task](sas_for_secure_access/generate_sas_for_file.png)

![Task](sas_for_secure_access/generate_sas_for_file1.png)

![Task](sas_for_secure_access/connect_to_fileshare.png)

![Task](sas_for_secure_access/update_file.png)

![Task](sas_for_secure_access/update_file1.png)

![Task](sas_for_secure_access/update_file2.png)

![Task](sas_for_secure_access/update_file3.png)

![Task](sas_for_secure_access/delete_file.png)

![Task](sas_for_secure_access/delete_file1.png)

![Task](sas_for_secure_access/add_custom_metadata.png)

![Task](sas_for_secure_access/add_custom_metadata1.png)

Queue storage

![Task](sas_for_secure_access/create_queue.png)

![Task](sas_for_secure_access/add_messages.png)

![Task](sas_for_secure_access/generate_sas_for_queue.png)

![Task](sas_for_secure_access/connect_to_queue.png)

![Task](sas_for_secure_access/view_queue_messages.png)

![Task](sas_for_secure_access/add_message_to_queue.png)

![Task](sas_for_secure_access/view_queue_messages_explorer.png)

![Task](sas_for_secure_access/dequeue_message_from_queue.png)

![Task](sas_for_secure_access/dequeue_message_from_queue1.png)

Table storage

![Task](sas_for_secure_access/create_table.png)

![Task](sas_for_secure_access/connect_to_table.png)

![Task](sas_for_secure_access/add_record_to_table.png)

![Task](sas_for_secure_access/update_record_in_table.png)

![Task](sas_for_secure_access/update_record_in_table1.png)

![Task](sas_for_secure_access/delete_record_from_table.png)

![Task](sas_for_secure_access/delete_record_from_table1.png)

**Practical Task 7: Implementing Security Best Practices with Azure RBAC and Managed Identities**

*Securely manage access to Azure resources and integrate services using Managed Identities*

1.Configure Azure RBAC for a Storage Account:

Create a storage account named "secure-storage"

![Task](rbac_and_managed_identity/create_storage_acc1.png)

![Task](rbac_and_managed_identity/create_storage_acc2.png)

Add a user or service principal with Storage Blob Data Contributor role

![Task](rbac_and_managed_identity/storage_contributor.png)

![Task](rbac_and_managed_identity/contributor_login.png)

Verify that the user or service principal can upload and download blobs to the account

![Task](rbac_and_managed_identity/file_upload.png)

![Task](rbac_and_managed_identity/success_file_upload.png)

![Task](rbac_and_managed_identity/file_download.png)

Attempt access with an unauthorized user and verify access is denied

![Task](rbac_and_managed_identity/reader_user.png)

![Task](rbac_and_managed_identity/reader_login.png)

![Task](rbac_and_managed_identity/unauthorized_access.png)

2.Set Up a Managed Identity for an Azure Virtual Machine:

Create an Azure Virtual Machine (VM) with a system-assigned Managed Identity enabled

![Task](rbac_and_managed_identity/create_vm_basics.png)

![Task](rbac_and_managed_identity/create_vm_disks.png)

![Task](rbac_and_managed_identity/create_vm_netw.png)

![Task](rbac_and_managed_identity/create_vm_management.png)

Assign the Storage Blob Data Reader role to the Managed Identity for "securestorage"

![Task](rbac_and_managed_identity/assign_blob_reader.png)

Connect to the VM and verify that the Managed Identity can access blob data using Azure CLI or a pre-installed script

![Task](rbac_and_managed_identity/create_script.png)

![Task](rbac_and_managed_identity/list_blobs.png)

**Practical Task 8: Creating and Querying an Azure SQL Database**

*Learn to create and query an Azure SQL Database using the Azure portal*

Create an Azure SQL Database named "test-db" in a new logical SQL server. Set the pricing tier to the free tier for cost optimization

![Task](sql_db/create_db.png)

![Task](sql_db/create_db1.png)

![Task](sql_db/create_server.png)


Use the Query Editor in the Azure portal to create a table named "Products" with columns for ID, Name, and Price
Insert a few sample records into the "Products" table using a SQL query
Query the table to display all records and verify the data

![Task](sql_db/query_db.png)

**Practical Task 9: Deploying an Azure SQL Database with Automated Backup Configuration**

*Set up an Azure SQL Database and configure automated backups*

Create an Azure SQL Database in a new or existing resource group

Choose the desired service tier (e.g., Basic or General Purpose)

![Task](sql_db_and_automated_backup/create_db.png)

![Task](sql_db_and_automated_backup/create_db_netw.png)

![Task](sql_db_and_automated_backup/create_db_security.png)

![Task](sql_db_and_automated_backup/create_db_additional.png)

![Task](sql_db_and_automated_backup/db_server.png)

![Task](sql_db_and_automated_backup/add_data.png)

Enable and configure long-term backup retention for the database

![Task](sql_db_and_automated_backup/conf_backup.png)

Use the Azure portal to verify backup settings and review available restore points

![Task](sql_db_and_automated_backup/restore_point.png)

Test the restore process by creating a new database from a backup

![Task](sql_db_and_automated_backup/restore_db.png)

![Task](sql_db_and_automated_backup/restore_db1.png)

![Task](sql_db_and_automated_backup/check_restored_db_table.png)

**Practical Task 10: Getting Started with Cosmos DB**

*Set up and explore Cosmos DB by creating a database, managing data, querying, and testing key features like consistency and global distribution*

1.Create a Cosmos DB Account:

Create a new Cosmos DB account in the Azure portal using the Core (SQL) API

Select a region for the account and use the default settings

Review key features like throughput, consistency levels, and global distribution

Note down the primary and secondary keys for the account

![Task](cosmos_db/create_db_acc_basics.png)

![Task](cosmos_db/create_db_acc_distr.png)

![Task](cosmos_db/create_db_acc_netw.png)

![Task](cosmos_db/keys.png)

2.Set Up a Database and Container:

Create a database named "SampleDB" in the Cosmos DB account

Add a container named "Items" with the partition key set to /category

Use the default throughput settings for the database and container

![Task](cosmos_db/create_db_and_container.png)

Insert Data Using Data Explorer:

Open the Data Explorer in the Azure portal

Insert at least three sample JSON documents into the "Items" container

![Task](cosmos_db/sample_json.png)

Verify that the documents are successfully added and visible in the Data Explorer

![Task](cosmos_db/inserted_jsons.png)

Query Data in Cosmos DB:

Use SQL-like queries in the Data Explorer to retrieve data:

Retrieve all documents: SELECT * FROM c

![Task](cosmos_db/inserted_jsons.png)

Retrieve specific documents: SELECT * FROM c WHERE c.category = 'Electronics

![Task](cosmos_db/select_by_category.png)

Configure and Test Consistency Levels:

Review the available consistency levels in the Cosmos DB account: Eventual, Session, Consistent Prefix, Bounded Staleness, Strong

Set the account-level consistency to "Session."

Perform a query or data operation and observe the impact on performance and latency

![Task](cosmos_db/session_consistency.png)

Enable Global Distribution and Test Replication:

Enable multi-region replication by adding at least one additional region to the Cosmos DB account

![Task](cosmos_db/add_region.png)

Insert new data into the primary region and verify that it replicates to the secondary region

![Task](cosmos_db/insert_data.png)

![Task](cosmos_db/added_row.png)

Read from the secondary region using Java SDK

![Task](cosmos_db/cosmosdb_java_sdk.png)

![Task](cosmos_db/read_data_from_secondary_region.png)

Perform a manual failover and verify that the secondary region becomes the primary

![Task](cosmos_db/manual_failover.png)

![Task](cosmos_db/swapped_regions.png)

![Task](cosmos_db/cli_verify.png)
