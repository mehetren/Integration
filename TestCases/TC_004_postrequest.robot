*** Settings ***
Library  RequestsLibrary
Resource    cert.txt
Resource    key.txt

*** Variables ***
${Base_Url}  https://qa.api.audi.de/
${cert_path}    cert.txt
${key_path}     key.txt


*** Test Cases ***
TC_004_postrequest
    create session  API_Testing  ${Base_Url}    verify=true
    @{client certs}=  create list  ${cert_path}  ${key_path}
    Create Client Cert Session    alias=API_Testing    url=${Base_Url}  client_certs=${client certs}  verify=False
    ${header}=  create dictionary  client_id=32d8e37e62fc4697aba3ad71f2e2e764  client_secret=bF7fB57AF49d46b889a9F2eCc127dA48  Content-Type=application/json
    ${end_point}=   Set Variable    rocky-oem/ping-spr/v1/ping
    ${keylist}=     Create Dictionary    key=customerId  value=0001000000002031
    ${jsonobject}=  Create Dictionary   market=de   timestamp=2022-03-16T06:41:37.290534Z
    ${body}=    Create Dictionary   ping=0  eventDescription=CDC_GoldenRecord_Changed   caller=CDC  keyList=${keylist}  json_object=${jsonobject}
    ${post_Response}=   POST On Session        API_Testing     ${end_point}   data=${body}  headers=${header}
    ${json_data}=  Set Variable    ${Get_Response.json()}
    ${status_code}=  Convert To String      ${Get_Response.status_code}
    Log To Console    ${json_data}
    Log To Console    ${status_code}
    Should Be Equal    ${status_code}   202


