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

# user sends POST Request
#     Common.send post request
    
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
