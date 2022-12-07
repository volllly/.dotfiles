source ~/.cache/starship/init.nu
source ~/.cache/zoxide/init.nu

let-env config = {
    show_banner: false,
    completions: {
        algorithm: "fuzzy"
    }
}