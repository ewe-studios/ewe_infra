# Podman

## Trying to build docker image from Dockerfile fails with known shorthand name

Add /enable `docker.io` as an `unqualified-search-registries`

```bash
> Podman "Error: no registries found in registries.conf, a registry must be provided"
```

To fix:

- For local rootless setup:

```bash
$ cat .config/containers/registries.conf
unqualified-search-registries = ["docker.io"]
```

- For rootful setup:

```bash
$ cat /etc/containers/registries.conf

unqualified-search-registries = ["registry.access.redhat.com", "registry.fedoraproject.org", "docker.io"]
```
