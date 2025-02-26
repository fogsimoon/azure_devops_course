@description('The Azure region into which the resources should be deployed.')
param location string = resourceGroup().location

@description('The name of the App Service plan SKU.')
param appServicePlanSkuName string = 'F1'

@description('The runtime stack of web app')
param linuxFxVersion string = 'node|22-lts'

@description('The name of the App Service app.')
param backServiceAppName string = 'NodeBackendApp19214'

@description('The name of the App Service plan.')
param backServicePlanName string = 'Plan-${backServiceAppName}'

@description('The name of the App Service app.')
param frontServiceAppName string = 'NodeFrontendApp19214'

@description('The name of the App Service plan.')
param frontServicePlanName string = 'Plan-${frontServiceAppName}'

module backapp 'modules/backapp.bicep' = {
  name: 'backapp'
  params: {
    appServiceAppName: backServiceAppName
    appServicePlanName: backServicePlanName
    appServicePlanSkuName: appServicePlanSkuName
    location: location
    linuxFxVersion: linuxFxVersion
  }
}

@description('The host name to use to access the website.')
output backendHostName string = backapp.outputs.appServiceAppHostName

module frontapp 'modules/frontapp.bicep' = {
  name: 'frontapp'
  params: {
    appServiceAppName: frontServiceAppName
    appServicePlanName: frontServicePlanName
    appServicePlanSkuName: appServicePlanSkuName
    location: location
    linuxFxVersion: linuxFxVersion
  }
}

@description('The host name to use to access the website.')
output frontendHostName string = frontapp.outputs.appServiceAppHostName

@description('Administrator login')
param administratorLogin string = 'azureuser'

@description('Administrator password')
@secure()
param administratorLoginPassword string 

module sqldb 'modules/sqldb.bicep' = {
  name: 'sqldb'
  params: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
  }
}
