Set up redis saving and example env

aggregation / background processing
visualization - show devices
visualization - show requests realtime

## Create A Device:

http --form POST http://localhost:9000/devices device\[name\]=test device\[uuid\]=test device\[location\]=test device\[model_name\]=test

## Create A Device with Virtual+Physical Entities

http --form POST http://localhost:9000/devices device\[name\]=test device\[uuid\]=test device\[location\]=test device\[model_name\]=test device\[physical_entity_attributes\]\[name\]=test device\[physical_entity_attributes\]\[description\]=test device\[physical_entity_attributes\]\[location\]=location device\[virtual_entity_attributes\]\[uuid\]=null

## List Devices:

http http://localhost:9000/devices

## View a Device:

http http://localhost:9000/devices/:id

## Delete a Device

http DELETE http://localhost:9000/devices/:id

## Create Physical Entity:

http --form POST http://localhost:9000/physical_entities physical_entity\[name\]=test physical_entity\[description\]=test physical_entity\[location\]=test

## Create Virtual Entity:

http --form POST http://localhost:9000/virtual_entities virtual_entity\[physical_entity_id\]=1


## Create Data:

http --form POST http://localhost:9000/data datum\[data_type\]=Float datum\[value\]=test datum\[virtual_entity_id\]=1

