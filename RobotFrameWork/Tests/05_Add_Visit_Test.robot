*** Settings ***
Documentation           This is a test of a Pet Clinic with Robot Framework /Add Visit
Resource                ../Resources/Ghrekin/05_Add_Visit_Kyewords.robot
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST
Test Teardown           END WEB TEST

*** Variables ***
${BROWSER}              chrome
${URL}                  http://localhost:4200

${VISIT_DATE_PET_1_OWNER_1}             2021/06/03
${DESCRIPTION_VISIT_PET_1_OWNER_1}      problems with teeth

${VISIT_DATE_PET_2_OWNER_1}             2021/06/03
${DESCRIPTION_VISIT_PET_2_OWNER_1}      problems with stomack

${VISIT_DATE_PET_OWNER_2}               2021/05/15
${DESCRIPTION_VISIT_PET_1_OWNER_2}      need to do X-ray on rear legs



*** Test Cases ***
User can access website and add a new pet owner
    [Documentation]             This is a test to book visit for pets at veterinarian
    [Tags]                      Add_Visit_Test
    GIVEN Web page is open at start page
    WHEN the user can find and click OWNER menu
    AND find ALL
    AND see all menu for Owners
    AND can find and edit owner 1 in the list
    AND can add a visit for Owners 1 pet 1        ${VISIT_DATE_PET_1_OWNER_1}       ${DESCRIPTION_VISIT_PET_1_OWNER_1}
    AND can see a new booked visit for Owners 1 pet 1

    AND can add a visit for Owners 1 pet 2          ${VISIT_DATE_PET_2_OWNER_1}       ${DESCRIPTION_VISIT_PET_2_OWNER_1}
    AND can see a new booked visit for Owners 1 pet 2
    AND can go back to list with all owners

    AND can find and edit owner 2 in the list
    AND can add a visit for Owners 2 pet            ${VISIT_DATE_PET_OWNER_2}           ${DESCRIPTION_VISIT_PET_1_OWNER_2}
    AND can see a new booked visit for Owners 2 pet
    THEN we can find owner 2 in the list



