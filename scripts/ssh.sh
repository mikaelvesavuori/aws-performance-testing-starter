#!/bin/bash

################################
# Connect to your EC2 instance #
################################

# EDIT THESE
KEY_PAIR_FILENAME="my_key_pair.pem"
LOCATION="ec2-user@ec2-some-ip.region.compute.amazonaws.com"

chmod 400 ${KEY_PAIR_FILENAME}
ssh -i "${KEY_PAIR_FILENAME}" ${LOCATION}
