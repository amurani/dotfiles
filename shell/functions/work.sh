sync_up() {
    # $1 - hostname
    # $2 - repo in /usr/local/git_tree/
    # $3 - file in question
    scp $3 kmurani@$1:/usr/local/git_tree/$2/$3
}

sync_down() {
    # $1 - hostname
    # $2 - repo in /usr/local/git_tree/
    # $3 - file in question
    scp kmurani@$1:/usr/local/git_tree/$2/$3 $3
}

ssh_fix() {
    ssh -O exit $1; ssh -A $1
}

docker_clean () {
    docker rm $(docker ps -q -f 'status=exited')
    docker rmi $(docker images -q -f 'dangling=true')
}

run_sb_app () {
    HOST_NAME=$1
        REACT_APP_SETTINGS_URI=${HOST_NAME}/api/settings \
        REACT_APP_API_HOST=${HOST_NAME}/ \
        REACT_APP_SUPPLY_API_HOST=$HOST_NAME \
        REACT_APP_API_URL_PREFIX=/api \
        REACT_APP_API_SEND_CREDENTIALS=false \
        REACT_APP_API_SEND_TOKEN=true \
        REACT_APP_API_QUERY_STRING=?token=hunter2 \
        yarn start
}

run_partner_app () {
    HOST_NAME=$1 \
        REACT_APP_DASHBOARD_API_HOST=${HOST_NAME}/dashboard \
        REACT_APP_DASHBOARD_APP_SETTINGS_URI=${HOST_NAME}/dashboard/session \
        yarn start

}

fix_node_gyp_ () {
    npm i -g node-gyp@latest
    npm config set node_gyp "~/node_modules/node-gyp/bin/node-gyp.js"
    npm config set node_gyp "/Users/kmurani/.nvm/versions/node/$(node -v)/lib/node_modules/node-gyp/bin/node-gyp.js"
}

kill_local_dml() {
    ps -ef | grep "com.booking.dml.MainApplication server" | awk {'print $2; exit'} | xargs -I PID kill -9 PID
}

perl_critic_this() {
    PERL5LIB="lib/:inc/Perl-Critic-Policy-BCritical/lib/" perlcritic --profile=.perlcriticrc $1
}

