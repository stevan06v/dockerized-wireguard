#!/bin/bash
curl ifconfig.me
echo ""
docker run --rm -it ghcr.io/wg-easy/wg-easy wgpw YOUR_PASSWORD
