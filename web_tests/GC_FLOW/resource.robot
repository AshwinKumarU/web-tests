*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}
${BROWSER}    chrome
${DELAY}    0.2
${VALID USER}    1110001117
${password}    1234
${LOGIN URL}      https://dbx92nph6l84n.cloudfront.net/login
${WELCOME URL}    https://dbx92nph6l84n.cloudfront.net/home
${ERROR URL}      http://${SERVER}/error.html
${Mobile number}    :r0:
${OTP}    :r1:
${My_List}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]

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


Login
    Open Browser To Login Page
    Wait Until Element Is Visible    id:${Mobile number} 
    Input Text    id:${Mobile number}  ${VALID USER}
    Click Button    Xpath:/html/body/div/div[2]/div[2]/div/div[1]/div/div/div[2]/div/button
    Wait Until Element Is Visible    id:${OTP} 
    Input Text    id:${OTP}    ${password}
    Submit Credentials
    Wait Until Element Is Visible    Xpath:${My_List} 
