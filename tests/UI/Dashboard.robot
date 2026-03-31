*** Settings ***
Documentation    This is for testing the dashboard data based on user logged in
Resource    ../../variables/common_vars.robot
Resource    ../../variables/users.robot
# Resource     ../../resources/UICommon.robot
Resource    ../../resources/UI/UILogin.robot
Resource    ../../resources/UI/dashboardkeywords.robot

Test Setup    Open Browser     about: blank    ${browser}    options=add_argument("--window-size=1920,1080")
Test Teardown     Close Browser

*** Test Cases ***
Check Expected Trips are displayed in the dashboard
     dashboardkeywords.Check Listed Trips in dashboard    ${User2}