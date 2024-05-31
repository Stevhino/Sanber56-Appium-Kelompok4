*** Settings ***
Resource            ../PageObjects/HomePagePO.robot
Resource            ../PageObjects/SignInPO.robot
Resource            ../PageObjects/SearchPage/searchPage.robot
Test Setup          Open Flight App
Test Teardown       Close Flight App


*** Variables ***
${VALID_USERNAME}            support@ngendigital.com
${VALID_PASSWORD}            abc123
${VALID_FLIGHT_NUMBER}       DA935
${INVALID_FLIGHT_NUMBER}     BA935
${VERIFY_FLIGHT_NUMBER}      DA 935

*** Test Cases ***

Search Flight Without Login
    Click Search Button on Home Screen
    Page Should Not Contain Element    locator=${search_input}

Search Flight With Invalid Flight Number
    Sign in With Valid Credential              ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Success SignIn
    Click Search Button
    Input Flight Number                        ${INVALID_FLIGHT_NUMBER}
    Click Search Button on Search Page
    # Verify Error Message Flight Number
   

Search Flight With Valid Flight Number
    Sign in With Valid Credential              ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Success SignIn
    Click Search Button
    Input Flight Number                        ${VALID_FLIGHT_NUMBER}
    Click Search Button on Search Page
    Verify Success Search Flight Number        ${VERIFY_FLIGHT_NUMBER}