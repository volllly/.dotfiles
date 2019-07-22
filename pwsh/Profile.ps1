function prompt {
  $path = $(Get-Location).Path
  if($path.StartsWith($HOME)) {
    $path = "~$($path.Substring($HOME.Length))"
  }
  $prompt = ""
  $split = $path.Split("\")
  $index = 0
  foreach ($segment in $split) {
    $index += 1
    if(!($index -eq $split.Length)) {
      $prompt += "$($segment.Substring(0, 1))\"
    } else {
      $prompt += $segment
    }
  }
  "$prompt> "
}

Import-Module posh-git

$env:PYTHONIOENCODING="utf-8"
Invoke-Expression "$(thefuck --alias)"

#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
(& "C:\Users\paul.volavsek\scoop\apps\anaconda3\current\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression
#endregion


