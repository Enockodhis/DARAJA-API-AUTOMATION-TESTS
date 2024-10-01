*** Settings ***
Metadata    Author    Enock Odhiambo Omondi
Metadata    Version    1.0.0
Documentation  DARAJA API AUTOMATION TESTS
Library    RequestsLibrary
Library    Collections
Library    BuiltIn

*** Variables ***
${BASE_URL}           https://sandbox.safaricom.co.ke
${RELATIVE_URL}       /oauth/v1/generate?grant_type=client_credentials

# Credentials (Username and Password for Basic Authentication)
${USERNAME}           tfKslEMHfAz4LyUsHWuVTdJb4dQLBPl2CdAwuz1hcFNX29aa
${PASSWORD}           eenyvddHG877IxZIfUCr3cswPqAMtySzEG5IcGvXxzXsvawvQgRBX4gWhU35cvA5

*** Test Cases ***
Generate an OAuth Access Token
    [Documentation]    Generate OAuth token with proper authentication and SSL handling
    [Tags]    Regression Tests

    # Concatenate the username and password in the format username:password
    ${credentials}=    Catenate    SEPARATOR=:    ${USERNAME}    ${PASSWORD}

    # Encode the credentials using Python's base64 library
    ${encoded_credentials}=    Evaluate    base64.b64encode('${credentials}'.encode()).decode()    modules=base64

    # Set the Authorization header using the encoded credentials
    ${auth_header}=    Set Variable    Basic ${encoded_credentials}

    # Create Headers
    ${headers}=        Create Dictionary    Authorization=${auth_header}    Content-Type=application/json

    # Create Session with SSL verification disabled (Not recommended for production)
    Create Session    mysession    ${BASE_URL}    headers=${headers}    verify=False

    # Send GET Request
    ${response}=       Get Request    mysession    ${RELATIVE_URL}

    # Log Response for Debugging
    Log To Console     Status Code: ${response.status_code}
    Log To Console     Response Body: ${response.content}

    # Validate Response Status Code
    Should Be Equal As Integers    ${response.status_code}    200

    # Validate Response Content
    ${res_body}=      Convert To String    ${response.content}
    Should Contain    ${res_body}          3599
