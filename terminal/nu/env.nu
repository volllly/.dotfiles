$env.PATH = (
  $env.PATH
  | split row (char esep)
  | append /usr/local/bin
  | append ($env.HOME | path join .cargo/bin)
  | append ($env.HOME | path join .local bin)
  | append ($env.HOME | path join .dotnet/tools)
  | append /opt/homebrew/bin
  | append /usr/local/share/dotnet
  | append ($env.HOME | path join .ghcup/bin)
  | uniq
)

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

if $env.HOMEPATH? != null {
    $env.HOME = $env.HOMEPATH
}

$env.CONDA_NO_PROMPT = true

mkdir ~/.cache/starship
starship init nu | save ~/.cache/starship/init.nu --force

mkdir ~/.cache/zoxide
zoxide init --cmd cd nushell | save ~/.cache/zoxide/init.nu --force
