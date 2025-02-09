Configuration MyDSCConfig
{
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    Node "localhost"
    {
    
        WindowsFeature IIS
        {
            Name   = "Web-Server"
            Ensure = "Present"
        }

        File ConfigFile
        {
            DestinationPath = "C:\inetpub\wwwroot\config.xml"
            Contents = @"
<configuration>
    <appSettings>
        <add key="Setting1" value="Value1" />
        <add key="Setting2" value="Value2" />
    </appSettings>
</configuration>
"@
            Ensure    = "Present"
            DependsOn = "[WindowsFeature]IIS"
        }

        Service IISService
        {
            Name      = "w3svc"
            Ensure    = "Present"
            State     = "Running"
            DependsOn = "[WindowsFeature]IIS"
        }
    }
}

