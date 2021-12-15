#!/bin/bash

curl -X POST -H 'X-NSONE-Key: tX4Qa956NarIbk6XeNHV' -d '{"domain":"mssp-edog.teridions.net","zone":"teridions.net","use_client_subnet":true,"answers":[{"answer":["MSSP-EDOG-DSM.teridions.net"],"meta":{"up":false},"id":"5914af40c9c79d0001ed8725"},{"answer":["MSSP-EDOG-SAT.teridions.net"],"meta":{"up":true},"id":"5914afccc9c79d0001ed87c7"}],"id":"5914af40c9c79d0001ed8726","regions":{},"meta":{},"link":null,"filters":[{"filter":"up","config":{}}],"ttl":600,"tier":2,"type":"CNAME","networks":[0,11]}' https://api.nsone.net/v1/zones/teridions.net/mssp-edog.teridions.net/CNAME


