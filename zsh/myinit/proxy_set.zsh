port=7890
change_proxy() {
    if [ -z "$http_proxy" ] || [ -z "$https_proxy" ]; then
        export http_proxy="http://localhost:${port}"
        export https_proxy="http://localhost:${port}"
        echo "proxy set at localhost:${port}."
    else
        http_proxy=''
        https_proxy=''
        echo 'proxy removed.'
    fi
}

# system must have proxy, if we don't need we can use change function to cancel.
if [[ -z "$http_proxy" || -z "$https_proxy" ]]; then
    export http_proxy="http://localhost:${port}"
    export https_proxy="http://localhost:${port}"
fi
