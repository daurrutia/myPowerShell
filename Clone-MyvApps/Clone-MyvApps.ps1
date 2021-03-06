<#
.Synopsis
   Clones list of vApps
.DESCRIPTION
   Long description
   CIServer is hardcoded.
   Source vApp names are hard coded.
   New vApp names are pre-fixed with hard coded value.
   Target OrgVdc is hardcoded. 
   
   Note:
   vApp removal example: Remove-CIVApp -VApp 'My_*'
   
.EXAMPLE
   Example of how to use this cmdlet
.EXAMPLE
   Another example of how to use this cmdlet
#>

Add-PSSnapin vmware.* -ErrorAction SilentlyContinue
Connect-CIServer vcloud1 #credentials required
#$vApps = 'vApp1','vAppServers','vApp10'
$vApps = 'LinuxServ' 
    
foreach($vApp in $vApps){
    $getvApp = Get-CIVApp -Name $vApp
	$name = $getvApp.Name
    $newName = "My_$name"
	Write-Debug $newName
    $descript = $getvApp.Description
	Write-Debug $descript
    New-CIVApp -Name $newName -Description $descript -VApp $vApp -OrgVdc 'Org1' #-RunAsync
}
    