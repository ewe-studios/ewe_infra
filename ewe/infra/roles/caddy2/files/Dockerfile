FROM caddy:2.8.4-builder AS builder

RUN xcaddy build \
    --with github.com/caddyserver/nginx-adapter \
    --with github.com/caddy-dns/linode \
    --with github.com/caddy-dns/cloudflare \
    --with github.com/caddy-dns/namecheap \
    --with github.com/caddy-dns/bunny \
    --with github.com/caddy-dns/azure \
    --with github.com/caddy-dns/netlify \
    --with github.com/caddy-dns/porkbun \
    --with github.com/caddy-dns/dnsimple \
    --with github.com/ueffel/caddy-brotli \
    --with github.com/greenpau/caddy-git \
    --with github.com/caddyserver/jsonc-adapter \
    --with github.com/abiosoft/caddy-yaml \
    --with github.com/caddyserver/json5-adapter \
    --with github.com/awoodbeck/caddy-toml-adapter \
    --with github.com/mholt/caddy-ratelimit \
    --with github.com/lolPants/caddy-requestid \
    --with github.com/WingLim/caddy-webhook \
    --with github.com/muety/caddy-remote-host \
    --with github.com/mholt/caddy-l4 \
    --with github.com/hslatman/caddy-crowdsec-bouncer \
    --with github.com/greenpau/caddy-security \
    --with github.com/caddy-dns/vercel

FROM caddy:2.8.4

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

CMD ["/usr/bin/caddy"]