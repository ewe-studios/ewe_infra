FROM caddy:2.6.2-builder AS builder

RUN xcaddy build \
    --with github.com/caddyserver/nginx-adapter \
    --with https://github.com/tosie/caddy-dns-linode \
    --with https://github.com/ueffel/caddy-brotli \
    --with https://github.com/greenpau/caddy-git \
    --with https://github.com/mholt/caddy-ratelimit \
    --with https://github.com/lolPants/caddy-requestid \
    --with https://github.com/WingLim/caddy-webhook \
    --with https://github.com/muety/caddy-remote-host \
    --with https://github.com/mholt/caddy-l4 \
    --with https://github.com/hslatman/caddy-crowdsec-bouncer \
    --with https://github.com/mohammed90/caddy-ssh \
    --with https://github.com/greenpau/caddy-security \
    --with https://github.com/mohammed90/caddy-ssh \
    --with https://github.com/caddy-dns/vercel

FROM caddy:2.6.2

COPY --from=builder /usr/bin/caddy /usr/bin/caddy