*** Settings ***
Documentation           This is a test of a Pet Clinic with Robot Framework /Critical flow test
Resource                ../Resources/30_Critical_Flow_Keywords.robot
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST
Test Teardown           END WEB TEST

*** Variables ***
${BROWSER}              chrome
${URL}                  http://localhost:4200

${CF_FIRST_NAME_OWNER}   Linda
${CF_LAST_NAME_OWNER}    Björklund
${CF_ADDRESS_OWNER}      Medelgatan 3
${CF_CITY_OWNER}         12345 Stockholm
${CF_TELEPHONE_OWNER}    0701010101

${CF_PET_NAME_OWNER}     Morris
${CF_BIRTH_DATE_PET_OWNER}       2019/05/25

${CF_VISIT_DATE_PET_1_OWNER}             2021/06/21
${CF_DESCRIPTION_VISIT_PET_1_OWNER}      has problems with fur



*** Test Cases ***
User can access website and add a new pet owner
    [Documentation]             This is a test for critical flow: add user, add pet, add visit
    [Tags]                      Critical_flow_Test
    GIVEN Web page is open at start page
    WHEN the user can find and click OWNER menu
    AND find ALL
    AND see all menu for Owners
    AND can click on "Add Owner" CF
    AND can add a new Owner CF    ${CF_FIRST_NAME_OWNER}       ${CF_LAST_NAME_OWNER}     ${CF_ADDRESS_OWNER}      ${CF_CITY_OWNER}    ${CF_TELEPHONE_OWNER}
    AND can verify a new owner CF is saved
    AND can add Pet 1 CF            ${CF_PET_NAME_OWNER}     ${CF_BIRTH_DATE_PET_OWNER}
    AND can add a visit for Owner CF pet        ${CF_VISIT_DATE_PET_1_OWNER}       ${CF_DESCRIPTION_VISIT_PET_1_OWNER}
    AND can see a new booked visit for Owner CF pet
    AND can verify a new owner CF with pet is saved