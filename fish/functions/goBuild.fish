function goBuild
    # --- 1. Define and Parse Flags using argparse ---
    # 'e/experiment=': Requires a value for short flag -e or long flag --experiment.
    # 'v/verbose': A simple boolean flag (no value required).
    # 'h/help': The new boolean flag for help/usage.
    argparse 'e/experiment=' 'v/verbose' 'h/help' -- $argv
    or return 1 # Exit on argument parsing error

    # Variables set by argparse:
    # $_flag_experiment (value of -e/--experiment)
    # $_flag_verbose (boolean flag)
    # $_flag_help (boolean flag)

    # --- 2. Extract Positional Arguments ---
    # After argparse runs, all processed flags are removed from $argv.
    # The remaining positional arguments are assigned.
    set os $argv[1]
    set ver $argv[2]
    
    # Define local variables based on flags, checking for existence first
    set go_experiment ""
    if set -q _flag_experiment
        set go_experiment $_flag_experiment
    end

    if set -q _flag_verbose
        echo "Verbose output enabled."
    end

    # --- 3. Handle Help Flag ---
    if set -q _flag_help
        echo "Usage: goBuild [OPTIONS] (linux|darwin|version) [GO_VERSION]"
        echo ""
        echo "Builds a Go project for a specified OS and Go version."
        echo "The build command used is 'go build -gcflags=all=\"-l\" .' with GOOS/GOARCH set."
        echo ""
        echo "Arguments:"
        echo "  (linux|darwin|version)  The target OS (linux or darwin), or 'version' to print the Go version."
        echo "  [GO_VERSION]            The optional specific Go version to use (e.g., '1.20'). Defaults to 'go'."
        echo ""
        echo "Options:"
        echo "  -e, --experiment <value> Set GOEXPERIMENT environment variable."
        echo "  -v, --verbose            Print the full build command before execution."
        echo "  -h, --help               Display this help message and exit."
        return 0
    end

    # --- 4. Validation ---
    if test -z "$os"
        printf "Usage: goBuild [-e EXPERIMENT] [-v] [-h] (linux|darwin|version) [go_version]\n" >&2
        return 1
    end

    # 5. Determine the Go binary path
    set goBinPath ""
    if test -n "$ver"
        # Try to find the specific version, e.g., 'go1.19'
        set goBinPath (command -v "go$ver" 2>/dev/null)
    end
    # If a specific version wasn't requested, or if it wasn't found, fall back to the default 'go'
    if test -z "$goBinPath"
        set goBinPath (command -v go 2>/dev/null)
    end

    # Check if the binary was found
    if test -z "$goBinPath"
        printf "Error: Go binary not found for version '%s' or default 'go'.\n" "$ver" >&2
        return 1
    end
    
    # 6. Handle 'version' command early
    if test "$os" = "version"
        $goBinPath version
        return $status
    end

    # 7. Determine GOOS and build command
    set go_os ""
    if test "$os" = "linux"
        set go_os "linux"
    else if test "$os" = "darwin"
        # Use host OS for darwin build if current OS is darwin, otherwise rely on default cross-compile logic
        set go_os "darwin"
    else
        printf "Error: Unknown OS target: %s. Use 'linux' or 'darwin'.\n" "$os" >&2
        return 1
    end

    # Construct the final command and execute
    set cmd_args "GOOS=$go_os GOARCH=amd64 $goBinPath build -gcflags=all=\"-l\" ."
    
    if test -n "$go_experiment"
        # Prepend GOEXPERIMENT to the command for explicit use
        set cmd_args "GOEXPERIMENT=$go_experiment $cmd_args"
    end
    
    if set -q _flag_verbose
        echo "Executing build command: $cmd_args"
    end

    # Execute the final command
    eval $cmd_args

    # Use the exit status of the last command
    return $status

end

