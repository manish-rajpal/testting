*** Settings ***
Documentation           This is a test of a Pet Clinic with Robot Framework / Change Pet
Resource                ../Resources/04_Change_Pet_Keywords.robot
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST
Test Teardown           END WEB TEST

*** Variables ***
${BROWSER}              chrome
${URL}                  http://localhost:4200

${NEW_PET_NAME_OWNER_3}     Charlie
${NEW_BIRTH_DATE_PET_OWNER_3}       2021/01/30



*** Test Cases ***
Edit Owner
    [Documentation]         Users can change information about pet for Kent Maccoy
    [Tags]                  Change_Pet_Test
    GIVEN Web page is open at start page
    WHEN the user can find and click OWNER menu
    AND find ALL
    AND see all menu for Owners
    AND can edit Pet for Owner 3        ${NEW_PET_NAME_OWNER_3}     ${NEW_BIRTH_DATE_PET_OWNER_3}
    AND can verify a modifications of a pet for owner 3 is saved