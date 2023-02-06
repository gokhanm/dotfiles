# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/gokhanmankara/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	colored-man-pages
	colorize
	pip
	python
	brew
	macos
	zsh-autosuggestions
	copypath
	history
)


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export GOPROXY=direct
export GOSUMDB=off
export GOPATH="/Users/gokhanmankara/go"
export GOBIN="$GOPATH/bin"
export PATH="/usr/bin:/bin:/usr/sbin:/sbin:$PATH"
#export PATH="/Users/gokhanmankara/go/bin/:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# $1 -> build for os
# $2 -> go version
goBuild(){
	help="goBuild linux [1.17.4]"
	goBinPath=$(echo $GOBIN)
	goLatest=$(ls $goBinPath|grep -E "go[0-9]"|tail -1)

	if [[ "$1" == "" ]]
	then
	   echo "which platform? exp: linux/darwin"
	   echo "usage: $help"
	else
		if [[ "$1" == "linux" && "$2" != "" ]]
    		then
			GOOS=linux GOARCH=amd64 go$2 build .
		elif [[ "$1" == "linux" && "$2" == "" ]]; then
			GOOS=linux GOARCH=amd64 $goLatest build .
		elif [[ "$1" == "darwin" && "$2" != "" ]]
		then
			GOARCH=amd64 go$2 build .
    		else
			GOARCH=amd64 $goLatest build .
    		fi
	fi

}

downloadGo() {
	if [[ "$1" == "" ]]
	then
		echo "which version? exp: downloadGo 1.17.6"
		exit 1
	fi
	version=$1
	go install golang.org/dl/go$version@latest
	go$version download
	go$version version
}

ZSH_CUSTOM="~/.oh-my-zsh/custom/plugins"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ffffff,bg=cyan,bold,underline"
