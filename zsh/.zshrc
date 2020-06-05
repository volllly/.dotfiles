eval "$(starship init zsh)"

dotfiler() {
  pwsh -c "dotfiler $@"
}
export PATH="/usr/local/sbin:$PATH"
