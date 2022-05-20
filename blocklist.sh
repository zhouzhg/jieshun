#!/bin/bash
funcurl=https://devsl-api.bitkinetic.com/api/v2/block/up
config=./jieshun/config.json
# cat $config
# curl -k -H "Content-Type:application/json;charset=utf-8" $funcurl -X POST -d "${namejson}" >> nameOutput.txt
blocklist=`cat $config|jq '.blocklist'`
fuzzylist=`cat $config|jq '.fuzzylist'`
whitelist=`cat $config|jq '.whitelist'`
echo "==============================="
echo "TOKEN: $TOKEN"

request=`curl --request POST $funcurl \
--header 'Content-Type: application/json' \
# --header 'Authorization: eyJhbGciOiJSU0EtT0FFUC0yNTYiLCJlbmMiOiJBMTI4R0NNIn0.YCmty5QJ4ILqoU7a6XG43jg3zQW3R7h3tRYYWGgo0NC_8FGj9_lPiADNLDtT9-RIVF3aB0cnXNLCTtP95kjHyMcyRTVfKsBBAFVtff3Zqu0Ms_dBLU9C3xWGacjVSQh4UbeUnEKAZtbIT6nxvI0OmFqM5jo9MlksblTZ37TcZjjS_7MRjzjOSpj4Cs7Vcdzb_IYwlMjlCZgK0w8t0ui2ehZo1hcUjiuCkUNjP2t581jKhB-s7oHGKYiki0N8H97FpILGQFVTlW27iC6O0xgOI-LmK541NYwU5FpPOeC-VrJ-ZbzvAjhiyh68oWUZWMZYEo0i5xLoiPd5TCz-SF3WBw.UfrsDvTagiyHV2ho.SeXKvXIvgzAP5YudmfW_glsq6ZD3yYgfDsbW_GqAgQmyjAJ38axhkQ_LUzTe-XdJbFplf9v8hKcA09eW76Oh263cSf8Vwx08zUKQ.6J-PLv4LNCPaiesqWRoD5Q' \
--header 'Authorization: $TOKEN' \
-d "{
        "version:" : 1,
        "blocklist": $blocklist,
        "fuzzylist": $fuzzylist,
        "whitelist": $whitelist
}"`
echo "=============打印请求返回结果============="
echo $request
echo "=============打印请求返回码============="
# request_code=`echo $request|awk -F ':' '{print $2}'|awk -F ',' '{print $1}'`
request_code=`echo $request|awk -F '[:,]' '{print $2}'`
echo "request_code: $request_code"
expr $request_code + 1 >  /dev/null 2>&1
if [ $? -eq 0 ] && [ $request_code -eq 200 ];then
	echo "api request is success"
else
	 echo "api request is fail"
fi

