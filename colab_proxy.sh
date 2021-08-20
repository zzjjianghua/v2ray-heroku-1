#! /bin/bash

sudo curl -s -L -o /usr/bin/ray https://github.com/xuiv/v2ray-heroku/releases/download/1.01/ray-linux
sudo curl -s -L -o /usr/bin/config.json https://github.com/xuiv/v2ray-heroku/releases/download/1.01/serverconfig.json
sudo chmod +x /usr/bin/ray
sudo sed -i 's/env:PORT/80/g' /usr/bin/config.json
echo ` curl https://www.trackip.net/i 2> /dev/null |sed -r 's#[^0-9]*([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}).*#\1#' |sed -r '/[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}/!d' |sed -n '1p' `
ray &
