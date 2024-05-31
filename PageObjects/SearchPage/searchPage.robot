*** Settings ***
Documentation        Segala hal yg berkaitan dengan Booking
Resource             ../../Base/appiumBase.robot
Resource             ../HomePagePO.robot
Variables            search-page-locators.yaml

*** Keywords ***
Click Search Button
    Click Element           locator=${search_locator}

Input Flight Number
    [Arguments]                        ${flight_number}
    Wait Until Element Is Visible      locator=${search_input}
    Input Text                         locator=${search_input}    text=${flight_number}

Click Search Button on Search Page
    Click Element          locator=${search_button}

Verify Success Search Flight Number
    [Arguments]            ${flight_number}
    Wait Until Element Is Visible        locator=${search_verify_number}
    Element Should Contain Text          locator=${search_verify_number}    expected=${flight_number}

Verify Error Message Flight Number
    [Documentation]                      error 'Interactions are not avaible for this element in appium'
    Wait Until Element Is Visible        locator=${search_invalid_msg}     timeout=5s
    Text Should Be Visible               text=Please enter valid Flight Number
    
