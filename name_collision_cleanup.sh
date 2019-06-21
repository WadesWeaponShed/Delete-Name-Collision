printf "\nWhat is the IP address or Name of the Domain or SMS you want to check?\n"
read DOMAIN

mgmt_cli -r true -d $DOMAIN show objects filter "NAME_COLLISION_RESOLVED" limit 500 --format json | jq --raw-output '.objects[] | "mgmt_cli delete " + .type + " name " + .name' >delete_collision.txt


sed -i '1s/^/mgmt_cli -r true login > id.txt\n/' >delete_collision.txt
echo "mgmt_cli -s id.txt publish" >> delete_collision.txt
echo "mgmt_cli -s id.txt logout" >> delete_collision.txt
chmod +x delete_collision.txt
sh delete_collision.txt
