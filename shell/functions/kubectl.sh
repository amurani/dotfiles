kpod () {
    kubectl get pods -o=json | jq -r '.items[0].metadata.name'
}

klogs () {
    pod_name=$(kubectl get pods -o=json | jq -r '.items[0].metadata.name')
    kubectl logs -f -c app $pod_name
}

kshell () {
    pod_name=$(kubectl get pods -o=json | jq -r '.items[0].metadata.name')
    kubectl exec -it $pod_name -- /bin/bash
}

kpod_url () {
    echo "https://$(kubectl get service backend -o jsonpath='{.metadata.annotations.kubernetes\.fqdn}')"
}

kdesc_pod () {
    pod_name=$(kubectl get pods -o=json | jq -r ".items[${1:-0}].metadata.name")
    kubectl describe pod $pod_name
}

kfqdn () {
    kubectl get svc $1 -o yaml | yq '.metadata.annotations."kubernetes.fqdn"'
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

