*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library     readcontent.py

*** Variables ***


*** Keywords ***
Fetch post request payload
    ${request_data}=    read_json_file
    [Return]    ${request_data}