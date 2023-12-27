function goInit
    # Help
    function __help -d "show help"
        printf "usage: goInit [-h] [-f file] [-g gversion] "

        printf "positional arguments:\n"
        printf "\n"

        printf "optional arguments:\n"
        printf "  -h, --help            show this help message and exit\n"
        printf "  -f, --file            create given filename\n"
        printf "  -g, --gversion        use given go version for go mod init\n"
        printf "\n"

        return 0
    end

    # Parse arguments
    set -l options h/help "f/file=" "g/gversion="
    argparse $options -- $argv || return 1

    # Show help
    set -q _flag_help && __help && return 0

    # create given file
    set -q _flag_file && touch $_flag_file >/dev/null 2>&1

    set -q _flag_gversion
    if test -z "$_flag_gversion"
        set goLatest $(ls $GOBIN|grep -E "go[0-9]"|tail -1)     
    else 
        set goLatest go$_flag_gversion
    end

    $goLatest mod init
    $goLatest mod tidy
end