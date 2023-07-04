# ALIASES
alias bathelp="bat --plain --language=help"
alias bhelp="bathelp"
alias bgrep="batgrep"
alias bigrep="batgrep -i"
alias bman="batman"

# FUNCTIONS
how() {
  "$@" --help 2>&1 | bathelp
}
