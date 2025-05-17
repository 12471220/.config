ip=localhost
port=7890
change_proxy() {
    if [ -z "$http_proxy" ] || [ -z "$https_proxy" ]; then
        export http_proxy="http://${ip}:${port}"
        export https_proxy="http://${ip}:${port}"
        echo "proxy set at ${ip}:${port}."
    else
        http_proxy=''
        https_proxy=''
        echo 'proxy removed.'
    fi
}

# system must have proxy, if we don't need we can use change function to cancel.
if [[ -z "$http_proxy" || -z "$https_proxy" ]]; then
    export http_proxy="http://${ip}:${port}"
    export https_proxy="http://${ip}:${port}"
fi
