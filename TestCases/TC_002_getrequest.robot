*** Settings ***
Library  RequestsLibrary


*** Variables ***
${Base_Url}  https://qa.api.audi.de/


*** Test Cases ***
TC_002_getrequest
    create session  API_Testing  ${Base_Url}    verify=true
    ${header}=  create dictionary  client_id=32d8e37e62fc4697aba3ad71f2e2e764  client_secret=bF7fB57AF49d46b889a9F2eCc127dA48
    ${Get_Response}=  GET On Session    API_Testing  rocky-oem/vehicle/v1/vehicles/WAUZZZ8X7BB021211    headers=${header}


