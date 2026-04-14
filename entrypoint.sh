#!/bin/sh
# Generate config.js (still needed for table IDs, but no token)
cat > /usr/share/nginx/html/config.js <<EOF
var CASA_CONFIG = {
  API_BASE: "/api/v1",
  BASE_ID: "${NOCO_BASE_ID:-p0fukhef8vmwa06}",
  TABLE_TAREFAS: "${NOCO_TABLE_TAREFAS:-mv2s44i1vu15sax}",
  TABLE_REGISTROS: "${NOCO_TABLE_REGISTROS:-m9f2fsx0rjf6wb2}"
};
EOF

# Generate nginx config from template
export NOCO_TOKEN="${NOCO_TOKEN}"
envsubst '${NOCO_TOKEN}' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf

exec nginx -g 'daemon off;'
