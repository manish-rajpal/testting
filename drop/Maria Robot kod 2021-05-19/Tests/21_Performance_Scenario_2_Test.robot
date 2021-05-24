*** Settings ***
Documentation           This is a test of a Pet Clinic with Robot Framework /Performance Test 2
Resource                ../Resources/21_Performance_Scenario_2_Keywords.robot
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST
Test Teardown           END WEB TEST

*** Variables ***
${BROWSER}              chrome
${URL}                  http://localhost:4200

${PERFORMANCE_PET_TYPE}       tiger

*** Test Cases ***
User can access website and add a new pet owner
    [Documentation]             This is a performance test to create one new pet type and remove one pet type
    [Tags]                      Performance_Test_2
    GIVEN Web page is open at start page
    WHEN the user can find and click PET TYPES menu
    AND can see a list with all pet types
    AND can add a new pet type          ${PERFORMANCE_PET_TYPE}
    AND can remove pet excisting type
    THEN can go to the start page