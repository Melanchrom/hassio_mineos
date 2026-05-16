#!/usr/bin/with-contenv bashio

echo "Hello world!"

uname -a

echo "Alive 1!"
# Check Login data
if ! bashio::config.has_value 'password'; then
    bashio::exit.nok "Setting a password is required!"
fi
echo "Alive 2!"
echo 'root:'$(bashio::config 'password') | chpasswd --crypt-method SHA512
echo "Alive 3!"
cd /usr/games/minecraft
echo "Alive 4!"
node webui.js
echo "Good Bye!"