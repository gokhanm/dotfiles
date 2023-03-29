function downloadGo --argument ver
    if test -z "$ver"
        echo "Usage: downloadGo [version]"
        return
    end

    go install golang.org/dl/go$ver@latest
    go$ver download
    go$ver version
end
