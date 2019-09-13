﻿$DHCPAuthorized = @{
    Enable = $false
    Source = @{
        Name    = "DHCP authorized in domain"
        Data    = {
            #$DomainInformation = Get-ADDomain
            $SearchBase = 'cn=configuration,{0}' -f $DomainInformation.DistinguishedName
            Get-ADObject -SearchBase $searchBase -Filter "objectclass -eq 'dhcpclass' -AND Name -ne 'dhcproot'" #| select name
        }
        Details = [ordered] @{
            Area        = 'Configuration'
            Category    = 'DHCP'
            Severity    = ''
            RiskLevel   = 0
            Description = ""
            Resolution  = ''
            Resources   = @(

            )
        }
    }
    Tests  = [ordered] @{
        DHCPAuthorized = @{
            Enable     = $true
            Name       = 'At least 1 DHCP Server Authorized'
            Parameters = @{
                ExpectedCount = '1'
                OperationType = 'gt'
            }
        }
    }
}