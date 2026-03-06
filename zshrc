export GOROOT=$(ls -d /Users/gokhan/sdk/go* | tail -n 1)
export GOPROXY=direct
export GOSUMDB=off
export GOPATH="/Users/gokhan/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOROOT/bin:$GOBIN:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

alias hsi="history"
alias hsig="history|grep $1"
