Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineOption -ShowToolTips

Invoke-Expression (&starship init powershell)

function d() {
  param(
    [Parameter(Position = 0)]
    [String]
    $factor,
    [Parameter(ValueFromRemainingArguments)]
    [String[]]
    $arguments
  )
  foreach($argument in $arguments) {
    iex "$factor $argument"
  }
}
