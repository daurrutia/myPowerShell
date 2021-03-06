<#
.Synopsis
   Clones listed vApps
.DESCRIPTION
   Clones listed vApps in $vApps variable
   Credentials MUST be stored on local machine:
   (ex, Get-Credential | Export-Clixml -Path C:\Scripts\Clone-MyvApps\${env:USERNAME}_cred.xml)
   Path to credentials is hardcoded.
   CIServer is hardcoded.
   Source vApp names are hard coded.
   New vApp names are pre-fixed with hard coded value.
   Target OrgVdc is hardcoded. 
   
   Note:
   vApp removal example ($newName): Remove-CIVApp -VApp 'My_*'
   
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
#>

#variable declaration
$cred = Import-Clixml -Path C:\Scripts\Clone-MyvApps\${env:USERNAME}_cred.xml
$vApps = 'vApp1'
#$vApps = 'vApp2','vApp3','vApp15'
#$vApps = 'vApp13'

Add-PSSnapin VMware.VimAutomation.Cloud -ErrorAction SilentlyContinue
Connect-CIServer vcloud-director -Credential $cred
    
foreach($vApp in $vApps){
    $getvApp = Get-CIVApp -Name $vApp
	$name = $getvApp.Name
    $newName = "My_$name"
	Write-Debug $newName
    $descript = $getvApp.Description
	Write-Debug $descript
    New-CIVApp -Name $newName -Description $descript -VApp $vApp -OrgVdc 'Org1' -RunAsync
}   