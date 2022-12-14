let-env ENV_CONVERSIONS = {
  'PATH': {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | path expand | str collect (char esep) }
  }
  'Path': {
    from_string: { |s| $s | split row (char esep) }
    to_string: { |v| $v | path expand | str collect (char esep) }
  }
}

let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

mkdir ~/.cache/starship
starship init nu | save ~/.cache/starship/init.nu

mkdir ~/.cache/zoxide
zoxide init nushell --hook prompt | save ~/.cache/zoxide/init.nu