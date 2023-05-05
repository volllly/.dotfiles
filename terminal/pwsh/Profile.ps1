Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineOption -ShowToolTips

Invoke-Expression (&starship init powershell)

Remove-Alias sp -Force

#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
If (Test-Path "C:\Users\paul.volavsek\AppData\Local\miniconda3\Scripts\conda.exe") {
    (& "C:\Users\paul.volavsek\AppData\Local\miniconda3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | ?{$_} | Invoke-Expression
}
#endregion

