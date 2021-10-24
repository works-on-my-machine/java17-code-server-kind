# Code Server with Java 17 and Maven Running on KinD

## Requirements
- kind
- kubectl
- docker

## Install
```bash
# Create a kubernetes node with kind
kind create cluster

# Deploy codeserver
kubectl create -f codeserver.yaml

# Forward port to pod
kubectl port-forward pod/codeserver 8443 8443

# Inside codeserver
sdk install java 17.0.0-oracle
```