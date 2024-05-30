*** Settings ***
Documentation        Semua yang terkait dengan Homepage
Resource             ../Base/appiumBase.robot


*** Keywords ***
Verify Home Screen Appears
    Element Should Be Visible           locator=//android.widget.ImageView[@resource-id="com.example.myapplication:id/imageView"]

Click Sign In Button On Home Screen
    Click Element                       locator=//android.widget.Button[@resource-id="com.example.myapplication:id/login"]

Verify Success SignIn
    Wait Until Element Is Visible        locator=//android.widget.TextView[@resource-id="com.example.myapplication:id/textView"]