*** Settings ***
Documentation           This is a test of a Pet Clinic with Robot Framework /Add new Veterinarian
Resource                ../Resources/07_Add_Veterinarian_Keywords.robot
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST
Test Teardown           END WEB TEST

*** Variables ***
${BROWSER}              chrome
${URL}                  http://localhost:4200

${FIRST_NAME_VETERINARIAN_1}        Julia
${LAST_NAME_VETERINARIAN_1}         Winberg
${COMPLETE_NAME_VETERINARIAN_1}     Julia Winberg

${FIRST_NAME_VETERINARIAN_2}        Fredrik
${LAST_NAME_VETERINARIAN_2}         Stensson
${COMPLETE_NAME_VETERINARIAN_2}     Fredrik Stensson

*** Test Cases ***
User can access website and add a new pet owner
    [Documentation]             This is a test to see if we can add new veterinarians
    [Tags]                      Add_Veterinarians_Test
    GIVEN Web page is open at start page
    WHEN the user can find and click VETERINARIANS menu
    AND can find ALL
    AND can see a list with Veterinarians
    AND can add veterinarian 1 to the list       ${FIRST_NAME_VETERINARIAN_1}        ${LAST_NAME_VETERINARIAN_1}
    AND can confirm new veterinarian 1 are added     ${COMPLETE_NAME_VETERINARIAN_1}
    AND can add veterinarian 2 to the list      ${FIRST_NAME_VETERINARIAN_2}        ${LAST_NAME_VETERINARIAN_2}
    THEN can confirm new veterinarian 2 are added       ${COMPLETE_NAME_VETERINARIAN_2}



