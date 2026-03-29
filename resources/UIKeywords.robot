*** Settings ***
Documentation    This is the UI keywords for common functionality
Library    SeleniumLibrary


*** Keywords ***
Open the url
    [Arguments]     ${url}
    Go to    ${url}