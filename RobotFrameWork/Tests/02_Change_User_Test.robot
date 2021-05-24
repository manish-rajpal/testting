*** Settings ***
Documentation           This is a test of a Pet Clinic with Robot Framework / Change Owner
Resource                ../Resources/Ghrekin/02_Change_User_Keywords.robot
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST
Test Teardown           END WEB TEST

*** Variables ***
${BROWSER}              chrome
${URL}                  http://localhost:4200

${NEW_LAST_NAME_OWNER_2}    Andersson



*** Test Cases ***
Edit Owner
    [Documentation]         Users can change information about owner
    [Tags]                  Change_Owner_Test
    GIVEN Web page is open at start page
    WHEN the user can find and click OWNER menu
    AND find ALL
    AND see all menu for Owners
    AND can edit Owner 2        ${NEW_LAST_NAME_OWNER_2}
    AND can verify a modifications for owner 2 is saved