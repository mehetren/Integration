#WETEAMF-415 - we are using article end point with article id as parameter & path parameters like language & mandator passing with the help of
#GET request and fetching that article data also validating the status code 200

*** Settings ***
Library  RequestsLibrary


*** Variables ***
${Base_Url}  https://qa.api.audi.de/


*** Test Cases ***
TC_003_getrequest
    create session  API_Testing  ${Base_Url}    verify=true
    ${header}=  create dictionary  client_id=32d8e37e62fc4697aba3ad71f2e2e764  client_secret=bF7fB57AF49d46b889a9F2eCc127dA48
    ${end_point}=   Set Variable    rocky-oem/knowledge/v1/articles/0100415e-cd32-4785-9981-7e0d54ffceg2?mandator=AUDI&language=en
    ${Get_Response}=  GET On Session    API_Testing     ${end_point}   headers=${header}
    ${json_data}=  Set Variable    ${Get_Response.json()}
    ${status_code}=  Convert To String      ${Get_Response.status_code}
    Log To Console    ${json_data}
    Log To Console    ${status_code}
    Should Be Equal    ${status_code}   200


