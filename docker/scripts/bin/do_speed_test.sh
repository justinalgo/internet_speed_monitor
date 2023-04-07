json_data=`speedtest-cli --secure --json`
curl -X POST http://elastic:9200/speedtests/_doc -H "Content-Type: application/json" -d "$json_data"