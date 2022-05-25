#!/bin/bash
funcurl=$funcurl
config=./$pj_name/config.json
blocklist=`cat $config|jq '.blocklist'`
fuzzylist=`cat $config|jq '.fuzzylist'`
whitelist=`cat $config|jq '.whitelist'`
request=`curl --request POST $funcurl \
--header "Content-Type: application/json" \
--header "Authorization: $ACCESS_TOKEN" \
-d "{
        \"version:\" : 1,
        \"blocklist\": $blocklist,
        \"fuzzylist\": $fuzzylist,
        \"whitelist\": $whitelist
}"`
echo $request
request_code=`echo $request|awk -F '[:,]' '{print $2}'`
echo "request_code: $request_code"
expr $request_code + 1 >  /dev/null 2>&1
if [ $? -eq 0 ] && [ $request_code -eq 200 ];then
        echo "api request is success"
else
        echo "api request is fail"
fi
