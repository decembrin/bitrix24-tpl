#!/bin/sh

if [ ! -d "/home/bitrix/www/bitrix/modules/main" ]; then
    echo "Download bitrix24"
    curl -SL https://www.bitrixsoft.com/download/portal/en_bitrix24_encode.tar.gz --output en_bitrix24_encode.tar.gz --progress-bar
fi

exec "$@"
