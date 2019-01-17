[CmdletBinding()]
Param(
  [Parameter(Mandatory=$true,ValueFromPipelineByPropertyName=$true)]
  $command=(
    "install",
    "update",
    "link"
  ),
  [Switch]$NoUpdate = $False,
  [Switch]$NoLink = $False,
  [Switch]$NoInstall = $False
)

if (!(Get-Module -ListAvailable -Name powershell-yaml)) {
  Install-Module powershell-yaml -Scope CurrentUser
} 
Import-Module powershell-yaml

$cfg = @{}

Get-ChildItem $PSScriptRoot -Directory | ForEach-Object {
  $currentDirectory = $_
  $currentName = Split-Path $currentDirectory -Leaf
  $cfgfile = ''
  $currentFile = $(Join-Path -Path $currentDirectory -ChildPath "windows.yaml")

  if(!(Test-Path $currentFile)) {
    Return
  }
  
  foreach ($line in Get-Content $currentFile) { $cfgfile += "`n" + $line }
  $cfg[$currentName] = ConvertFrom-YAML $cfgfile
  if($cfg[$currentName]["installs"]) {
    if($cfg[$currentName]["installs"].GetType().Name -eq "String") {
      $cfg[$currentName]["installs"] = @{ "cmd" = $cfg[$currentName]["installs"]}
    }
    if($cfg[$currentName]["installs"]["depends"]) {
      if($cfg[$currentName]["installs"]["depends"].GetType().Name -eq "String") {
        $cfg[$currentName]["installs"]["depends"] = @($cfg[$currentName]["installs"]["depends"])
      }
    }
    $cfg[$currentName]["installs"]["installed"] = $False
  }
}


function Installs($name) {
  $installs = $cfg[$name]["installs"]
  $depends = $cfg[$name]["depends"]

  if(($installs["installed"]) -Or ($installs["error"])) {
    Return
  }

  if(($installs["depended"] -Gt 1) -Or ($cfg[$name]["depended"] -Gt 1)) {
    Write-Host "detected circular dependency for $name" -ForegroundColor Red
    Return
  }
  if($installs["depends"]) {
    $installs["depends"] | ForEach-Object {
    $cfg[$_]["installs"]["depended"] += 1
    Installs $_
    }
  }

  Write-Host "installing $name"

  Invoke-Expression $installs["cmd"]

  $cfg[$name]["installs"]["installed"] = $True

  if($depends) {
    $depends | ForEach-Object {
      $cfg[$_]["depended"] += 1
      Installs $_
    }
  }

  Write-Host ""
}

function Links($name) {
  Write-Host "linking $name"
  $links = $cfg[$name]["links"]
  $links.Keys | ForEach-Object {
    Write-Host "  $_ -> $($links[$_])"
    New-Item -Path $links.$_ -ItemType HardLink -Value $(Join-Path -Path $PSScriptRoot -ChildPath $(Join-Path -Path $name -ChildPath $_)) -Force | Out-Null
  }
  Write-Host ""
}

function Upadtes($name) {
  Write-Host "linking $name"
  $updates = $cfg[$name]["updates"]

  Invoke-Expression $updates

  Write-Host ""
}

function Help() {
  Write-Error "not implemented"
}

$cfg.Keys | ForEach-Object {
  $name = $_
  Switch($command) {
    "install" {
      if($cfg[$name]["links"] -And !($NoLink)) {
        Links $name
      }
      if($cfg[$name]["installs"] -And !($NoInstall)) {
        Installs $name
      }
    }
    "update" {
      if($cfg[$name]["links"] -And !($NoLink)) {
        Links $name
      }
      if($cfg[$name]["updates"] -And !($NoUpdate)) {
        Updates $name
      }
    }
    "link" {
      if($cfg[$name]["links"] -And !($NoLinks)) {
        Links $name
      }
    }
    "help" {
      Help
    }
    default {
      Help
    }
  }
}