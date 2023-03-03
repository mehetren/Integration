*** Settings ***
Library  RequestsLibrary
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Resource    api_sample_project/Resources/UserKeyword_001.robot
# WETEAMF-1840

*** Variables ***
${Base_url}     https://qa.backend-api.audi.de
${vehicle_id}   WVWZZZAUZFW003688


*** Test Cases ***
TC 005 getrequest WETEAMF 1840
    WETEAMF-1840 Fetch Data and validate status code    WVWZZZAUZFW003688   200



