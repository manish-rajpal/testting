*** Settings ***
Documentation           This is a test of a Pet Clinic with Robot Framework /Performance Test 1
Resource                ../Resources/20_Performance_Scenario_1_Keywords.robot
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST
Test Teardown           END WEB TEST

*** Variables ***
${BROWSER}              chrome
${URL}                  http://localhost:4200

${PERFORMANCE_1_FIRST_NAME_OWNER}       Eva
${PERFORMANCE_1_LAST_NAME_OWNER}        Olsson
${PERFORMANCE_1_ADDRESS_OWNER}          Burton Road 112
${PERFORMANCE_1_CITY_OWNER}             96385 Stockholm
${PERFORMANCE_1_TELEPHONE_OWNER}        0707070707

${PERFORMANCE_1_NEW_LAST_NAME_OWNER}    Nilsson

${PERFORMANCE_1_PET_1_NAME}             Twinkie
${PERFORMANCE_1_BIRTH_DATE_PET_1}       2016/03/23

${PERFORMANCE_1_PET_2_NAME}             Toro
${PERFORMANCE_1_BIRTH_DATE_PET_2}       2020/05/01


*** Test Cases ***
User can access website and add a new pet owner
    [Documentation]             This is a performance test to create new user, create 2 pets, remove 1 pet and change last name
    [Tags]                      Performance_Test_1
    GIVEN Web page is open at start page
    WHEN the user can find and click OWNER menu
    AND find ALL
    AND see all menu for Owners
    AND can click on "Add Owner"
    AND can add a new Owner     ${PERFORMANCE_1_FIRST_NAME_OWNER}      ${PERFORMANCE_1_LAST_NAME_OWNER}     ${PERFORMANCE_1_ADDRESS_OWNER}      ${PERFORMANCE_1_CITY_OWNER}     ${PERFORMANCE_1_TELEPHONE_OWNER}
    AND can verify a new owner is saved
    AND Add Pet 1       ${PERFORMANCE_1_PET_1_NAME}     ${PERFORMANCE_1_BIRTH_DATE_PET_1}
    AND Add Pet 2       ${PERFORMANCE_1_PET_2_NAME}     ${PERFORMANCE_1_BIRTH_DATE_PET_2}
    AND can verify 2 pets for owner are saved
    AND can remove pet 2
    AND can change last name        ${PERFORMANCE_1_NEW_LAST_NAME_OWNER}
    THEN can verify modifications for owner

