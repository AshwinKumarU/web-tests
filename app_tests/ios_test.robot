# Appium Inspector settings : 
# {
#   "platformName": "iOS",
#   "appium:platformVersion": "16.2",
#   "appium:deviceName": "iPhone 14 Pro",
#   "appium:automationName": "XCUITest",
#   "appium:app": "/Users/paponsupamongkonchai/ProjectRobot/AppFile/AppQuizIOS.app",
#   "appium:newCommandTimeout": "60000",
#   "appium:launchTimeout": "48000",
#   "appium:noReset": "false"
# }

{
  "platformName": "Android",
  "appium:automationName": "UiAutomator2"
}


*** Settings ***
Documentation  Simple example using AppiumLibrary
Library  AppiumLibrary
Library  AppiumLibrary
Library    Collections
Library    CSVLibrary
Suite Setup    Login

*** Variables ***
${IOS_AUTOMATION_NAME}    xcuitest
${ANDROID_APP}    ${CURDIR}/app-qa-debug.apk
${IOS_PLATFORM_NAME}    ios
${ANDROID_PLATFORM_VERSION}    %{ANDROID_PLATFORM_VERSION=17.5}
${REMOTE_URL}    http://127.0.0.1:4723
${APP_PACKAGE}    com.amura.amurahealthmobile.qa
${APP_ACTIVITY}    com.amura.amurahealthmobile.MainActivity
${udid}    5A5D0AA2-A158-41E4-BCFC-E1303D2E3C95
${app}    /Users/rajarshiprattipati/Library/Developer/Xcode/DerivedData/AmuraHealthMobile-arobltwlmylvbpdwbvqdzgazeyov/Build/Products/Debug-iphonesimulator/AmuraHealthMobile.app
${get_started}    //XCUIElementTypeStaticText[@name="Hi Ashwin kumara, Click here to get started!"]
${my_list}    (//XCUIElementTypeOther[@name="sample 011 user Limitless Pawan Kalyan:test 22/04/2024 1 7 UT uno test Limitless You: The status has been updated from ACTION REQUIRED to QC READY. 24/04/2024 Data Entry 1 1 user Test update Limitless Raj Kumar 7777777 7777777 77 7777777 77777777777 77777777 777777 7777777 77777:what 17/04/2024 +116d 1 1 4:30 PM event card in mylist CPL3 30m 3h 2m 1 HH AU Assign user 70 DRP1 You: The status has been updated from ACTION REQUIRED to QC READY. 23/07/2024 Data Entry AU Assign user 78 DRP1 SYSTEM:Thank you Assign user 78 for asking us to get in touch with Akash singh, here are some details: Mobile:+912203301104 . Health Objective:ff . 10/07/2024 Data Entry AU Assign user 82 DRP1 SYSTEM:Manidhar Client 33, L1 - Health Coach is successfully assigned as a new member to the team. 04/07/2024 Data Entry AU Assign user 74 DRP1 SYSTEM:Ashwin kumara Uddandapu, L1 dataentry is successfully assigned as a new member to the team. 04/07/2024 Data Entry AU Assign user 66 DRP1 SYSTEM:Manidhar Client 33, L1 - Health Coach is successfully assigned as a new member to the team. 04/07/2024 Data Entry AU Assign user 62 DRP1 SYSTEM:Manidhar Client 33, L1 - Health Coach is successfully assigned as a new member to the team. 04/07/2024 Data Entry"])[2]/XCUIElementTypeOther[1]

# automation:        xcuitest
# remoteUrl:         http://0.0.0.0:4723/wd/hub
# device:            ios
# deviceVer:         '16.2'
# udid:              63087534-7E7C-4FDC-ABB4-CF2860A4AFD7
# wdaLocalPort:      8100
# app:               /Users/paponsupamongkonchai/ProjectRobot/AppFile/AppQuizIOS.app
# alert:             true
# autoAcceptAlerts:  false
# global_timeout:    60
# retry:             60x
# retry_interval:    1s
*** Test Cases ***
Should Login to the app and get started
    Open Test Application
    Input Phone Number    8861183024
    Submit Phone Number
    Input OTP    1234
    Submit OTP
    

*** Keywords ***
Read csv to list
    [Arguments]    ${filePath}    
    @{list}=    read csv file to list    ${filePath}
    Log    ${list[0]}
    Log    ${list[1]}
    RETURN    ${list}

Open Test Application
    Open Application    ${remoteUrl}
    ...                 automationName=${IOS_AUTOMATION_NAME}
    ...                 platformName=${IOS_PLATFORM_NAME}
    ...                 platformVersion=${ANDROID_PLATFORM_VERSION}
    ...                 deviceName=${udid}
    ...                 udid=${udid}
    ...                 app=${app}
    ...                 autoDismissAlerts=true
    ...                 autoAcceptAlerts=true
    ...                 usePrebuiltWDA=true
    ...                 wdaLocalPort=4723
    ...                 useJSONSource=true
    ...                 simpleIsVisibleCheck=true
    ...                 waitForQuiescence=false
    ...                 newCommandTimeout=80000
    ...                 launchTimeout=80000
    ...                 showIOSLog=true
Input Phone Number
  [Arguments]  ${number}
    Wait Until Page Contains Element  xpath=//XCUIElementTypeTextField[@name="text-input-flat"]
    Input Text  xpath=//XCUIElementTypeTextField[@name="text-input-flat"]    ${number}

Submit Phone Number
  Click Element  xpath=//XCUIElementTypeOther[@name="Next"]

Input OTP
  [Arguments]  ${number}
    Wait Until Page Contains Element  xpath=//XCUIElementTypeOther[@name="Enter the OTP sent to your Mobile Enter the OTP sent to your Mobile"]
    Click Element  xpath=//XCUIElementTypeOther[@name="Enter the OTP sent to your Mobile Enter the OTP sent to your Mobile"]
    Input Text  xpath=//XCUIElementTypeTextField[@name="text-input-flat"]    ${number}

Submit OTP
    Click Element    xpath=//XCUIElementTypeOther[@name="Verify"]
    
Search Query Should Be Matching
  [Arguments]  ${text}
  Wait Until Page Contains Element  android:id/search_src_text
  Element Text Should Be  android:id/search_src_text  ${text}


Click Get Started
  [Arguments]  ${full_name}
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="Hi ${full_name}, Click here to get started!"]    
    Click Element    xpath=${get_started}
Login
    ${list}=     read csv to list    ${CURDIR}/data.csv
    FOR     ${line_csv}    IN    @{list}
        Open Test Application
        Input Phone Number    ${line_csv}[0]
        Submit Phone Number
        Input OTP    ${line_csv}[1]
        Submit OTP
        Click Get Started    ${line_csv}[2]
        # ${MyListCard1}    //android.view.ViewGroup[@content-desc="JG, HR, SYSTEM: Hope HR, HR L1 is successfully assigned as a new member to the team., 13/04/2024"]
        Wait Until Element Is Visible   xpath=${my_list}
        Element Attribute Should Match    xpath=${my_list}    bounds    *[0,597][1080,1013]*
        
    END
    