param appServiceAppName string = 'toy-product-launch-136253'
param location string = resourceGroup().location

var appServicePlanName = 'toy-product-launch-plan-starter'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
    name: 'toylaunchstoragebz716335'
    location: location
    sku: {
        name: 'Standard_LRS'
    }
    kind: 'StorageV2'
    properties: {
        accessTier: 'Hot'
    }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2024-04-01' = {
  name: appServicePlanName
  //location: 'switzerlandnorth'
  location: location
  sku: {
    name: 'B1'
  }
}

resource appServiceApp 'Microsoft.Web/sites@2024-04-01' = {
  name: appServiceAppName
  //location: 'switzerlandnorth'
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
