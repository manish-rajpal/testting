*** Settings ***
Documentation        UI testing in PetClinic by Robot Framework
...                  this is to test funcitionalities of Owners -- Eli
Resource             ../Resources/Keywords_Own.robot
Library              SeleniumLibrary
Test Setup          Generate Tests
Test Teardown       Close Active Browser

*** Variables ***
${BROWSER}      chrome
${URL}          http://localhost:4200



*** Test Cases ***
Add Specialist
    [Documentation]     Add specialist
    [Tags]              Add specialist
    Go To Web
    Click Specalist
    Update Specalist
    Add Specalist
    Delete Specalist