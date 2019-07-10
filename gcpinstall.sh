#! /bin/bash
#curl https://sdk.cloud.google.com | bash
#after installing the google  cloud sdk
#setup a project using these lines
gcloud projects create sully-07041996 --name="server project" --set-as-default

gcloud iam service-accounts create --display-name="ServerAccounts" test-service-accounts

#gcloud projects add-iam-policy-binding sully-07041996 --member='serviceAccounts:test-service-accounts@sully-07041996.iam.gserviceaccount.com' --role='roles/compute.admin'
#Ensure your billing is enabled before setting up the vm

gcloud compute instances create --machine-type n1-standard-1 --zone europe-west2-c --tags api myservers

gcloud compute ssh --zone europe-west2-c myservers --command="sudo apt-get update"
gcloud compute ssh --zone europe-west2-c myservers --command="sudo apt-get install git -y"
gcloud compute ssh --zone europe-west2-c myservers --command="git clone https://github.com/SulaymanSaleem/poolSetup"
gcloud compute ssh --zone europe-west2-c myservers --command="sudo chmod ug+rwx ./poolSetup/install.sh"
gcloud compute ssh --zone europe-west2-c myservers --command="./poolSetup/install.sh"
