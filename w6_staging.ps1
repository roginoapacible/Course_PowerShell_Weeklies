#function construct
Clear-Host
Write-Host "Type 'Show-menu'"
function Show-menu
{
    param(
        [string]$Title = 'W6 Lab Menu'
    )
    Clear-Host
    Write-Host "======$Title======"
    Write-Host "1: Press '1' Get execution policy"
    Write-Host "2: Press '2' Get-WindowsOptionalFeature MicrosoftWindowsPowerShellV2 "
    Write-Host "3: Press '3' for this option"
    Write-Host "Q: Press 'Q' to quit"

    do{
        $userinput = Read-Host "Please Make a selection"
        switch ($userinput) 
        {
            '1'
            {
                Write-Host "These are the current execution Policy"
                Get-ExecutionPolicy -List | format-table
            }
            '2'
            {
                Get-WindowsOptionalFeature -online -FeatureName "MicrosoftWindowsPowerShellV2" | format-table
            } 
            '3'{'You chose option #1'}
            'q'{Exit}
        }
        pause
        Clear-Host
        Show-menu    
    }
    until($userinput -eq 'q')
    
}

Get-WindowsOptionalFeature -online | sort -Descending -property State | format-table  -FeatureName MicrosoftWindowsPowerShellV2
Get-WindowsOptionalFeature

Get-WindowsOptionalFeature -online -FeatureName "MicrosoftWindowsPowerShellV2" | format-table

Disable-WindowsOptionalFeature -Online -FeatureName "MicrosoftWindowsPowerShellV2" | format-list

winrm get winrm/config

#Set-StrictMode -Version 1.0
if( $a -gt 5 ){
Out-Host '$a is greater than 5'
}

if( $a -gt 5 ){
    Out-Host '$a is greater than 5'
    }
    
$a -gt 5

dir wsman:\localhost\listener
Stop-Service WinRM -PassThruSet -Service WinRM -StartupType Disabled -PassThru
Get-Service WinRM


Start-Sleep -Seconds 1.5
Stop-Service WinRM

$ExecutionContext.SessionState.LanguageMode

(Get-PSSessionConfiguration -Name Test).LanguageMode

powershell.exe -version 2

Clear-Host
Get-ExecutionPolicy -List
set-executionpolicy -ExecutionPolicy RemoteSigned -Scope Process