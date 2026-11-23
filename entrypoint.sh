#!/bin/sh
set -e
PORT="${PORT:-8080}"
UUID="629aeb8a-e8b2-4ab7-8359-ed2af5e45ec4"
WSPATH="/ws-629aeb8a"
mkdir -p /etc/sing-box
cat > /etc/sing-box/config.json <<JSON
{
  "log": { "level": "info" },
  "inbounds": [
    {
      "type": "vless",
      "tag": "vless-in",
      "listen": "0.0.0.0",
      "listen_port": ${PORT},
      "users": [ { "uuid": "${UUID}" } ],
      "transport": { "type": "ws", "path": "${WSPATH}" }
    }
  ],
  "outbounds": [ { "type": "direct", "tag": "direct" } ]
}
JSON
echo "sing-box listening on port ${PORT}, ws path ${WSPATH}"
exec /usr/local/bin/sing-box run -c /etc/sing-box/config.json
