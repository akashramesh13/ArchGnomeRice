# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking zstyle ':omz:update' mode reminder  # just remind me to update when it's time Uncomment the following line to change how often to auto-update (in days). zstyle ':omz:update' frequency 13
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"
ZSH_THEME="powerlevel10k/powerlevel10k"
# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git zsh-syntax-highlighting zsh-autosuggestions fzf-tab)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
# zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

export MANPAGER='nvim +Man!'
HISTSIZE=5000
setopt appendhistory
setopt hist_ignore_dups
setopt hist_save_no_dups
setopt hist_ignore_space
setopt hist_find_no_dups
alias ls="ls --color"
alias vim="nvim"
source <(fzf --zsh)
export NVS_HOME="$HOME/.nvs"
[ -s "$NVS_HOME/nvs.sh" ] && . "$NVS_HOME/nvs.sh"

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export SPRING_PROFILES_ACTIVE=local
export REACT_APP_BACKEND_URL="http://localhost:10000"
alias kubectl="minikube kubectl --"
alias open="xdg-open"
alias code="code --ozone-platform=wayland"
export PATH=/opt/miktex/bin:$HOME/bin:$PATH
export VISUAL=vim
export EDITOR=vim
# Alias to start FreshRSS
alias freshrss-start="cd ~/Downloads/freshrss && docker compose up -d"

# Alias to stop FreshRSS
alias freshrss-stop="cd ~/Downloads/freshrss && docker compose down"

# Alias to check FreshRSS status
alias freshrss-status="cd ~/Downloads/freshrss && docker compose ps"
alias sync-to-ssd="sudo rsync -avh --delete /srv/immich/external/ /mnt/ssd/ImmichBackup/"

# Zsh Colors
# ---------------------------
# ZSH Syntax Highlighting Style Overrides
# ---------------------------

# Errors (unknown commands)
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#F38BA8'      # Catppuccin RED (your request)

# Commands
ZSH_HIGHLIGHT_STYLES[command]='fg=#89B4FA'            # Blue
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#89B4FA'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=#CBA6F7'      # Mauve (keywords: if, fi, do)

# Strings
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#F5C2E7'   # Pink
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#F5C2E7'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#F5C2E7'

# Comments
ZSH_HIGHLIGHT_STYLES[comment]='fg=#7F849C'             # Overlay1 (soft gray)

# Numbers
ZSH_HIGHLIGHT_STYLES[numeric]='fg=#F9E2AF'             # Yellow

# Options (-a, --help)
ZSH_HIGHLIGHT_STYLES[option]='fg=#94E2D5'              # Teal

# Paths
ZSH_HIGHLIGHT_STYLES[path]='fg=#89DCEB'                # Sky blue

# Brackets
ZSH_HIGHLIGHT_STYLES[bracket]='fg=#CBA6F7'             # Mauve

# Aliases
ZSH_HIGHLIGHT_STYLES[alias]='fg=#F5C2E7'               # Pink

# Functions
ZSH_HIGHLIGHT_STYLES[function]='fg=#A6E3A1'            # Green

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#6E6C7E'
# export LS_COLORS="di=95;1:ln=81:ex=120:bd=222:cd=222:or=210:mi=210:pi=222:do=183:so=183:su=210:sg=210:tw=222:ow=222:st=183:*.txt=147:*.md=147:*.py=147:*.sh=147:*.png=111:*.jpg=111:*.jpeg=111:*.gif=111:*.mp4=111:*.mkv=111:*.zip=216:*.tar=216:*.gz=216:*.7z=216"

export LS_COLORS="\
di=38;5;175:\
ln=38;5;117:\
ex=38;5;114:\
or=38;5;204:\
mi=38;5;204:\
so=38;5;183:\
pi=38;5;222:\
bd=38;5;222:\
cd=38;5;222:\
su=38;5;204:\
sg=38;5;204:\
tw=38;5;222:\
ow=38;5;222:\
st=38;5;183:\
*.txt=38;5;147:\
*.md=38;5;147:\
*.log=38;5;147:\
*.json=38;5;147:\
*.yaml=38;5;147:\
*.yml=38;5;147:\
*.conf=38;5;147:\
*.cfg=38;5;147:\
*.ini=38;5;147:\
*.py=38;5;147:\
*.js=38;5;147:\
*.ts=38;5;147:\
*.c=38;5;147:\
*.cpp=38;5;147:\
*.h=38;5;147:\
*.hpp=38;5;147:\
*.sh=38;5;114:\
*.bash=38;5;114:\
*.zsh=38;5;114:\
*.zip=38;5;216:\
*.tar=38;5;216:\
*.gz=38;5;216:\
*.7z=38;5;216:\
*.png=38;5;111:\
*.jpg=38;5;111:\
*.jpeg=38;5;111:\
*.gif=38;5;111:\
*.svg=38;5;111:\
*.mp4=38;5;111:\
*.mkv=38;5;111"


