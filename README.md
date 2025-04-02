API Integration: Data Transfer Between Salesforce Orgs Using Named Credentials & External Credentials

This guide outlines the steps to integrate data transfer between two Salesforce orgs using Named Credentials and External Credentials with OAuth 2.0 authentication.
Overview

We will set up API integration between two Salesforce organizations:
Org 1: Acts as the data provider by exposing an API through a Connected App with OAuth 2.0 authentication.
Org 2: Consumes the API by configuring Named Credentials and External Credentials, then making API calls via Apex and Lightning Web Component (LWC).

Steps to Configure API Integration:

Org 1: Setting Up the Connected App
1. Navigate to Setup.
2. In the Quick Find box, search for App Manager.
3. Click New Connected App.
4. Provide basic details like App Name, API Name, and Contact Email.
5. Enable OAuth Settings and configure the following:
    Check Enable Client Credentials Flow.
    Add OAuth scopes as needed (e.g., Full Access or specific permissions required).
    Copy the Consumer Key and Consumer Secret after saving.
6. Click Save and ensure that the app is activated.
ScreenShot 1:
![image](https://github.com/user-attachments/assets/ba31534b-1234-420c-8fc1-8fd0f6f437f8)

ScreenShot 2: click the below Button and get keys and id
![image](https://github.com/user-attachments/assets/f82dfacd-62ee-4524-96ea-e866e133e111)


Org 2: Configuring Named Credentials & External Credentials
1. Navigate to Setup.
2. In the Quick Find box, search for Named Credentials.
3. Click External Credentials → New.
4. Fill in the details:
    1. Label & Name: Example - EC_Org1
    2. Authentication Protocol: OAuth 2.0
    3. Authentication Flow Type: Client Credentials with Client Secret Flow
    4. Identity Provider URL: https://your-domain-url/services/oauth2/token
    5. Pass client credentials in request body: Checked
5. Create a Principal:
    1. Parameter Name: EC_Principal
    2. Sequence Number: 1
    3. Client ID: Paste the Consumer Key from Org 1
    4. Client Secret: Paste the Consumer Secret from Org 1
    5. Click Save
6. Create a Named Credential and link it to the External Credential.
7. Go to profile or permission set give that external pricpal access.
Screenshot 1: External Credentials
![image](https://github.com/user-attachments/assets/02273e26-079f-4ceb-8fa2-dcf5ba2d36b0)

Screenshot 2: Named Credentials
![image](https://github.com/user-attachments/assets/2842e7c6-d5b8-4f7c-aa7d-4b8366dbf709)


Org 2: Implementing API Calls in Apex
Create an Apex class to make API requests using the Named Credential.

Org 2: Implementing LWC to Call the Apex Class
Create an LWC component to call the Apex method and display the data.


Conclusion:
    By following this guide, you can securely integrate data transfer between Salesforce orgs using Named Credentials and External Credentials with OAuth 2.0 authentication. This approach ensures authentication is handled efficiently while keeping credentials secure.

Additional Enhancements:
Implement error handling and logging in Apex.
Enhance LWC UI with better formatting and error messages.
Secure API endpoints in Org 1 with additional access control.
