#RUNNING TESTS   robot --outputdir ./Results .\Tests\TC1_GET_AccessToken.robot 

# Credentials for Basic Authentication ((Username and Password)
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

LIPA_NA_MPESA =  {
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



