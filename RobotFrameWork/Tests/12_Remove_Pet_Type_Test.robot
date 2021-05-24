*** Settings ***
Documentation           This is a test of a Pet Clinic with Robot Framework /Remove pet types
Resource                ../Resources/Ghrekin/12_Remove_Pet_Type_Keywords.robot
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST
Test Teardown           END WEB TEST

*** Variables ***
${BROWSER}              chrome
${URL}                  http://localhost:4200

*** Test Cases ***
User can access website and add a new pet owner
    [Documentation]             This is a test to see if we can remove pet types
    [Tags]                      Remove_Pet_Types_Test
    GIVEN Web page is open at start page
    WHEN the user can find and click PET TYPES menu
    AND can see a list with all pet types
    AND can remove pet excisting type