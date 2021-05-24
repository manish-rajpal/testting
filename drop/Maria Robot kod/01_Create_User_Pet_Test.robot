*** Settings ***
Documentation           This is a test of a Pet Clinic with Robot Framework /Add new Owner and Pet
Resource                ../Resource/01_Create_User_Pet_Keywords.robot
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST
Test Teardown           END WEB TEST

*** Variables ***
${BROWSER}              chrome
${URL}                  http://localhost:4200

${FIRST_NAME_OWNER_1}   Thomas
${LAST_NAME_OWNER_1}    Johansson
${ADDRESS_OWNER_1}      Funstreet 1
${CITY_OWNER_1}         12345 Stockholm
${TELEPHONE_OWNER_1}    0701020304
${PET_NAME_OWNER_1}     Molly
${BIRTH_DATE_PET_OWNER_1}       2018/05/01

${FIRST_NAME_OWNER_2}   Sara
${LAST_NAME_OWNER_2}    Svensson
${ADDRESS_OWNER_2}      Greenstreet 15
${CITY_OWNER_2}         54321 Uppsala
${TELEPHONE_OWNER_2}    0709080706
${PET_NAME_OWNER_2}     Buddy
${BIRTH_DATE_PET_OWNER_2}       2019/10/15

${FIRST_NAME_OWNER_3}   Kent
${LAST_NAME_OWNER_3}    Maccoy
${ADDRESS_OWNER_3}      Downstreet 31
${CITY_OWNER_3}         98765 Kungsbacka
${TELEPHONE_OWNER_3}    0706050403
${PET_NAME_OWNER_3}     Rocky
${BIRTH_DATE_PET_OWNER_3}       2020/06/25

*** Test Cases ***
User can access website and add a new pet owner
    [Documentation]             This is a test to see if a user can add a new owner
    [Tags]                      Add_Owner_And_Pet_Test
    GIVEN Web page is open at start page
    WHEN the user can find and click OWNER menu
    AND find ALL
    AND see all menu for Owners
    AND can click on "Add Owner" 1
    AND can add a new Owner 1    ${FIRST_NAME_OWNER_1}       ${LAST_NAME_OWNER_1}     ${ADDRESS_OWNER_1}      ${CITY_OWNER_1}    ${TELEPHONE_OWNER_1}
    AND can verify a new owner 1 is saved
    AND Add Pet 1 Value            ${PET_NAME_OWNER_1}     ${BIRTH_DATE_PET_OWNER_1}
    AND can verify a pet for owner 1 is saved
    AND can click on "Add Owner" 2
    AND can add a new Owner 2    ${FIRST_NAME_OWNER_2}       ${LAST_NAME_OWNER_2}     ${ADDRESS_OWNER_2}      ${CITY_OWNER_2}    ${TELEPHONE_OWNER_2}
    AND can verify a new owner 2 is saved
    AND Add Pet 2 Value            ${PET_NAME_OWNER_2}     ${BIRTH_DATE_PET_OWNER_2}
    AND can verify a pet for owner 2 is saved
    AND can click on "Add Owner" 3
    AND can add a new Owner 3    ${FIRST_NAME_OWNER_3}       ${LAST_NAME_OWNER_3}     ${ADDRESS_OWNER_3}      ${CITY_OWNER_3}    ${TELEPHONE_OWNER_3}
    AND can verify a new owner 3 is saved
    AND Add Pet 3 Value            ${PET_NAME_OWNER_3}     ${BIRTH_DATE_PET_OWNER_3}
    THEN can verify a pet for owner 3 is saved