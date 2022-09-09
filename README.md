# shkeeper-helm-docker

## What is Shkeeper Helm?
We have made a Shkeeper Helm for easy-way deployment of Shkeeper wallets holder and crypto daemons (Now available BTC, LTC, DOGE), which used by Shkeeper.
You can easily deploy it with Helm manager on your kubernetes cluster, and it makes all instalation on itself. After deployment Shkeeper, cluster will 
manage four deployments: shkeeper, dogecoind, litecoind and bitcoind. All images are stored 
as public on our [docker hub account](https://hub.docker.com/u/vsyshost).
## Installation Shkeeper with Helm manager
### Requirments
- kubectl
- helm

### Installation
1.At first we need to clone Shkeeper repository locally on our machine.
```
git clone https://github.com/vsys-host/shkeeper-helm-docker.git
```

2.Before deploy Shkeeper, check with kubectl that you connected to right cluster.(We recommend to use nodes with high network bandwidth, because initialy, crypto deamons consume a lot of network resources to sync blockchain.)
```
kubectl cluster-info
```
As a result of command, you should see outpur that describe where kubernetes control plane is running.

3.If all is okay, we can deploy our Chart with Helm. Run helm install command.
```
helm install shkeeper ./shkeeper-helm-docker/helm/.
```
You should see that Chart is deployed. 

4.Use kubectl to get IP of Shkeeper web-interface.
```
kubectl get svc -o wide
```
Find service with shkeeper name and take EXTERNAL-IP of it. Web-interface runs on 5000 port, so to access it use: 
```
[EXTERNAL-IP]:5000
```

### Issues
1. After installation, you can face with issus when accessing Shkeeper Web-interface.(It can be inaccessible or overload).
  Most likely this issue occurs due to synchronization of blockchain for crypto deamons. You should be patient, because it can take
  a while, before Web-interface will be reacheble. That's why we recommend to use nodes with high network bandwidth.
  
  
  
  
  
