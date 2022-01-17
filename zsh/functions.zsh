#! /bin/bash

kgsk () {
 kubectl get secret $1 -o json | jq -r ".data.$2" | base64 -d
}

mkcd () {
    mkdir -p $1
    cd $1
}

cdw () {
    cd $CODE_HOME/$1
}

cdp () {
    cd $CODE_HOME/palnabarun/$1
}

cdk () {
    cd $CODE_HOME/kubernetes/$1
}

cdkc () {
    cd $CODE_HOME/kubernetes-client/$1
}

eb64 () {
   echo -n $1 | base64
}

db64 () {
    echo -n $1 | base64 -d
}

switch_gcp () {
    if [ -z $1 ]; then
        echo "No profile name passed."
        exit 1
    fi

    GCP_CRED_HOME=$HOME/.gcloud_credentials
    GCP_CRED_FILE=$GCP_CRED_HOME/$1.json

    if [ ! -f $GCP_CRED_FILE ]; then
        echo "Profile " $1 "not found."
        exit 1
    fi

    if ! gcloud config configurations describe $1; then
        echo "Profie " $1 "not configured in gcloud."
        exit 1
    fi

    export GOOGLE_CREDENTIALS=$GCP_CRED_FILE
    gcloud config configurations activate $1
}

pss () {
    if [ -z $1 ]; then
        echo "No search string passed"
        exit 1
    fi

    ps -eo pid,user,uid,gid,args | grep -v grep | grep $1
}

p () {
    echo $PATH | tr ":" "\n"
}

backup-code-settings () {
    if [[ "$(uname)" == "Linux" ]]; then
        echo "Linux not yet supported."
        exit 1
    fi

    cp $HOME/Library/Application\ Support/Code/User/settings.json ${1:-$PROJECT_HOME/dotfiles}/code/settings.json
}

restore-code-settings () {
    if [[ "$(uname)" == "Linux" ]]; then
        echo "Linux not yet supported."
        exit 1
    fi

    cp ${1:-$PROJECT_HOME/dotfiles}/code/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
}

backup-code-extensions () {
    code --list-extensions > ${1:-$PROJECT_HOME/dotfiles}/code/extensions.txt
}

restore-code-extensions () {
    cat ${1:-$PROJECT_HOME/dotfiles}/code/extensions.txt | xargs -L1 code --install-extension
}
