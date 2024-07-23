curl --location --request POST 'localhost:9012/services/v2/authorizations/operator/ggnet' \
--header 'Authorization: Basic b2dnYWRtaW46QWRtaW5AMTE=' \
--header 'Content-Type: application/json' \
--data-raw '{
    "credential":"Admin@11",
    "info":"User to authenticate source and destination GG"
}'