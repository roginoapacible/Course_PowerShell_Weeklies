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
    Write-Host "2: Press '2' for this option"
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
                'You chose option #1'
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

Disable-WindowsOptionalFeature -Online -FeatureName "MicrosoftWindowsPowerShellV2"