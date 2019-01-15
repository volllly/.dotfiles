[CmdletBinding()]
Param(
  [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]
  $command=(
    "install",
    "update",
    "link"
  )
)

if (!(Get-Module -ListAvailable -Name powershell-yaml)) {
  Install-Module powershell-yaml -Scope CurrentUser
} 
Import-Module powershell-yaml

Get-ChildItem $PSScriptRoot -Directory | ForEach-Object {
  $currentDirectory = $_
  $currentName = Split-Path $currentDirectory -Leaf
  $cfgfile = ''
  foreach ($line in Get-Content $(Join-Path -Path $currentDirectory -ChildPath "windows.yaml")) { $cfgfile += "`n" + $line }
  $cfg = ConvertFrom-YAML $cfgfile
  Switch($command) {
    "install" {
      if($cfg["installs"]) {
        Write-Output "installing $($currentName)"
        if($cfg["installs"].GetType().Name -eq "String") {
          $cfg["installs"] = @{ "cmd" = $cfg["installs"]}
        }
        if($cfg["installs"]["depends"]) {
          if($cfg["installs"]["depends"].GetType().Name -eq "String") {
            $cfg["installs"]["depends"] = @($cfg["installs"]["depends"])
          }
        }
      }
    }
    "update" {

    }
    "link" {
      if($cfg["links"]) {
        $write = $True
        $cfg["links"].Keys | ForEach-Object {
          if($write) { 
            Write-Output "linking $($currentName)"
            $write = $False
          }
          Write-Output "  $($_) -> $($cfg["links"].$_)"
          New-Item -Path $cfg["links"].$_ -ItemType HardLink -Value $(Join-Path -Path $currentDirectory -ChildPath $_) -Force | Out-Null
        }
      }
    }
  }
}
