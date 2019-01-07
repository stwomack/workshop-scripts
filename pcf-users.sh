#!/bin/bash
names=(
user1
)

for name in ${names[@]}
do
  echo $name
  #org=${name%@*}-org
  org=abi
  echo $org
  cf create-user $name pivotal1
  cf create-org $org
  cf set-org-role $name $org OrgManager
  cf create-space dev -o $org
  cf set-space-role $name $org dev SpaceDeveloper
  cf set-space-role $name $org dev SpaceManager
  cf set-space-role $name $org dev SpaceAuditor

#  cf create-space stage -o $org
#  cf set-space-role $name $org stage SpaceDeveloper
#  cf set-space-role $name $org stage SpaceManager
#  cf set-space-role $name $org stage SpaceAuditor

#  cf create-space production -o $org
#  cf set-space-role $name $org production SpaceDeveloper
#  cf set-space-role $name $org production SpaceManager
#  cf set-space-role $name $org production SpaceAuditor
done
