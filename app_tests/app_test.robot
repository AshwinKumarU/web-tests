
# Appium Inspector settings : 
# {
#   "platformName": "Android",
#   "appium:automationName": "UiAutomator2"
# }

*** Settings ***
Documentation  Simple example using AppiumLibrary
Library  AppiumLibrary
Library    Collections
Library    CSVLibrary
Library    SeleniumLibrary
Suite Setup    Login

*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_APP}    ${CURDIR}/QA_22_July_2024.apk
${ANDROID_PLATFORM_NAME}    Android
${ANDROID_PLATFORM_VERSION}    %{ANDROID_PLATFORM_VERSION=11}
${REMOTE_URL}    http://127.0.0.1:4723
${APP_PACKAGE}    com.amura.amurahealthmobile.qa
${APP_ACTIVITY}    com.amura.amurahealthmobile.MainActivity
${MyListCard1}    UiSelector().className("android.view.ViewGroup").instance(53)
${MyListCardNameTag}    UiSelector().text("Assign user 82 ")
${waituntil}    
${MyList_Name}        
*** Test Cases ***
ML_001_0001 Verify the default card view of the user cards
    Wait Until Element Is Visible    Xpath:${MyListCard1} 
    ${style}=    Get CSS Property Value    Xpath:${MyListCard1}    height


ML_001_0003 Verify the contents displayed in the collapsed view of the card
    Wait Until Element Is Visible    Xpath:${MyListCard1}
    Wait Until Element Is Visible    Xpath:${MyList_Name}
    Wait Until Element Is Visible    Xpath:${MyList_Profile}
    Wait Until Element Is Visible    Xpath:${MyList_TenantIcon}
    Wait Until Element Is Visible    Xpath:${MyList_Offering_Name}
    Wait Until Element Is Visible    Xpath:${GC_Status_Icon}
    Wait Until Element Is Visible    Xpath:${Assign_Task}
    Wait Until Element Is Visible    Xpath:${Green_Dot}
    Wait Until Element Is Visible    Xpath:${Red_Dot}

ML_001_0004 Verify the loader behaviour when the rooms / cards are being fetched
    Set Selenium Speed    0
    Click Element    Xpath:${Refresh_Button}
    Wait Until Element Is Visible    Xpath:${Skeleton_Loader}
    Set Selenium Speed    0.2

    
ML_001_0005	Veirfy the offering name displayinig on the mylist client card
    Element Attribute Should Match    Xpath:${MyList_Offering_Name}    title    Support

ML_001_005_01 Check the sub offering and offering for the respected role
    Element Attribute Should Match    Xpath:${MyList_Offering_Name}    title    DRP1
    Element Attribute Should Match    Xpath:${SubOffering}    title    Diagnosis

ML_001_0006 Verify the bludot slot is clickable
# 1) Click on a card
# 2) Type @blue in chat
# 3) Click on the text field of blue dot flyout
# 4) Type "Testing blue dots"
# 5) Select the logged in person
# 6) Get the name of the patient
# 7) Click on blue dot in My list cards

    Click Element    Xpath:${MyListCard1}
    Click Element    Xpath:${ChatInputBox}
    Input Text Into Current Element    @blue
    Click Element    Xpath:${ChatBotthonFlyoutBlue}
    Click Element    Xpath:${BlueDotFlyout}
    Input Text Into Current Element    Testing blue dots
    Click text    Jhansi Gc-1 Guidance Counselor Level 1
    Click text    Jhansi Gc-1 Guidance Counselor Level 1
    Click Element    Xpath:{BlueDotFlyoutSendButton}
    Click Element    Xpath:${MylistIcon}
    Click Element    Xpath:${MyListCard1_Bluedot}


ML_005_TC_002	Verify that the user is able to see the task details after clicking the blue dot on the client card.
# 6 . Verify the name of the Created By person
# 7) Verify the name of the Made for person
# 8) Verify the description added in the blue dot"
    Element Text Should Be    Xpath:${CreatedbyText}    Jhansi Gc-1
    Element Text Should Be    Xpath:${MadeForText}    Jhansi Gc-1
    Element Text Should Be    Xpath:${BluedotListCard1Description}    Testing blue dots
    Click Element    Xpath:${BluedotDetailedPageBackButton}

ML_005_TC_003	Close a bluedot
# 1) Click on the card
# 2) Click on chat input box
# 3) Type @close
# 4) Select the added bluedot
# 5) Click on send button
    Click Element    Xpath:${MyListCard1}
    Click Element    Xpath:${ChatInputBox}
    Input Text Into Current Element    @close
    Click Element    Xpath:${BlueDotFirstRadioButton}
    Click Element    Xpath:{CloseFlyoutSendButton}
    Click Element    Xpath:${MylistIcon}
    Page Should Not Contain Element    Xpath:${BluedotCard1}

    



        

*** Keywords ***
Read csv to list
    [Arguments]    ${filePath}    
    @{list}=    read csv file to list    ${filePath}
    Log    ${list[0]}
    Log    ${list[1]}
    RETURN    ${list}
Get CSS Property Value
    [Documentation]
    ...    Get the CSS property value of an Element.
    ...    
    ...    This keyword retrieves the CSS property value of an element. The element
    ...    is retrieved using the locator.
    ...    
    ...    Arguments:
    ...    - locator           (string)    any Selenium Library supported locator xpath/css/id etc.
    ...    - property_name     (string)    the name of the css property for which the value is returned.
    ...    
    ...    Returns             (string)    returns the string value of the given css attribute or fails.
    ...        
    [Arguments]    ${locator}    ${attribute name}
    ${css}=         Get WebElement    ${locator}
    ${prop_val}=    Call Method       ${css}    value_of_css_property    ${attribute name}
    RETURN    ${prop_val}
    
Login
    Set Appium Timeout    20
    Set Sleep Between Wait Loop    1
    ${list}=     read csv to list    ${CURDIR}/data.csv
    FOR     ${line_csv}    IN    @{list}
        Open Test Application
        Input Phone Number    ${line_csv}[0]
        Submit Phone Number
        Input OTP    ${line_csv}[1]
        Submit OTP
        Click Get Started    ${line_csv}[2]
        # ${MyListCard1}    //android.view.ViewGroup[@content-desc="JG, HR, SYSTEM: Hope HR, HR L1 is successfully assigned as a new member to the team., 13/04/2024"]
        Wait Until Element Is Visible   android=${MyListCard1}
        Element Attribute Should Match    android=${MyListCard1}    bounds    *[0,597][1080,1013]*
        
    END 
    
    
Open Test Application
  Open Application  ${REMOTE_URL}  automationName=${ANDROID_AUTOMATION_NAME}
  ...  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  app=${ANDROID_APP}  appPackage=${APP_PACKAGE}  appActivity=${APP_ACTIVITY}    autoGrantPermissions=true    keepAliveTimeout=0

Input Phone Number
  [Arguments]  ${number}
    Wait Until Page Contains Element    xpath=//android.widget.EditText[@resource-id="text-input-flat"]
    Input Text  xpath=//android.widget.EditText[@resource-id="text-input-flat"]    ${number}

Submit Phone Number
    Wait Until Page Contains Element  xpath=//android.view.ViewGroup[@content-desc="Next"]
    Click Element  xpath=//android.view.ViewGroup[@content-desc="Next"]

Input OTP
  [Arguments]  ${number}
    Wait Until Page Contains Element  xpath=//android.widget.EditText[@resource-id="text-input-flat"]
    Click Element  xpath=//android.widget.EditText[@resource-id="text-input-flat"]
    Input Text  xpath=//android.widget.EditText[@resource-id="text-input-flat"]    ${number}

Submit OTP
    Wait Until Page Contains Element  xpath=//android.view.ViewGroup[@content-desc="Verify"]
    Click Element    xpath=//android.view.ViewGroup[@content-desc="Verify"]

Click Get Started
  [Arguments]  ${full_name}
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="Hi ${full_name}, Click here to get started!"]    
    Click Element    xpath=//android.widget.TextView[@text="Hi ${full_name}, Click here to get started!"]    