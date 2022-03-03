# husarnet-ssh-proxy

SSH to Husarnet container then from Husarnet container SSH to a host.

## Run on the target host

```
export HUSARNET_JOINCODE=fc94:b01d:1803:8dd8:b293:5c7d:7639:932a/xxxxxxxxxxxxxxxxxxxxxx

docker run -d \
--name ssh-proxy \
--restart unless-stopped \
--env HOSTNAME='ssh-proxy' \
--env JOINCODE=${HUSARNET_JOINCODE} \
--volume h-proxy:/var/lib/husarnet \
--volume h-ssh-keys:/srv/sshd \
--device /dev/net/tun \
--cap-add NET_ADMIN \
--sysctl net.ipv6.conf.all.disable_ipv6=0 \
ghcr.io/dominikn/husarnet-ssh-proxy
```

## Connect to container running on target host

```
ssh ubuntu@ssh-proxy

# password: "ubuntu"
```

or without password prompt with:

```
sshpass -p 'ubuntu' ssh -o StrictHostKeyChecking=no ubuntu@ssh-proxy
```

## Connect to target host

```
ssh <my-username>@172.17.0.1
```