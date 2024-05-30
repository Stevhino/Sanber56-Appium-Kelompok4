*** Settings ***
Documentation        Segala hal yg berkaitan dengan Booking
Resource             ../../Base/appiumBase.robot
Resource             ../HomePagePO.robot
Variables            book-page-locators.yaml

*** Keywords ***
Verify Default One Way Booking Details
    Wait Until Element Is Visible                locator=${ONE_WAY_TAB}    timeout=10s
    Click Element                                locator=${ONE_WAY_TAB}
    Element Should Be Visible                    locator=${ONE_WAY_TAB}
    Element Should Be Visible                    locator=${NEW_YORK_TEXT}
    Element Should Be Visible                    locator=${LONDON_TEXT}
    Element Should Be Visible                    locator=${ECONOMY_TEXT}

Verify Default Round Trip Booking Details
    Wait Until Element Is Visible                locator=${ROUND_TRIP_TAB}    timeout=10s
    Click Element                                locator=${ROUND_TRIP_TAB}  
    Element Should Be Visible                    locator=${ROUND_TRIP_TAB}
    Element Should Be Visible                    locator=${NEW_YORK_TEXT}
    Element Should Be Visible                    locator=${LONDON_TEXT}
    Element Should Be Visible                    locator=${ECONOMY_TEXT}

Select Other From City
    [Arguments]    ${option}
    Click Element                                locator=${SPINNER_FROM}
    Wait Until Element Is Visible                locator=//android.widget.TextView[@resource-id="android:id/text1" and @text="New York"]
    Click Element                                locator=//android.widget.TextView[@resource-id="android:id/text1" and @text="${option}"]

Select Other To City
    [Arguments]    ${option}
    Click Element                                locator=${SPINNER_TO}
    Wait Until Element Is Visible                locator=//android.widget.TextView[@resource-id="android:id/text1" and @text="London"]        
    Click Element                                locator=//android.widget.TextView[@resource-id="android:id/text1" and @text="${option}"]

Select Other Flight Class
    [Arguments]    ${option}
    Click Element                                locator=${SPINNER_CLASS}
    Wait Until Element Is Visible                locator=//android.widget.TextView[@resource-id="android:id/text1" and @text="Economy"]
    Click Element                                locator=//android.widget.TextView[@resource-id="android:id/text1" and @text="${option}"]
Select Start Date
    [Arguments]    ${day}    ${month}    ${year}
    Click Element                                locator=${START_DATE_FIELD}
    Wait Until Element Is Visible                locator=${MONTH_VIEW}
    Click Element                                locator=//android.view.View[@content-desc="${day} ${month} ${year}"]
    Click Element                                locator=${CONFIRM_BUTTON}

Select End Date
    [Arguments]    ${day}    ${month}    ${year}
    Click Element                                locator=${END_DATE_FIELD}
    Wait Until Element Is Visible                locator=${MONTH_VIEW}
    Click Element                                locator=//android.view.View[@content-desc="${day} ${month} ${year}"]
    Click Element                                locator=${CONFIRM_BUTTON}

Select Options
    [Arguments]    ${option}
    Click Element                                locator=//android.widget.RadioButton[@text="${option}"]

Click Book Button
    Click Element                                locator=${BOOK_BUTTON}
 
Verify Success Booked
    Wait Until Element Is Visible                locator=${SUCCESS_BOOKED}    timeout=10s
    Element Should Be Visible                    locator=${SUCCESS_BOOKED}

Select Price
    Click Element                                locator=${PRICE_BUTTON}

Click Confirm Price
    Click Element                                locator=${CONFIRM_ORDER_BUTTON}

Verify Success Booked And Choose Price
    Wait Until Element Is Visible                locator=${CONTENT_VIEW_GROUP}
    Click Element                                locator=${CONTENT_VIEW_GROUP}