*** Settings ***
Documentation           This is a test of a Pet Clinic with Robot Framework /Cange and remove specialties
Resource                ../Resources/14_Change_Remove_Specialties_Keywords.robot
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST
Test Teardown           END WEB TEST

*** Variables ***
${BROWSER}              chrome
${URL}                  http://localhost:4200

${NEW_SPECIALTY_2}       neurology

*** Test Cases ***
User can access website and add a new pet owner
    [Documentation]             This is a test to see if we can change and remove specialties
    [Tags]                      Change_and_Remove_Specialties_Test
    GIVEN Web page is open at start page
    WHEN the user can find and click SPECIALTIES menu
    AND can see a list with specialties types
    AND can change a specialty           ${NEW_SPECIALTY_2}
    AND can remove a specialty
    THEN can go to the start page