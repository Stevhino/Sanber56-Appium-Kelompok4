*** Settings ***
Documentation        Semua yang terkait dengan SignIn Page
Resource             ../Base/appiumBase.robot


*** Keywords ***
Input Username on SignIn Page
    [Arguments]                      ${username}
    Wait Until Element Is Visible    locator=//android.widget.EditText[@resource-id="com.example.myapplication:id/username"]
    Input Text                       locator=//android.widget.EditText[@resource-id="com.example.myapplication:id/username"]         text=${username}

Input Password on SignIn Page
    [Arguments]                      ${password}
    Wait Until Element Is Visible    locator=//android.widget.EditText[@resource-id="com.example.myapplication:id/password"]
    Input Text                       locator=//android.widget.EditText[@resource-id="com.example.myapplication:id/password"]         text=${password}

Click SignIn Button
    Click Element                    locator=//android.widget.Button[@resource-id="com.example.myapplication:id/signIn"]