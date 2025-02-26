@description('The name of the App Service app.')
param appServiceAppName string = 'NodeFrontendApp19215'

@description('The name of the App Service plan SKU.')
param appServicePlanSkuName string = 'F1'

@description('The runtime stack of web app')
param linuxFxVersion string = 'node|22-lts'

@description('The Azure region into which the resources should be deployed.')
param location string = resourceGroup().location

@description('The name of the App Service plan.')
param appServicePlanName string = 'Plan-${appServiceAppName}'

resource appServicePlan 'Microsoft.Web/serverfarms@2024-04-01' = {
  name: appServicePlanName
  location: location
  properties: {
    reserved: true
  }
  sku: {
    name: appServicePlanSkuName
  }
  kind: 'linux'
}

resource appServiceApp 'Microsoft.Web/sites@2024-04-01' = {
  name: appServiceAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
  }
}

@description('The default host name of the App Service app.')
output appServiceAppHostName string = appServiceApp.properties.defaultHostName
