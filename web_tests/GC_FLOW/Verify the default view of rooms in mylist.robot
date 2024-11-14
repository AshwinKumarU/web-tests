*** Settings ***
Documentation     Verify the default card view of user cards
Suite Setup    Login
Resource          resource.robot
Resource     MyListCard.robot
Resource    ../utils.robot
*** Test Cases ***
# ML_001_0001 Verify the default card view of the user cards
#     Wait Until Element Is Visible    Xpath:${MyListCard1} 
#     ${style}=    Get CSS Property Value    Xpath:${MyListCard1}    height
#     Should Be Equal    ${style}    126px


# ML_001_0003 Verify the contents displayed in the collapsed view of the card
#     Wait Until Element Is Visible    Xpath:${MyListCard1}
#     Wait Until Element Is Visible    Xpath:${MyList_Name}
#     Wait Until Element Is Visible    Xpath:${MyList_Profile}
#     Wait Until Element Is Visible    Xpath:${MyList_TenantIcon}
#     Wait Until Element Is Visible    Xpath:${MyList_Offering_Name}
#     Wait Until Element Is Visible    Xpath:${GC_Status_Icon}
#     Wait Until Element Is Visible    Xpath:${Assign_Task}
#     Wait Until Element Is Visible    Xpath:${Green_Dot}
#     Wait Until Element Is Visible    Xpath:${Red_Dot}

# ML_001_0004 Verify the loader behaviour when the rooms / cards are being fetched
#     Set Selenium Speed    0
#     Click Element    Xpath:${Refresh_Button}
#     Wait Until Element Is Visible    Xpath:${Skeleton_Loader}
#     Set Selenium Speed    0.2




# ML_002_0001 Verify the icon state when the user is on the expanded view
#     Wait Until Element Is Visible    Xpath:${Expand_Button} 
#     Click Element     Xpath:${Expand_Button}
#     ${style2}=    Get CSS Property Value    Xpath:${MyListCard1}    height
#     Should Be Equal    ${style2}    170px
#     # Wait Until Element Is Visible    Xpath:/html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[1]/div[2]/div[1]
#     # Welcome Page Should Be Open
    
# ML_002_0003 Verify the contents displayed in expanded view of the card
#     Wait Until Element Is Visible    Xpath:${MyListCard1}
#     Wait Until Element Is Visible    Xpath:${MyList_Name}
#     Wait Until Element Is Visible    Xpath:${MyList_Profile}
#     Wait Until Element Is Visible    Xpath:${MyList_TenantIcon}
#     Wait Until Element Is Visible    Xpath:${MyList_Offering_Name}
#     Wait Until Element Is Visible    Xpath:${GC_Status_Icon_Expanded}
#     Wait Until Element Is Visible    Xpath:${Assign_Task}
#     Wait Until Element Is Visible    Xpath:${Green_Dot}
#     Wait Until Element Is Visible    Xpath:${Red_Dot}
#     Wait Until Element Is Visible    Xpath:${Last_Message_Body}
#     Wait Until Element Is Visible    Xpath:${Last_Message_Time}




# ML_003_0001 Verify the user is able to see the hand pointer icon when he howers on the quick filters
#     Mouse Over    Xpath:${Quick_Filters}
#     ${style}=    Get CSS Property Value    Xpath:${Blue_Filter}    cursor
#     Should Be Equal    ${style}    pointer
#     Click Element     Xpath:${Blue_Filter}

# ML_003_0003 Verify the UI of the selected quick filter
#     ${style}=    Get CSS Property Value    Xpath:${Red_Filter_Disabled}    opacity
#     Should Be Equal    ${style}    0.3
#     ${style}=    Get CSS Property Value    Xpath:${Green_Filter_Disabled}    opacity
#     Should Be Equal    ${style}    0.3

# ML_003_0002 Verify the functionality of the clear icon beside quick filters
#     Element Should Be Enabled    Xpath:${Clear_Button} 
#     Click Element     Xpath:${Clear_Button}
#     Element Should Be Disabled    Xpath:${Clear_Button} 

# ML_003_004 Verify the cards shown when the user clicks on the blue dot filter  #TODO @Ashwin
#     ${style}=    Get CSS Property Value    Xpath:${My_List_Container}[0]${BlueDotSubPath}    opacity
#     Should Be Equal    ${style}    1
#     ${style}=    Get CSS Property Value    Xpath:${My_List_Container}[0]/div[1]${BlueDotSubPath}    opacity
#     Should Be Equal    ${style}    1

# ML_003_005 Verify the cards shown when the user clicks on the green dot filter  
#     Click Element     Xpath:${Green_Filter}
#     Wait Until Element Is Visible    Xpath:${My_List_Container}${GreenDotSubPath}
#     ${style3}=    Get CSS Property Value    Xpath:${My_List_Container}${GreenDotSubPath}    opacity
#     Should Be Equal    ${style3}    1
#     ${style}=    Get CSS Property Value    Xpath:${My_List_Container}\[2\]${GreenDotSubPath}    opacity
#     Should Be Equal    ${style}    1


#     [Teardown]    Close Browser

    
# /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div/div[2]/div/div/div/div[2]/div[2]/div[2]/div[2]
# /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[2]/div[2]/div[2]/div[2]
# /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div/div
#/html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div/div

ML_003_006 Check the status icon is present for guidance councellor role only  
    set selenium Speed    2
    Wait Until Element Is Visible    Xpath:${MyListCard1}
    Click Element    Xpath:${MyListCard1}
    Wait Until Element Is Visible    Xpath:${MyTeamCardRole}
    ${MyLoggedInRole}=    Get Text    Xpath:${MyTeamCardRole}
    Log    the title of the component i: ${MyLoggedInRole}
    IF    '${MyLoggedInRole}' =='${Guidance Counselor Level 1}'
        Element Should Be Visible    Xpath:${GCStatus}
        Log To Console    icon is present for role: Guidance Counselor Level 1
    ELSE
        Element Should Not Be Visible    Xpath:${GCStatus}
        Log To Console    Icon is not present for role: ${MyLoggedInRole}
    END    
    
    [Teardown]    Close Browser


ML_002_TC_001 Verify that the user is able to see the blue dot on the client card if there is any task assigned for that client card.     
    set selenium Speed    2 
    Wait Until Element Is Visible    Xpath:${MyListCard1}
    Click Element    Xpath:${MyListCard1}
    Wait Until Element Is Visible    Xpath${ChatInputBox}
    Click Element    Xpath${ChatInputBox}
    
ML_001_0005	Veirfy the offering name displayinig on the mylist client card
    Wait Until Element Is Visible    Xpath:${MyListCard1}
    
