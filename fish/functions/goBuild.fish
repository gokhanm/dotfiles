function goBuild -a os -a ver
    if test -z "$os"
        echo "Usage: goBuild linux/darwin 1.19"
        return
    end

    set goBinPath (command -v "go$ver")
    set goLatest $(ls $GOBIN|grep -E "go[0-9]"|tail -1)

    if test "$os" = "linux" && test "$ver" != ""
        GOOS=linux GOARCH=amd64 $goBinPath build -gcflags=all="-l" .
    else if test "$os" = "linux" && test "$ver" = ""
        GOOS=linux GOARCH=amd64 $goLatest build -gcflags=all="-l" .
    else if test "$os" = "darwin" && test "$ver" != "" 
        GOARCH=amd64 $goBinPath build -gcflags=all="-l" .
    else
        GOARCH=amd64 $goLatest build -gcflags=all="-l" .
    end

end
