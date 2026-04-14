#!/bin/sh
# Generate config.js from environment variables
cat > /usr/share/nginx/html/config.js <<EOF
var CASA_CONFIG = {
  API_BASE: "${NOCO_URL:-https://nocodb.papelariaunicornio.com.br/api/v1}",
  TOKEN: "${NOCO_TOKEN}",
  BASE_ID: "${NOCO_BASE_ID:-p0fukhef8vmwa06}",
  TABLE_TAREFAS: "${NOCO_TABLE_TAREFAS:-mv2s44i1vu15sax}",
  TABLE_REGISTROS: "${NOCO_TABLE_REGISTROS:-m9f2fsx0rjf6wb2}"
};
EOF

exec nginx -g 'daemon off;'
