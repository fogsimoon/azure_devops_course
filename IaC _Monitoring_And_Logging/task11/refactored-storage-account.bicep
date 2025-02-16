@description('The storage account location.')
param location string = resourceGroup().location

@description('The name of the storage account.')
param storageAccountName string

@description('The SKU of the storage account.')
param storageSku string = 'Standard_LRS'

@description('Number of days to retain deleted blobs.')
param deleteRetentionDays int = 30

resource storageAccount 'Microsoft.Storage/storageAccounts@2021-06-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageSku
  }
  kind: 'StorageV2'
  properties: {
    publicNetworkAccess: 'Disabled'
  }
}

resource blobService 'Microsoft.Storage/storageAccounts/blobServices@2021-06-01' = {
  parent: storageAccount
  name: 'default'
  properties: {
    deleteRetentionPolicy: {
      enabled: true
      days: deleteRetentionDays
    }
  }
}

output storageAccountName string = storageAccount.name
output storageAccountId string = storageAccount.id