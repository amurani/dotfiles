kpod () {
    kubectl get pods | awk 'NR>1' | fzf | awk '{ print $1 }'
}

klogs () {
    kubectl logs -f -c app $(kpod)
}

kshell () {
    kubectl exec -it $(kpod) -- /bin/bash
}

kontainer() {
    kubectl get pod -o yaml | yq -o json | fx '.items[0].status.containerStatuses.map(container => container.name).join("\n")' | fzf
}

kontainer_logs () {
    kubectl logs -f -c $(kontainer) $(kpod)
}

ksvc () {
    kubectl get svc | awk 'NR>1' | fzf | awk '{ print $1 }'
}

kpoddesc () {
    kubectl describe pod $(kpod)
}

kfqdn () {
    echo "http://$(kubectl get svc $(ksvc) -o yaml | yq '.metadata.annotations."kubernetes.fqdn"')"
}

kcluster () {
    kubectl config get-contexts | awk 'NR>1' | fzf | awk '{ print $2 }'
}

function wait_for_pod {
    set +x
    echo "Waiting until the service is up-and-running by checking pod status is Running?"
    c=0
    patterns=("⡿", "⣟", "⣯", "⣷", "⣾", "⣽", "⣻", "⢿", "⡿")
    factor=${#patterns[@]}
    iterations=$(expr $factor \* 4 )
    index=1
    while [ "$(kubectl get pods $1 | sed -n 2p | awk '{print $3}')" != "Running" ]; do
        ((c++)) && ((c==$WAIT_TIMEOUT)) && exit 1
        val=$(expr $index % $factor);
        echo -ne "Waiting for running pod ... ${patterns[$val]}\r";
        sleep 0.1;
    done
    echo -ne '\n'
     set -x
}

