*** Settings ***
Documentation           This is a test of a Pet Clinic with Robot Framework /Remove Visit
Resource                ../Resources/Ghrekin/06_Edit_Remove_Visit_Keywords.robot
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST
Test Teardown           END WEB TEST

*** Variables ***
${BROWSER}              chrome
${URL}                  http://localhost:4200

${NEW_DESCRIPTION_VISIT_PET_2_OWNER_1}      URGENT problems with stomack

*** Test Cases ***
User can access website and add a new pet owner
    [Documentation]             This is a test to edit and remove booked visit for pets at veterinarian
    [Tags]                      Edit_Remove_Visit_Test
    GIVEN Web page is open at start page
    WHEN the user can find and click OWNER menu
    AND find ALL
    AND see all menu for Owners
    AND can find and edit owner 1 in the list
    AND can remove a visit for Owners 1 pet 1

    AND can update a visit for Owners 1 pet 2       ${NEW_DESCRIPTION_VISIT_PET_2_OWNER_1}
    AND we can see new information saved

    THEN we can find owner 1 in the list