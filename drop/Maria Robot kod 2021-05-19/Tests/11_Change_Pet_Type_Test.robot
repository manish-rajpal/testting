*** Settings ***
Documentation           This is a test of a Pet Clinic with Robot Framework /Change pet types
Resource                ../Resources/11_Change_Pet_Type_Keywords.robot
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST
Test Teardown           END WEB TEST

*** Variables ***
${BROWSER}              chrome
${URL}                  http://localhost:4200

${NEW_PET_TYPE_2}       donkey

*** Test Cases ***
User can access website and add a new pet owner
    [Documentation]             This is a test to see if we can change pet types
    [Tags]                      Change_Pet_Types_Test
    GIVEN Web page is open at start page
    WHEN the user can find and click PET TYPES menu
    AND can see a list with all pet types
    AND can change pet type 2                ${NEW_PET_TYPE_2}
    THEN can go to the start page
