# Setup system configuration

CURRENT_DIR=$(dirname $0)
cd $CURRENT_DIR

# Get a hosts list to prevent connecting to known non-secure sites
echo 'Updating hosts file'
TEMP_FILE='hosts.tmp'
curl https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts -o $TEMP_FILE
cat custom_hosts >> $TEMP_FILE
sudo cp $TEMP_FILE /etc/hosts
rm $TEMP_FILE
echo 'Done! The computer needs to reboot'

# TODO: setup pfctl firewall
