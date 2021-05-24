*** Settings ***
Documentation           This is a test of a Pet Clinic with Robot Framework /Add new Owner and Pet
Resource                ../Resource/03_Create_Extra_Pet_Keywords.robot
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST
Test Teardown           END WEB TEST

*** Variables ***
${BROWSER}              chrome
${URL}                  http://localhost:4200

${EXTRA_PET_NAME_OWNER_1}     Lassie
${EXTRA_BIRTH_DATE_PET_OWNER_1}       2018/02/23

*** Test Cases ***
User can access website and add an extra pet to owner 1
    [Documentation]             This is a test to see if a user can add an extra pet
    [Tags]                      Add_Extra_Pet_Test
    GIVEN Web page is open at start page
    WHEN the user can find and click OWNER menu
    AND find ALL
    AND see all menu for Owners
    AND Add Extra Pet to Owner 1        ${EXTRA_PET_NAME_OWNER_1}       ${EXTRA_BIRTH_DATE_PET_OWNER_1}
    AND can verify an extra pet for owner 1 is saved