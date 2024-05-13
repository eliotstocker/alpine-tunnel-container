#!/bin/sh

echo "running code deamon as root..." && id

su - code

# needed to run parameters CMD

code tunnel --accept-server-license-terms --name "${TUNNEL_NAME}" --cli-data-dir "${TUNNEL_CONFIG_DIR}"
