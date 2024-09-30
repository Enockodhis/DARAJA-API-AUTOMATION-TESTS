# TC1_GET_AccessToken.robot

## *** Settings ***
Metadata    Author    Enock Odhiambo Omondi

Metadata    Version    1.0.0

Documentation  DARAJA API AUTOMATION TESTS

Resource    ../Resources/keywords.robot

Variables  ../Resources/TestData/Testdata.py

## *** Test Cases ***
Generate an OAuth Access Token Successfully
    [Documentation]    This test case initiates an online Lipa na M-Pesa payment request
    
    [Tags]    Regression
    
    Given user sets basic auth Username tfKslEMHfAz4LyUsHWuVTdJb4dQLBPl2CdAwuz1hcFNX29aa and Password eenyvddHG877IxZIfUCr3cswPqAMtySzEG5IcGvXxzXsvawvQgRBX4gWhU35cvA5
    
    And user adds cookies {"XSRF-TOKEN":"incap_ses_1018_2742146=4bysRlIywk6euaR/wKkgDpLg9mYAAAAAghC2DU3s4RXnt8ybUEzrUA==; incap_ses_1024_2742146=/AaoV/Q5zCwPxKJYxvo1Ds7f9mYAAAAAAFDGXNbzP5qAMjVxkfL6Hw==; visid_incap_2742146=kXry+h3LTMOto0B4C075bxKtwGYAAAAAQUIPAAAAAACw9E++EkrinLHuX2NpVjpO"}
    
    When user sets endpoint with base api https://sandbox.safaricom.co.ke
    
    And user sets headers {"Content-Type":"application/x-www-form-urlencoded"}
    
    And user sets body {"method":"GET","service_url": "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials"}
    
    And user sends a POST Request with query /oauth/v1/generate?grant_type=client_credentials
    
    Then user successfully generates token

Initiate a Lipa na M-Pesa Online Payment

    Given user sets endpoint with base api https://sandbox.safaricom.co.ke
    
    And user sets headers {"Authorization": "Bearer gTgB8ZdpzA6kIuGtLjw1UPBjhQoS","Content-Type": "application/json"}
    
    And user sets body ${LIPA_NA_MPESA}
    
    And user sends a POST Request with query /mpesa/stkpush/v1/processrequest
    
    Then user recieves valid HTTP response code 200
    
    Then user confirms Success. Request accepted for processing is present in response

# TestData.py
# Credentials for Basic Authentication (Username and Password)
# Consumer Key
USERNAME = "tfKslEMHfAz4LyUsHWuVTdJb4dQLBPl2CdAwuz1hcFNX29aa"    
# Consumer Secret
PASSWORD = "eenyvddHG877IxZIfUCr3cswPqAMtySzEG5IcGvXxzXsvawvQgRBX4gWhU35cvA5"

# Daraja API endpoint for generating OAuth token
OAUTH_URL = "https://sandbox.safaricom.co.ke/oauth/v1/generate?grant_type=client_credentials"
BASE_URL = "https://sandbox.safaricom.co.ke"
API_QUERY = "/oauth/v1/generate?grant_type=client_credentials"

# Authentication Headers with Basic Authorization
HEADERS1 = {"Content-Type":"application/x-www-form-urlencoded"}
HEADERS2 = {
    "Authorization": "Basic dGZLc2xFTUhmQXo0THlVc0hXdVZUZEpiNGRRTEJQbDJDZEF3dXoxaGNGTlgyOWFhOmVlbnl2ZGRIRzg3N0l4WklmVUNyM2Nzd1BxQU10eVN6RUc1SWNHdlh4elhzdmF3dlFnUkJYNGdXaFUzNWN2QTU=",
    "Cookie": "incap_ses_1023_2742146=S16sEgVDOjmmZW22QG0yDvu982YAAAAAcP39hSnLB/08x6HELhxMuw==; visid_incap_2742146=kXry+h3LTMOto0B4C075bxKtwGYAAAAAQUIPAAAAAACw9E++EkrinLHuX2NpVjpO"
}

LIPA_NA_MPESA = {
    "BusinessShortCode": 174379,
    "Password": "MTc0Mzc5YmZiMjc5ZjlhYTliZGJjZjE1OGU5N2RkNzFhNDY3Y2QyZTBjODkzMDU5YjEwZjc4ZTZiNzJhZGExZWQyYzkxOTIwMjQwOTA2MTMzMTI5",
    "Timestamp": "20240906133129",
    "TransactionType": "CustomerPayBillOnline",
    "Amount": 1,
    "PartyA": 254799179374,
    "PartyB": 174379,
    "PhoneNumber": 254799179374,
    "CallBackURL": "https://mydomain.com/path",
    "AccountReference": "CompanyXLTD",
    "TransactionDesc": "Payment of X"
}

# keywords.robot
*** Settings ***

Documentation  DARAJA API AUTOMATION TESTS

Resource    Common.robot

Variables  ../Resources/TestData/TestData.py

*** Keywords ***

user sets GET endpoint with base api

    Common.session creation $API_BASE_ENDPOINT

user sends GET HTTP Request

    Common.send get request

user recieves valid HTTP response code ${res_code}

    Common.confirm response code ${res_code}

user confirms if object present in body ${verify_object}

    Common.object present in body ${verify_object}

user confirms ${isInResponse} is present in response

    Common.confirm is present in response ${isInResponse}

user successfully generates token

    Common.grab token

user sets endpoint with base api ${BASE_API}

    Common.session creation ${BASE_API}

user sends POST Request

    Common.POST a Request with query ${QUERY}

user sets basic auth Username ${USERNAME} and Password ${PASSWORD}

    Common.set Auth ${USERNAME} ${PASSWORD}

user sets CLIENTID ${CLIENTID} and CLIENTSECRET ${CLIENTSECRET}

    Common.set Auth ${CLIENTID} ${CLIENTSECRET}

user sends a POST Request with query ${QUERY}

    Common.POST a Request with query ${QUERY}

user sends a PUT Request with query ${QUERY}

    Common.PUT a Request with query ${QUERY}

user generates token with query ${QUERY}

    Common.generate token ${QUERY}

user sends GET HTTP Request with query ${QUERY}

    Common.GET Request with query ${QUERY}

user enters body ${arg}

    log to console  ${arg}

user sets headers ${headers}

    Common.add headers ${headers}

user adds Oauthscope ${OauthScope} and grant type ${grant_type}

    Common.set Scope ${OauthScope} and grant type ${grant_type}

user adds cookies ${cookies}

    Common.add cookies ${cookies}

user Adds Token

    Common.add Token

user sets body ${body}

    Common.add json body ${body}

user sets form-urlencoded body ${body}

    Common.add form-urlencoded body ${body}

user sets FORMDATA body ${body}

    Common.add formdata body ${body}

user sets image body ${image}

    Common.set image ${image}

user sets testdata file ${json_file}

    Common.set data file ${json_file}

# Common.robot
*** Settings ***

Library    RequestsLibrary

Library    JSONLibrary

Library    Collections

Library    OperatingSystem

Library    ../Library/JsonExtender.py

Library    ../Library/stringToDict.py

Library    ../Library/cert.py

Library    urllib3

Library    String

Library    DateTime

Variables  ../Resources/TestData/TestData.py

*** Variables ***

${BASE_URL}    https://sandbox.safaricom.co.ke

${BEARER_TOKEN}

${headers}

${body}

${files}

${auth}

${cookies}

${proxy}

${OauthScope}

${conversation_id}

${CLIENTID}

${CLIENTSECRET}

${grant_type}

${PATH}=    ${CURDIR}\\TestData

${API_QUERY}    /oauth/v1/generate?grant_type=client_credentials

${API_PARAM}

*** Keywords ***
# set auth variable for basic auth with username and password
set Auth ${USERNAME} ${PASSWORD}

    Set test Variable   ${USERNAME}   ${USERNAME}
    
    Set test Variable   ${PASSWORD}   ${PASSWORD}
    
    ${auth}=  Create list  ${USERNAME}  ${PASSWORD}
    
    Set test Variable   ${auth}   ${auth}

session creation ${API_BASE_ENDPOINT}

    Create Session  mysession  ${API_BASE_ENDPOINT}   verify=False  auth=${auth}  debug=0  cookies=${cookies}

set Scope ${OauthScope} and grant type ${grant_type}

    Set test Variable   ${OauthScope}   ${OauthScope}
    
    Set test Variable   ${grant_type}   ${grant_type}
    
    ${body}=    Create Dictionary  client_id=${CLIENTID}    client_secret=${CLIENTSECRET}    scope=${OauthScope}  Token_Name=cognito-awsUat  grant_type=${grant_type}
    
    Set test Variable   ${body}   ${body}

grab token

    Should Be Equal As Strings    ${response.status_code}    200
    
    Log To Console    Status Code: 200. OAuth Token successfully generated.
    
    ${response}=   Convert To String    ${response.json()}
    
    Log to console    ${response}
    
    ${token}=    Get From Dictionary    ${response}   access_token
    
    Set Suite Variable    ${BEARER_TOKEN}   ${token}
    
    Log    Token ${BEARER_TOKEN}
    
    Set Suite Variable    ${headers}=    {"Authorization": "Bearer ${BEARER_TOKEN}", "Content-Type": "application/json"}
    
    [Return]   ${headers}

POST a Request with query ${QUERY}

    ${response}=  Post Request    mysession  ${QUERY}  data=${body}  headers=${headers}
    
    Log to console   ${response.status_code}
    
    Log    ${response.content}
    
    Should Be Equal As Strings    ${response.status_code}    200



