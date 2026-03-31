*** Settings ***
Resource    ../../variables/common_vars.robot
Resource    ../../resources/UICommon.robot
Resource   ../../pages/Login/Loginpage.robot
Resource     ../../pages/Dashboard/Dashboardpage.robot


*** Keywords ***
Check Listed Trips in dashboard
    [Arguments]    ${user}
    UICommon.Open the url    ${LoginURL}
    Loginpage.LoginOnly    ${user}[username]    ${user}[password]
    Dashboardpage.Get Trip Names from UI
    Dashboardpage.Verify Trip Names Listed Are Expected   