function downloadGo --argument ver --description 'download go version'
    if test -z "$ver"
        echo "Usage: downloadGo [version]"
        return
    end

    go install golang.org/dl/go$ver@latest
    go$ver download
    go$ver version
end
