# husarnet-ssh-server (SSH proxy)

SSH to Husarnet container then from Husarnet container SSH to a host.


## Build

```
docker build -t husarnet-ssh-proxy .
```

## Run

```
export HUSARNET_JOINCODE=fc94:b01d:1803:8dd8:b293:5c7d:7639:932a/xxxxxxxxxxxxxxxxxxxxxx

docker run -it \
--name ssh-proxy \
--env HOSTNAME='ssh-proxy' \
--env JOINCODE=${HUSARNET_JOINCODE} \
--volume h-proxy:/var/lib/husarnet \
--volume h-ssh-keys:/srv/sshd \
--device /dev/net/tun \
--cap-add NET_ADMIN \
--sysctl net.ipv6.conf.all.disable_ipv6=0 \
husarnet-ssh-proxy
```

## Connect to proxy

```
sshpass -p 'ubuntu' ssh -o StrictHostKeyChecking=no ubuntu@ssh-proxy
```

## Connect to target host

```
ssh <my-username>@172.17.0.1
```