#!/bin/bash
funcurl=https://devsl-api.bitkinetic.com/api/v2/block/up
config=./jieshun/config.json
# cat $config
# curl -k -H "Content-Type:application/json;charset=utf-8" $funcurl -X POST -d "${namejson}" >> nameOutput.txt
blocklist=`cat $config|jq '.blocklist'`
fuzzylist=`cat $config|jq '.fuzzylist'`
whitelist=`cat $config|jq '.whitelist'`
echo "==============================="

request=`curl --request POST $funcurl \
--header "Content-Type: application/json" \
--header "Authorization: $ACCESS_TOKEN" \
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

