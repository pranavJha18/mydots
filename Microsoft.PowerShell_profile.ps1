Invoke-Expression (&starship init powershell)
Invoke-Expression (& { (zoxide init powershell | Out-String) })

function ExitSession {
  exit
}

Set-Alias e ExitSession
Set-Alias ls lsd
# Equivalent aliases
Set-Alias pyt "python"
Set-Alias jc "javac"
Set-Alias jr "java"
Set-Alias ff "fastfetch"
Set-Alias ci "code-insiders"
Set-Alias -Name fcd -Value Invoke-FuzzySetLocation
Set-Alias -Name fe -Value Invoke-FuzzyEdit
Set-Alias -Name fgs -Value Invoke-FuzzyGitStatus
Function la { lsd -a }  # Alias for 'ls -a'
Function lla { lsd -la } # Alias for 'ls -la'
Function lt { lsd --tree } # Alias for 'ls --tree'
Function l {lsd -l}
Function ..{cd ..}
Function ...{cd ../..}

function which ($command) { 
  Get-Command -Name $command -ErrorAction SilentlyContinue | 
  Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue 
} 

Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

# replace 'Ctrl+t' and 'Ctrl+r' with your preferred bindings:
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

Set-PSReadLineKeyHandler -Key Tab -ScriptBlock { Invoke-FzfTabCompletion }

# Create a function to reload the profile with error handling and feedback
function Reload-PowerShellProfile {
    try {
        $profilePath = $PROFILE
        
        # Check if profile exists
        if (!(Test-Path -Path $profilePath)) {
            Write-Warning "Profile does not exist at: $profilePath"
            return
        }

        # Get the last write time before reloading
        $lastWriteTime = (Get-Item -Path $profilePath).LastWriteTime

        # Reload the profile
        . $profilePath

        # Get execution time and format it
        $executionTime = [math]::Round(((Get-Date) - $lastWriteTime).TotalSeconds, 2)
        
        # Output success message with green color
        Write-Host "✓ Profile reloaded successfully!" -ForegroundColor Green
        Write-Host "  Location: $profilePath" -ForegroundColor Gray
        Write-Host "  Last modified: $lastWriteTime" -ForegroundColor Gray
        Write-Host "  Reload time: ${executionTime}s" -ForegroundColor Gray
    }
    catch {
        # Output error message with red color
        Write-Host "✗ Failed to reload profile: $($_.Exception.Message)" -ForegroundColor Red
        Write-Host "  Location: $profilePath" -ForegroundColor Gray
    }
}

# Set the alias
Set-Alias -Name src -Value Reload-PowerShellProfile
