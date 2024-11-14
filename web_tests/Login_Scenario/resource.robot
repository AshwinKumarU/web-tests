*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         
${BROWSER}        chrome
${DELAY}          0
${VALID USER}     8148725764
${password}    1234
${LOGIN URL}      https://dbx92nph6l84n.cloudfront.net/login
${WELCOME URL}    https://dbx92nph6l84n.cloudfront.net/home
${ERROR URL}      http://${SERVER}/error.html
${Mobile number}    :r0:
${OTP}    :r1:

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Amura PMS

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    id:${Mobile number}    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    id:${OTP}    ${password}

Submit Credentials
    Click Button    Verify

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Amura PMS
