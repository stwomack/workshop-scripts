# set target environment in which to create users
uaac target uaa.pcf1.fe.gopivotal.com --skip-ssl-validation

# Note: <Elastic Runtime/Credentials/UAA/Admin Client Credentials>
uaac token client get admin -s cef699394779b6eef810

# Chris
uaac user add cbusch@pivotal.io -p password --emails cbusch@pivotal.io
uaac member add cloud_controller.admin cbusch@pivotal.io
uaac member add uaa.admin cbusch@pivotal.io
uaac member add scim.read cbusch@pivotal.io
uaac member add scim.write cbusch@pivotal.io

# Steve
uaac user add swomack@pivotal.io -p password --emails swomack@pivotal.io
uaac member add cloud_controller.admin swomack@pivotal.io
uaac member add uaa.admin swomack@pivotal.io
uaac member add scim.read swomack@pivotal.io
uaac member add scim.write swomack@pivotal.io

