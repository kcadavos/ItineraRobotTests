*** Settings ***
Documentation    This is the UI layer for Dashboard Page object
Library    SeleniumLibrary
Library    XML


*** Variables ***
# ${tripcard_locator}    xpath=//div[@data-testid="trip-accordion"]
${tripheader_locator}     xpath=//h5[@data-testid="trip-name"]
@{expected_trip_names}       Paris    Boracay    Reykjavik    Philippines Dec 2026
# @{expected_trip_names}       Paris    Reykjavik    Philippines Dec 2026

*** Keywords ***
Get Trip Names from UI
    # # Wait Until Page Contains    ${tripcard_locator}     100s
    #  Wait Until Element Is Visible    ${tripcard_locator}    20s
    # @{elements1}=       Get WebElements    ${tripcard_locator}
    # Log To Console     ELEMENTS CAPTURED:@{elements1}


    Wait Until Element Is Visible    ${tripheader_locator}    10s
    @{elements2}       Get WebElements    ${tripheader_locator}
    Log To Console     TRIP NAMES: @{elements2}
    Log To Console    EXPECTED: @{expected_trip_names}
    
    FOR    ${el}   IN    @{elements2}
    ${trip_name}    Get Text    ${el}
    Should Be True    '${trip_name}' in @{expected_trip_names}    Trip ${trip_name} was not expected
    Log To Console    Trip: ${trip_name}
    # Should Contain    @{expected_trip_names}     ${trip_name}
    END

    # FOR    ${ex}    IN    @{expected_trip_names}
    #     Log To Console   EX ITERATION:${ex}
        
    # END