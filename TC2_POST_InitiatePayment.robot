*** Settings ***
Metadata    Author    Enock Odhiambo Omondi
Metadata    Version    1.0.0
Documentation  DARAJA API AUTOMATION TESTS
Resource    ../Resources/keywords.robot
Variables  ../Resources/TestData/Testdata.py

*** Test Cases ***
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
    And user sets headers {"Authorization": "Bearer f2PGJV17LReBs8RKmCNQBzcQRAVC","Content-Type": "application/json"}
    And user sets body ${LIPA_NA_MPESA}
    And user sends a POST Request with query /mpesa/stkpush/v1/processrequest
    Then user recieves valid HTTP response code 200
    Then user confirms Success. Request accepted for processing is present in response