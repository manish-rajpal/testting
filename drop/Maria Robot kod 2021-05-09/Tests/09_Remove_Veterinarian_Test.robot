*** Settings ***
Documentation           This is a test of a Pet Clinic with Robot Framework /Remove a Veterinarian
Resource                ../Resources/09_Remove_Veterinarian_Keywords.robot
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST
Test Teardown           END WEB TEST

*** Variables ***
${BROWSER}              chrome
${URL}                  http://localhost:4200

${VETERINARIAN_TO_BE_DELETED}       Henry Stevens

*** Test Cases ***
User can access website and add a new pet owner
    [Documentation]             This is a test to see if we can remove a veterinarian
    [Tags]                      Remove_Veterinarian_Test
    GIVEN Web page is open at start page
    WHEN the user can find and click VETERINARIANS menu
    AND can find ALL
    AND can see a list with Veterinarians
    AND can delete a veterinarian       ${VETERINARIAN_TO_BE_DELETED}
    THEN can see a veterinarian is deleted      ${VETERINARIAN_TO_BE_DELETED}
