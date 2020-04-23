##Using the Help System  

 #a. How to discover commands

Get-Command 

(Get-Command).count

Get-command -CommandType alias

Get-Module

Get-Module msonline

Import-Module msonline

Get-Command -Module MSOnline -noun *user

**ctrl+space in the CLI

#b. Asking for help 

Get-Service -?

get-help Get-service -ShowWindow

Get-Help Get-Service -online

Get-Help Get-Service -Examples 

Get-Help Get-Service -full

Get-Help Get-Service -Parameter displayname

#ways to update help system

Update-Help #(pulls from direct Internet access or offline copies)

#Get-Module -ListAvailable | Where-Object -Property HelpInfoUri

update-help windowsupdate

Save-Help #(allows help to be re-distributed)

#Save-Help –DestinationPath \\SomeServer\SomeShare -> useful for scenarios without internet Access

<#On computers without Internet Access (no GPO source path):
Update-Help –SourcePath \\SomeServer\SomeShare 
GPO Setting:
Computer > Policies > Administrative Templates > Windows Components > Windows PowerShell
Enable "Set the default source path for Update-Help."
#>


#c. Interpreting the Help 
    #syntax


Get-Command –Name Add-Computer –Syntax 

<Verb-noun > Verb


#d. Search for commands  
Get-Command -Noun *serv*

Get-Command -Module azuread -Noun *user*

Get-Command -Name *.exe

Get-Command -CommandType Alias

Get-Command -CommandType Cmdlet

##The pipeline  

#a. The PowerShell pipelines 

Get-Help get-service -Full

Get-Service -Name wsea* | Stop-Service -WhatIf

Get-Service -ComputerName fakeserver -Name netlogon | Start-Service 

$Allservices = Get-Service  

$Allservices

$Allservices | Where-Object {$_.Status -eq "Running"}| select -First 3

$Allservices | select -First 3

#=========

#Pipeline Input ByValue

'MS','DC' | Restart-Computer –WhatIf


#Pipeline Input ByProperty




