*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    String
Resource    replace_string.robot

*** Variables ***
${Base_Url}  https://sem-ag-devhub--oemqafull.sandbox.my.salesforce.com/



*** Test Cases ***
    create session  sem_qa  ${Base_Url}    verify=true
    ${end_point}=   Set Variable    services/oauth2/token?grant_type=password&client_id=3MVG9buXpECUESHjKtCVZ.9ex5WPXEdhjxoPunJK.HkC43lNNI1P2hHczKEfy_WfTqJcZG6XVyg4oKRzJttfA&client_secret=2E10D6A8C23DFD71E76ACC9811199277032F304C8C25C68181DB4D183A8BCCCF&username=ramesh.ayyagari@sem.ag.devhub.oemqafull&password=Maheshwara456%23
    ${header}=  Create Dictionary    Content-Type=application/x-www-form-urlencoded Authorization=Basic M01WRzk1QWNCZWFCNTVsWGdocU5FOTRQTjFKOVVuWTlNWnRJNEJacVR1X185SGduc004QTAwYXI3Y195TVRwVzN0NU9oZ1lvUkJsVHQ1Tk1uQnZOaDo1REFBMDI4RDdGMDhFQ0FFNDgyNThDNUExNDc3RjUxQkEzRTkyNkE5QjBBNUM1RTczMTNEOTVFOENCMTU3RTBG
    ${post_Response}=   POST On Session        sem_qa     ${end_point}
    ${json_data}=  Set Variable    ${post_Response.json()}
    ${status_code}=  Convert To String      ${post_Response.status_code}
    Should Be Equal    ${status_code}   200

    ${access_token}=    Get Value From Json    ${json_data}     access_token
    ${token_value}=    get from list       ${access_token}    0
    ${header_query}     Create Dictionary    Authorization=Bearer ${token_value}   Content-Type=application/json   Cache-Control=no-cache
    ${q}=       Replace space with plus sign
    ${query}        Set Variable        ?q=${q}
    ${endpoint_query}   Set Variable    services/data/v48.0/queryAll${query}
    ${get_Response}=    GET On Session      sem_qa      ${endpoint_query}   headers=${header_query}
    Log To Console    ${get_Response.content}
    ${status_code}=     Convert To String    ${get_Response.status_code}
    Should Be Equal    ${status_code}       200



