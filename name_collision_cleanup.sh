printf "\nWhat is the IP address or Name of the Domain or SMS you want to check?\n"
read DOMAIN

mgmt_cli -r true -d $DOMAIN show objects filter "NAME_COLLISION_RESOLVED" limit 500 --format json | jq --raw-output '.objects[] | "mgmt_cli -r true delete " + .type + " " + .name' >delete_collision.txt

chmod +x delete_collision.txt
sh delete_collision.txt
