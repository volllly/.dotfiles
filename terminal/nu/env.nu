$env.ENV_CONVERSIONS = {
  'PATH': {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | path expand | str join (char esep) }
  }
  'Path': {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | path expand | str join (char esep) }
  }
}

$env.NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

$env.NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

$env.HOME = $env.HOMEPATH

mkdir ~/.cache/starship
starship init nu | save ~/.cache/starship/init.nu --force

mkdir ~/.cache/atuin
atuin init nu --disable-up-arrow --disable-ctrl-r | save ~/.cache/atuin/init.nu --force