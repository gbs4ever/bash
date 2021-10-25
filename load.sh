#!/bin/bash
echo rails server loads
echo please enter a cmd "(ps/local)"
read VAR
if [[ $VAR == "ps" ]];
then 
echo restating postgress server
sudo service postgresql restart
elif [[ $VAr == "local" ]];
then
echo start local heroku server
heroku local web
else
heroku run bash  
# heroku run rails c 
# AmazonFba.find_by(shipment_id: $ )
#AmazonFba.where(netsuite_status: false)
fi
exit
