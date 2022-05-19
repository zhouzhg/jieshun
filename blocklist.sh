#!/bin/bash
funcurl=https://devsl-api.bitkinetic.com/api/v2/block/up
config=./jieshun/config.json
cat $config
# curl -k -H "Content-Type:application/json;charset=utf-8" $funcurl -X POST -d "${namejson}" >> nameOutput.txt


curl --request POST $funcurl \
--header 'Content-Type: application/json' \
--header 'Authorization: eyJhbGciOiJSU0EtT0FFUC0yNTYiLCJlbmMiOiJBMTI4R0NNIn0.UcDWhnTaYEj-uH-RztubWYxHijMup9OuvvwsgsMnak-4dPI8-AqtXlJd0NGsX3n-7qNVGbZXIYNRttyoUiARacYRButSsAvS3FZhgk7cUe2PLYIQQLf9gdxGcIdv5aNAPCxZi
XXamCxn8IGZuTDyM4ZLzKmlLNlPpI_aZ4gacBf8QSi35ggon2nCJh8hlF25Clv6lVf3SBRDBlotWHvIzHpwQugVms78zizhDLsii961cKUg-Ax4WlYzwDG-Iyj7h4bRmzGVvJULyUsoFDjlvmDN_IbIJigDtj9oQoQ936lBrEjKHSMJVc2c9B2LjHcwLTFGk9GbTtHdlJ09s8RKAQ.Txi3Z0nLARHT0lwX.BLfpL2WYWbMRAki7PHJcN9f50s-U_NKvQGsOh1kSWQ6KnviXEwY40qMQaa8bLxeOehhXza1VZrDpBcnq5ML2GTYa5-o7R4A.Ly_sRZ9L9Pdooi8wwv2acg' \-d "{
        "version:" : `cat $config|jq '.version'`,
        "blocklist": `cat $config|jq '.blocklist'`,
        "fuzzylist": `cat $config|jq '.fuzzylist'`,
        "whitelist": `cat $config|jq '.whitelist'`
}"
#-d `cat ${config}`
#-d '{
#    "version": 1,
#    "blocklist": [
#        "-magiceden.io",
#        "0120tt.com"
#    ],
#    "fuzzylist": [],
#    "whitelist": []
#}'
