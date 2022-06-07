<#run execution policy first
set-executionpolicy -ExecutionPolicy RemoteSigned
#run as admin ise
Start-Process powershell_ise -Verb runAs
#run as admin powershell
Start-Process powershell_ise -Verb runAs
#>
Clear-Host
Write-Host "Type 'Show-menu'"
#function construct
function Show-menu
{
    param(
        [string]$Title = 'W6 Lab Menu'
    )
    Clear-Host
    Write-Host "======$Title======"
    Write-Host "1: Press '1' Get execution policy"
    Write-Host "2: Press '2' Get-WindowsOptionalFeature MicrosoftWindowsPowerShellV2"
    Write-Host "3: Press '3' Disable-WindowsOptionalFeature MicrosoftWindowsPowerShellV2"
    Write-Host "4: Press '4' Show winrm config"
    Write-Host "5: Press '5' Strictmode v1 example"
    Write-Host "6: Press '6' No Strictmode v1 example"
    Write-Host "7: Press '7' Check WinRm dir listener"
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
                Get-WindowsOptionalFeature -online -FeatureName "MicrosoftWindowsPowerShellV2" | format-list
            }
            '3'
            {
                Disable-WindowsOptionalFeature -Online -FeatureName "MicrosoftWindowsPowerShellV2"
                Get-WindowsOptionalFeature -online -FeatureName "MicrosoftWindowsPowerShellV2" | format-list
            }
            '4'
            {
                Write-Host "`nShowing winrm config"
                Write-Host "`nwinrm get winrm/config"
                Start-Process winrm
                winrm quickconfig                
                winrm get winrm/config | out-file -FilePath C:\winrm_config.txt
                winrm get winrm/config
                Write-Host "Saving output to C:\winrm_config.txt"
                Start-Sleep -Seconds 1.5
                Write-Host "Saved"
                Start-Process notepad C:\winrm_config.txt
                Stop-Service WinRM
            }
            '5'
            {
                Write-Host "`nExample with Strict mode v1`n"
                Write-Host {'Set-StrictMode -Version 1.0
                if( $a -gt 5 )
                {
                    Out-Host $a is greater than 5
                }
                $a'}            
                Set-StrictMode -Version 1.0
                $a -gt 5
                Set-StrictMode -off
            }
            '6'
            {
                Write-Host "`nExample with No Strict mode v1`n"
                Write-Host {'$a -gt 5'}        
                Write-Host "`nOut-put boolean`n"
                $a -gt 5

            }
            '7'
            {
                Write-Host "`nGetting WinRm Service`n"
                Get-Service WinRM

                Write-Host "`nChecking WinRm Service`n"
                Get-ChildItem wsman:\localhost\listener | format-list
                                
                Write-Host "`nStopping WinRm`n"
                Start-Sleep -Seconds 2
                Stop-Service WinRM
                Get-Service WinRM
            }
            'q'{Exit}
        }
        pause
        Clear-Host
        Show-menu    
    }
    until($userinput -eq 'q')
    
}