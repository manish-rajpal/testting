*** Settings ***
Documentation           This is a test of a Pet Clinic with Robot Framework /Create new specialties
Resource                ../Resources/13_Create_Specialties_Keywords.robot
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST
Test Teardown           END WEB TEST

*** Variables ***
${BROWSER}              chrome
${URL}                  http://localhost:4200

${SPECIALTY_1}       cardiology
${SPECIALTY_2}       dermatology
${SPECIALTY_3}       ophthalmology

*** Test Cases ***
User can access website and add a new pet owner
    [Documentation]             This is a test to see if we can add new specialties
    [Tags]                      Add_New_Specialties_Test
    GIVEN Web page is open at start page
    WHEN the user can find and click SPECIALTIES menu
    AND can see a list with specialties types
    AND can add a new specialty 1           ${SPECIALTY_1}
    AND can add a new specialty 2           ${SPECIALTY_2}
    AND can add a new specialty 3           ${SPECIALTY_3}
    THEN can go to the start page