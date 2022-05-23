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
--header 'Authorization: eyJhbGciOiJSU0EtT0FFUC0yNTYiLCJlbmMiOiJBMTI4R0NNIn0.tDXl0TQEXJaEdao3Qb2-dYvFMi-v8sOuxSBqJ2DPvmCy4AWDmoh6V3NIyATypVQl8WRjW47CAIt2TeG9AFAgNDDBwrpmlCiTrjSmq82NkVG9XUa_QROq5XFYueGYzfbHpIIQxwdePaQnW_rMPu-IX1cX8rjLCX_Y6LyJaQtAUkHXNaT2708DZjJNxr2hLKomzTV78GqveXz9RAg59UVnIsFu_45XW8FhqriWhJlQHcPEAa0uKbUcWu-oy-cuTcxsv2ax29rJppUihqDHwYaWgasgFxgFJ4dmKUhAG_lCEUEiqQSJn_quuv5-dNkknwWRhc9kMVpvn9xVKci1_enuFQ.S7qNN17RYUSw5sPJ.uIQrBrZa034DhRolBQYlC4a6DTpXrqXzC3Z_FBVPss7_CNqUsjr80lbLDJ9fqQMNFdTMyidet-gqHLLif4dOYYmR3FtuAZ5IxrJb.5fLZ0H5HN5OD5ZScEvFCgw' \
# --header 'Authorization: $TOKEN' \
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

