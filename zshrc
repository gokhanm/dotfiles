export GOPROXY=direct
export GOSUMDB=off
export GOPATH="/Users/gokhan/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

alias hsi="history"
alias hsig="history|grep $1"

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
