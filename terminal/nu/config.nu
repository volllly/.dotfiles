source ~/.cache/starship/init.nu
source ~/.cache/zoxide/init.nu

$env.config = {
    show_banner: false,
    completions: {
        algorithm: "fuzzy"
    }
}

$env.CONDA_NO_PROMPT = true
