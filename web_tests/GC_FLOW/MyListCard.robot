*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${MyListCard1}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div[1]/div/div/div/div[1]/div[2]
${Expand_Button}    //div[@class='css-9psh4f-headerContainer bgColorWhite']//div[2]
${MyList_Name}    /html/body/div[1]/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[1]/div[2]/div[1]/div[1]
${MyList_Profile}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[1]/div[1]/div/div/div
${MyList_TenantIcon}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[1]/div[1]/div/div/i
${MyList_Offering_Name}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[1]/div[2]/div[1]/div[2]
${GC_Status_Icon}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[1]/div[2]/div[2]/div/div[3]/div/span
${Assign_Task}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[2]/div[2]/div[2]/div[1]
${Green_Dot}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[2]/div[2]/div[2]/div[2]
${Red_Dot}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[2]/div[2]/div[2]/div[3]
${Skeleton_Loader}    /html/body/div[1]/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/span[1]
${Refresh_Button}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div[1]/div[3]
${GC_Status_Icon_Expanded}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[3]/div/span
${Last_Message_Body}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[1]/div[2]/div[2]/div/div[1]
${Last_Message_Time}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[1]/div[2]/div[2]/div/div[2]
${Quick_Filters}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div[3]/div[2]/div
${Clear_Button}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div[3]/div[2]/div/button
${Blue_Filter}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div[3]/div[2]/div/div[1]/div
${Red_Filter}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div[3]/div[2]/div/div[3]/div/div
${Red_Filter_Disabled}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div[3]/div[2]/div/div[3]
${Room_name}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div/div[1]/div/div/div/div[1]/div[2]/div[1]
${Green_Filter_Disabled}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div[3]/div[2]/div/div[2]
${My_List_Container}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div/div
${BlueDotSubPath}        /div/div/div/div[2]/div[2]/div[2]/div[1]/div
${GreenDotSubPath}    /div/div/div/div[2]/div[2]/div[2]/div[2]
${Green_Filter}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[1]/div[3]/div[2]/div/div[2]
${MyTeamCardRole}    /html/body/div/div[2]/section/div[1]/div/div/div[2]/div[2]/div/div/div/div/div/div/div[2]/div/div[2]/div
${Guidance Counselor Level 1}    Guidance Counselor Level 1
${GCStatus}    /html/body/div/div[2]/section/div[2]/div[1]/div[2]/div/div[2]/div/div/div[2]/div/div[2]/div/div/div[1]/div/div/div/div[1]/div[2]/div[2]/div/div/span
${ChatInputBox}    /html/body/div/div[2]/section/div[2]/div[2]/div[1]/div[4]/div[2]/div/div[3]/div[2]/div/div[1]/span
*** Keywords ***
