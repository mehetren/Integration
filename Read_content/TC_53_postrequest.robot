*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource    UserKeyword_fetchdata.robot

*** Variables ***
${Base_Url}     https://qa.backend-api.audi.de/



*** Test Cases ***
TC_53_postrequest
    create session  API_Testing  ${Base_Url}    verify=true
    ${header}=  create dictionary  client_id=32d8e37e62fc4697aba3ad71f2e2e764  client_secret=bF7fB57AF49d46b889a9F2eCc127dA48   Content-Type=application/json
    ${end_point}=   Set Variable    papi/customer-onecrm-nsctemplate/v1/customers
    ${jsondata}=    Fetch post request payload
    ${post_Response}=   POST On Session        API_Testing     ${end_point}   data=${jsondata}  headers=${header}
    ${json_data}=  Set Variable    ${post_Response.json()}
    ${status_code}=  Convert To String      ${post_Response.status_code}
    Log To Console    ${json_data}
    Log To Console    ${status_code}
    Should Be Equal    ${status_code}   201




