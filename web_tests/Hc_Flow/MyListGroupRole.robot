*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
Resource          resource.robot

*** Variables ***


*** Test Cases ***
Valid Login
    Open Browser To Login Page
    ${variable}=    Wait Until Element Is Visible    id:${Mobile number} 
    Input Text    id:${Mobile number}  ${VALID USER}
    Click Button    Xpath:/html/body/div/div[2]/div[2]/div/div[1]/div/div/div[2]/div/button
    Wait Until Element Is Visible    id:${OTP} 
    Input Text    id:${OTP}    ${password}
    Submit Credentials
    # Wait Until Element Is Visible    Xpath:/html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[1]/div[2]/div[1]
    Wait Until Element Is Visible    Xpath:${GroupBy_Role}
    Click Element    Xpath:${GroupBy_Role}
    Click Element    Xpath:${HealthCoach_Group}
    Click Element    Xpath:${Role_HealthCoach}
    Wait Until Element Is Not Visible    Xpath:${GC_Status_Icon}
    # Welcome Page Should Be Open


    

    