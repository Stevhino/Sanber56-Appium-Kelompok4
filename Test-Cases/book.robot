*** Settings ***
Resource            ../PageObjects/HomePagePO.robot
Resource            ../PageObjects/SignInPO.robot
Resource            ../PageObjects/BookPage/bookPage.robot
Test Setup          Open Flight App
Test Teardown       Close Flight App

*** Variables ***
${VALID_USERNAME}            support@ngendigital.com
${VALID_PASSWORD}            abc123
${TORONTO}                   Toronto
${OTTAWA}                    Ottawa
${FIRST}                     First
${START_DAY}                 01
${START_MONTH}               August
${START_YEAR}                2019
${END_DAY}                   02
${END_MONTH}                 August
${END_YEAR}                  2019
${TRIP_TYPE}                 Flight + Hotel

*** Test Cases ***
# Berhasil jika terisi semua di one-way
User should be able to book a one-way flight after successful login
    Sign in With Valid Credential              ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Success SignIn
    Click Book Button On Home Screen
    Verify Default One Way Booking Details
    Select Start Date                        ${START_DAY}    ${START_MONTH}    ${START_YEAR}
    Select End Date                          ${END_DAY}    ${END_MONTH}    ${END_YEAR}
    Select Options                           ${TRIP_TYPE}
    Click Book Button
    Verify Success Booked
    Select Price
    Click Confirm Price
    Verify Success Booked And Choose Price

# Berhasil jika terisi semua di Round-trip
User should be able to book a Round Trip flight after successful login
    Sign in With Valid Credential              ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Success SignIn
    Click Book Button On Home Screen
    Verify Default Round Trip Booking Details
    Select Start Date                          03    August    2019
    Select End Date                            15    August    2019
    Select Options                             Flight
    Click Book Button
    Verify Success Booked
    Select Price
    Click Confirm Price
    Verify Success Booked And Choose Price

#Berhasil jika terisi semua di One-way dan merubah kota asal ke toronto
User should be able to book a one-way flight after successful login and choose other from city to toronto
    Sign in With Valid Credential              ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Success SignIn
    Click Book Button On Home Screen
    Verify Default One Way Booking Details
    Select Other From City                   ${TORONTO} 
    Select Start Date                        ${START_DAY}    ${START_MONTH}    ${START_YEAR}
    Select End Date                          ${END_DAY}    ${END_MONTH}    ${END_YEAR}
    Select Options                           ${TRIP_TYPE}
    Click Book Button
    Verify Success Booked
    Select Price
    Click Confirm Price
    Verify Success Booked And Choose Price

#Berhasil jika terisi semua di One-way dan merubah kota tujuan ke ottawa
User should be able to book a one-way flight after successful login and choose other to city to ottawa
    Sign in With Valid Credential              ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Success SignIn
    Click Book Button On Home Screen
    Verify Default One Way Booking Details
    Select Other To City                     ${OTTAWA}
    Select Start Date                        ${START_DAY}    ${START_MONTH}    ${START_YEAR}
    Select End Date                          ${END_DAY}    ${END_MONTH}    ${END_YEAR}
    Select Options                           ${TRIP_TYPE}
    Click Book Button
    Verify Success Booked
    Select Price
    Click Confirm Price
    Verify Success Booked And Choose Price

#Berhasil jika terisi semua di One-way dan merubah tipe kelas ke first class
User should be able to book a one-way flight after successful login and choose other class to first class
    Sign in With Valid Credential             ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Success SignIn
    Click Book Button On Home Screen
    Verify Default One Way Booking Details
    Select Other Flight Class                ${FIRST}
    Select Start Date                        ${START_DAY}    ${START_MONTH}    ${START_YEAR}
    Select End Date                          ${END_DAY}    ${END_MONTH}    ${END_YEAR}
    Select Options                           ${TRIP_TYPE}
    Click Book Button
    Verify Success Booked
    Select Price
    Click Confirm Price
    Verify Success Booked And Choose Price

# Gagal jika tanggal awal tidak diisi harusnya
User Should Fail Booking If Start Date Field Is Missing
    Sign in With Valid Credential              ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Success SignIn
    Click Book Button On Home Screen
    Verify Default One Way Booking Details
    Select End Date                          ${END_DAY}    ${END_MONTH}    ${END_YEAR}
    Select Options                           ${TRIP_TYPE}
    Click Book Button
    Verify Success Booked
    Select Price
    Click Confirm Price
    Verify Success Booked And Choose Price

# Gagal jika tanggal akhir tidak diisi harusnya
User Should Fail Booking If End Date Field Is Missing
    Sign in With Valid Credential              ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Success SignIn
    Click Book Button On Home Screen
    Verify Default One Way Booking Details
    Select Start Date                        ${START_DAY}    ${START_MONTH}    ${START_YEAR}
    Select Options                           ${TRIP_TYPE}
    Click Book Button
    Verify Success Booked
    Select Price
    Click Confirm Price
    Verify Success Booked And Choose Price

# Gagal jika tipe trip nya tidak diisi harusnya
User Should Fail Booking If Trip Type Field Is Missing
    Sign in With Valid Credential              ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Success SignIn
    Click Book Button On Home Screen
    Verify Default One Way Booking Details
    Select Start Date                        ${START_DAY}    ${START_MONTH}    ${START_YEAR}
    Select End Date                          ${END_DAY}    ${END_MONTH}    ${END_YEAR}
    Click Book Button
    Verify Success Booked
    Select Price
    Click Confirm Price
    Verify Success Booked And Choose Price

# Gagal jika aemua field tidak diisi harusnya
User Should Fail Booking If Any Field Is Missing
    Sign in With Valid Credential              ${VALID_USERNAME}    ${VALID_PASSWORD}
    Verify Success SignIn
    Click Book Button On Home Screen
    Verify Default One Way Booking Details
    Click Book Button
    Verify Success Booked
    Select Price
    Click Confirm Price
    Verify Success Booked And Choose Price

    