# set target environment in which to create users
uaac target uaa.sys.kingcity.cf-app.com --skip-ssl-validation

# Note: <Elastic Runtime/Credentials/UAA/Admin Client Credentials>
uaac token client get admin -s JkiJhXod-pIWO95Snoafx2nmE3XLJbvL

# Steve
uaac user add swomack@pivotal.io -p pivotal1 --emails swomack@pivotal.io
uaac member add cloud_controller.admin swomack@pivotal.io
uaac member add uaa.admin swomack@pivotal.io
uaac member add scim.read swomack@pivotal.io
uaac member add scim.write swomack@pivotal.io

exit

# Chris
#uaac user add cbusch@pivotal.io -p pivotal1 --emails cbusch@pivotal.io
#uaac member add cloud_controller.admin cbusch@pivotal.io
#uaac member add uaa.admin cbusch@pivotal.io
#uaac member add scim.read cbusch@pivotal.io
#uaac member add scim.write cbusch@pivotal.io
