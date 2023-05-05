source ~/.cache/starship/init.nu

let-env config = {
    show_banner: false,
    completions: {
        algorithm: "fuzzy"
    }
}

let-env CONDA_NO_PROMPT = true