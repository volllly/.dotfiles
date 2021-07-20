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

Invoke-Expression (& {
    $hook = if ($PSVersionTable.PSVersion.Major -lt 6) { 'prompt' } else { 'pwd' }
    (zoxide init --hook $hook powershell) -join "`n"
});

# function d() {
#   param(
#     [Parameter(ValueFromRemainingArguments)]
#     [String[]]
#     $arguments,
#     $opening = '[',
#     $closing = ']'
#   )
#   Write-Host $arguments

#   if(!($arguments | Foreach-Object { $open = 0; $close = 0} {
#     if($_ -eq '[') {
#       $open += 1
#     }
#     if($_ -eq ']') {
#       $close += 1
#     }
#   } { $open -eq $close })) { Write-Error 'Differient number of opening and closing brackets.'; return }
  

#   function y($arguments) {
#     $
#     if($args.contains($opening)) {
#       $factor = $arguments[0..$args.indexOf($opening)] -join ' '
#     } else {
#       return $arguments -join ' '
#     }
    

#   }

#   $results = y($arguments)

#   $arguments.IndexOf($opening)
#   foreach($result in $results) {
#     Invoke-Expression $result
#   }
# }

# a b c                 -> a b c
# a [b c d]             -> ab ac ad
# a [b [c d e] f g]     -> a [bc bd be f g]     -> abc abd be af ag
# a [b [c [d e f] g] h] -> a [b [cd ce cf g] h] -> a [bcd bce bcf bg h] -> abcd abce abcf abg ah
