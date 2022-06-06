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
            '1' {
                    function show-option1
                    {
                        Clear-Host
                        Write-Host "======Change Execution Policy======"
                        Write-Host "1: Press '1' Check Execution Policy"
                        Write-Host "2: Press '2' You select option 2"
                        Write-Host "3: Press '3' You select option 3"
                        Write-Host "Q: Press 'Q' to back to menu"
                    }
                    show-option1
                    do{
                        $1select = Read-Host "Make a selection"
                        switch ($1select)
                        {
                            '1' 
                            {
                                Write-Host "These are the current execution Policy"
                                Get-ExecutionPolicy -List | format-table
                            }
                            '2' 
                            {
                                
                                Write-Host "You set the execution policy to RemoteSigned"                                
                            } 
                            '3'
                            {
                                Write-Host "You set the execution policy to Default"                               
                            }
                            'q' {Show-menu}
                        }pause                        
                    }until($1 -eq 'q')
                } 
            '2' {'You chose option #1'} 
            '3' {'You chose option #1'}
            'q' {Exit}
        }
        pause
        Clear-Host
        Show-menu    
    }
    until($userinput -eq 'q')
    
}