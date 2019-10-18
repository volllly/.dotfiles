$env:PYTHONIOENCODING="utf-8"
Invoke-Expression "$(thefuck --alias)"

Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineOption -ShowToolTips

$importScripts = @(
  "~\source\repos\department-infrastructure-operations\scripts\gcloud\ConvertTo-WavenetVoice.ps1"
)

$importScripts | ForEach-Object {
  if(Test-Path -Path $_) {
    Set-Alias -Name $(Get-Item $_).BaseName -Value $_
  }
}

#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
(& "C:\Users\paul.volavsek\scoop\apps\anaconda3\current\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression
#endregion

# function prompt {
#   $path = $(Get-Location).Path
#   if($path.StartsWith($HOME)) {
#     $path = "~$($path.Substring($HOME.Length))"
#   }
#   $prompt = ""
#   $split = $path.Split("\")
#   $index = 0
#   foreach ($segment in $split) {
#     $index += 1
#     if(!($index -eq $split.Length)) {
#       $prompt += "$($segment.Substring(0, 1))\"
#     } else {
#       $prompt += $segment
#     }
#   }
#   "$prompt> "
# }

Invoke-Expression (&starship init powershell)
