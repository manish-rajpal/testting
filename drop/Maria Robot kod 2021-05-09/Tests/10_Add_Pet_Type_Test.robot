*** Settings ***
Documentation           This is a test of a Pet Clinic with Robot Framework /Add new pet types
Resource                ../Resources/10_Add_Pet_Type_Keywords.robot
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST
Test Teardown           END WEB TEST

*** Variables ***
${BROWSER}              chrome
${URL}                  http://localhost:4200

${PET_TYPE_1}       wolf
${PET_TYPE_2}       fish
${PET_TYPE_3}       fox

*** Test Cases ***
User can access website and add a new pet owner
    [Documentation]             This is a test to see if we can add new pet types
    [Tags]                      Add_New_Pet_Types_Test
    GIVEN Web page is open at start page
    WHEN the user can find and click PET TYPES menu
    AND can see a list with all pet types
    AND can add a new pet type 1                ${PET_TYPE_1}
    AND can add a new pet type 2                ${PET_TYPE_2}
    AND can add a new pet type 3                ${PET_TYPE_3}
    THEN can go to the start page


