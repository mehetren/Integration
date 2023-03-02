*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
# WETEAMF-1840

*** Variables ***
${Base_url}    https://qa.backend-api.audi.de
#${cert_path}
#${cert_path}
#@{client certs}=  create list  ${cert_path}  ${key_path}

*** Keywords ***
WETEAMF-1840 Fetch Data and validate status code
    [Arguments]     ${vehicle_id}   ${Expected_statuscode}
    Create Session    getsession    ${Base_url}
#    Create Client Cert Session  getsession  url=${Base_url}    client_certs=${client certs}  verify=True
    ${header}=  create dictionary  client_id=32d8e37e62fc4697aba3ad71f2e2e764  client_secret=bF7fB57AF49d46b889a9F2eCc127dA48
    ${response}     GET On Session    getsession    sapi/vehicle-mhs-rocky-oem/v1/vehicles/${vehicle_id}/images
    ${statuscode}   Convert To String    ${response.status_code}
    Should Be Equal    ${statuscode}    ${Expected_statuscode}

