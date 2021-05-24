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
User Can Access The Web
    [Documentation]         Web users can access the web
    [Tags]                  access
    Go To Web
    Close Active Browser


*** Test Cases ***
Verify Owner Access and Query For All
    [Documentation]         users can access Owner query and add pets
    [Tags]                  Onwer
    Go To Web
    Click Owner
    All Query
    Close Active Browser

*** Test Cases ***
Add New Owner From All Qurey
    [Documentation]         users can add information
    [Tags]                  adding owner
    Go To Web
    Click Owner
    All Query
    Add Owner Value
    Close Active Browser

*** Test Cases ***
Edit Owner
    [Documentation]         Users can edit their information
    [Tags]                  editing owner
    Go To Web
    Click Owner
    All Query
    Edit Owner Value
    Close Active Browser


*** Test Cases ***
Add New Pet
    [Documentation]        Users can add pets
    [Tags]                 adding pet
    Go To Web
    Click Owner
    All Query
    Add Pet Value
    Close Active Browser

*** Test Cases ***
Edit Pet
    [Documentation]        Users can edit pets
    [Tags]                 editing pet
    Go To Web
    Click Owner
    All Query
    Edit Pet Value
    Close Active Browser

*** Test Cases ***
Delete Pet
   [Documentation]        Delete Pet
   [Tags]                 delete pet
   Go To Web
   Click Owner
   All Query
   Remove Pet Value
   Close Active Browser

*** Test Cases ***
Create Pet Visit
   [Documentation]     Create Pet Visit
   [Tags]              Create Pet Visit
   Go To Web
   Click Owner
   All Query
   Create Pet Visit
   Close Active Browser

*** Test Cases ***
Edit Pet Visit
    [Documentation]      Edit Pet Visit
    [Tags]               Edit Pet Visit
    Go To Web
    Click Owner
    All Query
    Edit Pet Visit
    Close Active Browser

*** Test Cases ***
Delete Pet Visit
    [Documentation]     Delete Pet Visit
    [Tags]              Delete Pet Visit
    Go To Web
    Click Owner
    All Query
    Delete Pet Visit
    Close Active Browser

