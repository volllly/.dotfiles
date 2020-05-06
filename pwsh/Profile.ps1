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

Invoke-Expression (&starship init powershell)
