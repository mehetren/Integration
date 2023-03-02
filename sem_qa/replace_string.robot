*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    String

*** Variables ***

*** Keywords ***
Replace space with plus sign
    ${Result2}=   Replace String      SELECT CreatedDate,LastModifiedDate,Name,RCY_AssetResultList__c,RCY_Brand__c,RCY_ExternalID__c FROM Asset WHERE VIN__c = 'VSSZZZ5FZJ6500074'    ${SPACE}        +
    [Return]    ${Result2}
