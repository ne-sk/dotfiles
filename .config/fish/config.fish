source /usr/share/cachyos-fish-config/cachyos-config.fish

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
mise activate fish | source
zoxide init fish --cmd cd | source
# Replace ls with eza
alias ls='eza -al --color=always --group-directories-first --icons=always' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons=always'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons=always'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons=always' # tree listing
alias l.="eza -a | grep -e '^\.'"      
alias sd="cd ~ && cd (find * -type d | fzf)"

function y
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if read -z cwd <"$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        builtin cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

# COMPLETE=fish tms | source
