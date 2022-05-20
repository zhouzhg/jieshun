#!/bin/bash
funcurl=https://devsl-api.bitkinetic.com/api/v2/block/up
# config=/root/scripts/config.json
config= ./jieshun/config.json

# cat $config
# curl -k -H "Content-Type:application/json;charset=utf-8" $funcurl -X POST -d "${namejson}" >> nameOutput.txt


curl --request POST $funcurl \
--header 'Content-Type: application/json' \
--header 'Authorization: eyJhbGciOiJSU0EtT0FFUC0yNTYiLCJlbmMiOiJBMTI4R0NNIn0.YCmty5QJ4ILqoU7a6XG43jg3zQW3R7h3tRYYWGgo0NC_8FGj9_lPiADNLDtT9-RIVF3aB0cnXNLCTtP95kjHyMcyRTVfKsBBAFVtff3Zqu0Ms_dBLU9C3xWGacjVSQh4UbeUnEKAZtbIT6nxvI0OmFqM5jo9MlksblTZ37TcZjjS_7MRjzjOSpj4Cs7Vcdzb_IYwlMjlCZgK0w8t0ui2ehZo1hcUjiuCkUNjP2t581jKhB-s7oHGKYiki0N8H97FpILGQFVTlW27iC6O0xgOI-LmK541NYwU5FpPOeC-VrJ-ZbzvAjhiyh68oWUZWMZYEo0i5xLoiPd5TCz-SF3WBw.UfrsDvTagiyHV2ho.SeXKvXIvgzAP5YudmfW_glsq6ZD3yYgfDsbW_GqAgQmyjAJ38axhkQ_LUzTe-XdJbFplf9v8hKcA09eW76Oh263cSf8Vwx08zUKQ.6J-PLv4LNCPaiesqWRoD5Q' \
-d "{
	"version:" : `cat $config|jq '.version'`,
	"blocklist": `cat $config|jq '.blocklist'`,
	"fuzzylist": `cat $config|jq '.fuzzylist'`,
	"whitelist": `cat $config|jq '.whitelist'`
}"
[ $? -eq 0 ] && echo success ||  echo fail 
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

