# Path to your oh-my-zsh installation.
export ZSH=/Users/whoami/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

function powerline_precmd() {
    PS1="$(~/terminal/powerline-shell/powerline-shell.py $? --shell zsh 2> /dev/null)"
}

function install_powerline_precmd() {
  for s in "${precmd_functions[@]}"; do
    if [ "$s" = "powerline_precmd" ]; then
      return
    fi
  done
  precmd_functions+=(powerline_precmd)
}
=true
if [ "$TERM" != "linux" ]; then
    install_powerline_precmd
fi

. ~/terminal/z/z.sh

source  ~/terminal/powerlevel9k/powerlevel9k.zsh-theme
POWERLEVEL9K_DISABLE_RPROMPT=true
# POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
# POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status rbenv)
POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_TIME_FORMAT="%D{%d.%m %H:%M:%S}"

alias whereami="pwd | grep -o '[^/]*$'"

export PATH="/Users/whoami/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:$PATH"

function gitzip() { 
	git archive -o $@.zip HEAD;
}

function nrs {
	npm run-script $@
}

function showhidden(){
	defaults write com.apple.finder AppleShowAllFiles YES && killall Finder
}
function hidehidden(){
	defaults write com.apple.finder AppleShowAllFiles NO && killall Finder
}

function openprofiles() {
	subl ~/.zshrc
}

function sourceprofiles() {
	source ~/.zshrc
}

function dockspace() {
	defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}' && killall Dock
}

# -------

function ptrunk() {
	pod trunk push $@.podspec
}

function pbuild() {
	pod spec lint
}

function cbuild() {
	carthage build --no-skip-current
}

function sbuild() {
	swift build -v -c debug
}

function berr() {
	bundle exec rake release
}

function bedi() {
	bundle exec danger init
}

function bedl() {
	bundle exec danger local
}

function bi() {
	bundle init
}

function deriveddata() {
	rm -rf "/Users/whoami/Library/Developer/Xcode/DerivedData" "/Users/whoami/Library/Developer/Xcode/Archives"
}

function extract() {
  if [ -f "$@" ]; then
    case "$@" in
      *.tar.bz2)  tar -jxvf "$@"                        ;;
      *.tar.gz)   tar -zxvf "$@"                        ;;
      *.bz2)      bunzip2 "$@"                          ;;
      *.dmg)      hdiutil mount "$@"                    ;;
      *.gz)       gunzip "$@"                           ;;
      *.tar)      tar -xvf "$@"                         ;;
      *.tbz2)     tar -jxvf "$@"                        ;;
      *.tgz)      tar -zxvf "$@"                        ;;
      *.zip)      unzip "$@"                            ;;
      *.ZIP)      unzip "$@"                            ;;
      *.pax)      cat "$@" | pax -r                     ;;
      *.pax.Z)    uncompress "$@" --stdout | pax -r     ;;
      *.Z)        uncompress "$@"                       ;;
      *) echo "'$@' cannot be extracted/mounted via extract()" ;;
    esac
  else
     echo "'$@' is not a valid file to extract"
  fi
}

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
