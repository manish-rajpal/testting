*** Settings ***
Documentation           This is a test of a Pet Clinic with Robot Framework /Change a Veterinarian
Resource                ../Resources/Ghrekin/08_Change_Veterinarian_Keywords.robot
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST
Test Teardown           END WEB TEST

*** Variables ***
${BROWSER}              chrome
${URL}                  http://localhost:4200

${NEW_LAST_NAME_VETERINARIAN_1}         Winblad
${COMPLETE_NEW_NAME_VETERINARIAN_1}     Julia Winblad

*** Test Cases ***
User can access website and add a new pet owner
    [Documentation]             This is a test to see if we can change a lastname for a veterinarian
    [Tags]                      Change_Veterinarian_Test
    GIVEN Web page is open at start page
    WHEN the user can find and click VETERINARIANS menu
    AND can find ALL
    AND can see a list with Veterinarians
    AND can change veterinarian 1 in the list       ${NEW_LAST_NAME_VETERINARIAN_1}
    THEN can confirm veterinarian 1 are changed     ${COMPLETE_NEW_NAME_VETERINARIAN_1}

