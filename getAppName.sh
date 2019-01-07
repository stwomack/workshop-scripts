DEPLOYED_APPS=$(cf apps | grep attendees | cut -d" " -f1 | tail -1)
echo "${DEPLOYED_APPS}"
