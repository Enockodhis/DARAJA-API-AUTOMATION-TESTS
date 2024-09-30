# DARAJA-API-AUTOMATION-TESTS
This project automates the testing of Safaricom's Daraja API using Robot Framework and RequestsLibrary. It covers generating OAuth access tokens and initiating Lipa na M-Pesa Online Payment requests.

## Technologies Used
- Robot Framework
- RequestsLibrary
- JSONLibrary
- Python (for custom keywords)
- Daraja API (Safaricom)

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/your-username/daraja-api-automation.git
   ```

2. Install Robot Framework and dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Ensure you have valid credentials for the Daraja API (Consumer Key, Consumer Secret).

4. Update the `TestData.py` file in the `Resources/TestData` folder with your credentials and required data.

5. Run the tests:
   ```bash
   robot --outputdir ./Results ./Tests/TC1_GET_AccessToken.robot
   ```

## 5. Project Structure
This is an overview of the file structure:

```markdown

|-- Resources
|   |-- keywords.robot   # Custom keywords for API interaction
|   |-- TestData
|       |-- TestData.py  # Test data including credentials and API endpoints
|-- Tests
|   |-- TC1_GET_AccessToken.robot  # Test case for OAuth token generation
|   |-- TC2_LipaNaMpesa.robot      # Test case for Lipa na M-Pesa
|-- Library
|   |-- Common.robot     # Common functionality for requests and responses
|-- README.md            # Project documentation

## Test Cases

### 1. Generate an OAuth Access Token Successfully
**Description**: This test case initiates an OAuth request to generate an access token for Safaricom's APIs.
         Given user sets basic auth Username and Password
         And user sends a POST request to the OAuth URL
         Then user successfully generates an access token

### 2.  Initiate a Lipa na M-Pesa Online Payment
        Given user sets headers with Authorization token
        And user sends a POST request to the Lipa na M-Pesa endpoint
        Then user receives HTTP response code 200

## Running Tests
To run the tests, use the following command:
robot --outputdir ./Results ./Tests/TC1_GET_AccessToken.robot

## Known Issues
- OAuth token expiration issues: Make sure the token is fresh before running the tests.
- API rate limits: Be mindful of the API rate limits when running multiple tests.

## License
This project is licensed under the MIT License.









