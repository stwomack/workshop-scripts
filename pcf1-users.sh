#!/bin/bash
names=(
#aripka@pivotal.io
#bjimerson@pivotal.io
cbusch@pivotal.io
swomack@pivotal.io
)


for name in ${names[@]}
do
  echo $name
  org=${name%@*}-org
  echo $org
  cf create-user $name password
  cf create-org $org
  cf set-org-role $name $org OrgManager
  cf create-space development -o $org
  cf set-space-role $name $org development SpaceDeveloper
  cf set-space-role $name $org development SpaceManager
  cf set-space-role $name $org development SpaceAuditor

  cf create-space stage -o $org
  cf set-space-role $name $org stage SpaceDeveloper
  cf set-space-role $name $org stage SpaceManager
  cf set-space-role $name $org stage SpaceAuditor

  cf create-space production -o $org
  cf set-space-role $name $org production SpaceDeveloper
  cf set-space-role $name $org production SpaceManager
  cf set-space-role $name $org production SpaceAuditor
done
