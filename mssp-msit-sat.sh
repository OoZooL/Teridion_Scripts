#!/bin/bash

curl -X POST -H 'X-NSONE-Key: tX4Qa956NarIbk6XeNHV' -d '{"domain":"mssp-msit.teridions.net","zone":"teridions.net","use_client_subnet":true,"answers":[{"answer":["MSSP-MSIT-SAT.teridions.net"],"meta":{"up":true},"id":"5914ae610c13a40001e0e0cd"},{"answer":["MSSP-MSIT-ORD.teridions.net"],"meta":{"up":false},"id":"5914aeecc9c79d0001ed86ed"}],"id":"5914ae610c13a40001e0e0ce","regions":{},"meta":{},"link":null,"filters":[{"filter":"up","config":{}}],"ttl":600,"tier":2,"type":"CNAME","networks":[0,11]}' https://api.nsone.net/v1/zones/teridions.net/mssp-msit.teridions.net/CNAME

