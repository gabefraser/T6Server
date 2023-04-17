#!/bin/bash
## Variable Region
_script="$(readlink -f ${BASH_SOURCE[0]})" 
# Delete last component from $_script
_mydir="$(dirname $_script)"

# Update your server game file
./plutonium-updater -d "$INSTALL_DIR"
## End Region

## Server Start Region
echo -e '\033]2;'Plutonium - $SERVER_NAME - Server restart'\007'
echo "Visit plutonium.pw | Join the Discord (plutonium) for NEWS and Updates!"
echo "Server "$SERVER_NAME" will load $CFG_FILE and listen on port $GAME_PORT UDP!"
echo "To shut down the server close this window first!"
printf -v NOW '%(%F_%H:%M:%S)T' -1
echo ""$NOW" $SERVER_NAME server started."

while true
do
wine .\\bin\\plutonium-bootstrapper-win32.exe $GAME_MODE $GAME_PATH -dedicated +start_map_rotate +set key $SERVER_KEY +set net_port $GAME_PORT +set sv_config $CFG_FILE 2> /dev/null
printf -v NOW '%(%F_%H:%M:%S)T' -1
echo ""$NOW" WARNING: $SERVER_NAME server closed or dropped... server restarting."
sleep 1
done
## End Region