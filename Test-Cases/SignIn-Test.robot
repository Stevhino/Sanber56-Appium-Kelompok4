*** Settings ***
Resource            ../PageObjects/HomePagePO.robot
Resource            ../PageObjects/SignInPO.robot
Test Setup          Open Flight App
Test Teardown       Close Flight App


*** Variables ***
${VALID_USERNAME}        support@ngendigital.com
${VALID_PASSWORD}        abc123
${INVALID_USERNAME}      kelompok4@com
${INVALID_USERNAME1}     @com
${INVALID_PASSWORD}      01234
${BLANK_USERNAME}
${BLANK_PASSWORD}
${ALERT_TEXT}            Invalid username/password


*** Test Cases ***
Success SignIn (VALID Username + VALID Password)
    Click Sign In Button On Home Screen
    Input Username on SignIn Page        ${VALID_USERNAME}
    Input Password on SignIn Page        ${VALID_PASSWORD}
    Click SignIn Button
    Verify Success SignIn

Failed SignIn (INVALID Username + VALID Password)
    Click Sign In Button On Home Screen
    Input Username on SignIn Page        ${INVALID_USERNAME}
    Input Password on SignIn Page        ${VALID_PASSWORD}
    Click SignIn Button  
    Wait Until Page Contains             ${ALERT_TEXT}

Failed SignIn (INVALID Username 1 + VALID Password)
    Click Sign In Button On Home Screen
    Input Username on SignIn Page        ${INVALID_USERNAME1}
    Input Password on SignIn Page        ${VALID_PASSWORD}
    Click SignIn Button  
    Wait Until Page Contains             ${ALERT_TEXT}

Failed SignIn (VALID Username + INVALID Password)
    Click Sign In Button On Home Screen
    Input Username on SignIn Page        ${VALID_USERNAME}
    Input Password on SignIn Page        ${INVALID_PASSWORD}
    Click SignIn Button
    Wait Until Page Contains             ${ALERT_TEXT}

Failed SignIn (INVALID Username + INVALID Password)
    Click Sign In Button On Home Screen
    Input Username on SignIn Page        ${INVALID_USERNAME}
    Input Password on SignIn Page        ${INVALID_PASSWORD}
    Click SignIn Button
    Wait Until Page Contains             ${ALERT_TEXT}

Failed SignIn (BLANK Username + VALID Password)
    Click Sign In Button On Home Screen
    Input Username on SignIn Page        ${BLANK_USERNAME}
    Input Password on SignIn Page        ${VALID_PASSWORD}
    Click SignIn Button
    Wait Until Page Contains             ${ALERT_TEXT}

Failed SignIn (VALID Username + BLANK Password)
    Click Sign In Button On Home Screen
    Input Username on SignIn Page        ${VALID_USERNAME}
    Input Password on SignIn Page        ${BLANK_PASSWORD}
    Click SignIn Button
    Wait Until Page Contains             ${ALERT_TEXT}

Failed SignIn (BLANK Username + BLANK Password)
    Click Sign In Button On Home Screen
    Input Username on SignIn Page        ${BLANK_USERNAME}
    Input Password on SignIn Page        ${BLANK_PASSWORD}
    Click SignIn Button
    Wait Until Page Contains             ${ALERT_TEXT} 