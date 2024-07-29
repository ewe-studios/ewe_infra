# Docker Learnings

Different insights gained working with docker over the years of this project.

## Ubuntu AppAmore getting in the way

You might try to stop, kill or remove a container and at the end get a `permission denied` error even when you use `sudo`, this is due to AppAmore rules on Ubuntu, not yet sure how to configure this properly so the best quick fix is to delete all unknown rules via:

```bash
sudo aa-remove-unknown
```

This will delete relevant rules and give freedom.

## Unable to connect to container apps

You might have badly configured firewall rules, first disable all rules by allowing connection on all ports and interfaces with:

```bash
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -P FORWARD ACCEPT
sudo iptables -F 
```

Then test access to your containers with:

```bash
curl -vvvv 0.0.0.0:8080
```

Use whatever port you wish to test against.

## Wish to force remove a network device bridge

See below to remove the docker0 bridge

```bash
sudo ip link set docker0 down
sudo brctl delbr docker0
```
