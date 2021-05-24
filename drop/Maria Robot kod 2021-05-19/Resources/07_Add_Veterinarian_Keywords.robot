*** Keywords ***
BEGIN WEB TEST
    Open browser                about:blank     ${BROWSER}

GIVEN Web page is open at start page
    Load Page
    Verify Page Loaded
Load Page
    Go to                       ${URL}
Verify Page Loaded
    ${link_text}                Get Title
    Should Be Equal             ${link_text}    SpringPetclinicAngular
    Page Should Contain         Welcome to Petclinic

WHEN the user can find and click VETERINARIANS menu
#Find "VETERINARIANS" in menu and click on it
    wait until page contains            Veterinarians
    Click Element                       xpath:/html/body/app-root/div[1]/nav/div/ul/li[3]/a     #Click on menu-button "VETERINARIANS"

AND can find ALL
    Page Should Contain Element         //*[@routerlink="/vets"]        #Can see "ALL" under VETERINARIANS
    Click Element                       //*[@routerlink="/vets"]        #Can click on "ALL" under VETERINARIANS

AND can see a list with Veterinarians
    Page Should Contain                 Veterinarians
    Page Should Contain Element         //*[@id="vets"]     #A table with a list of veterinarians are visable
    Element Text Should be              //*[@id="vets"]/thead/tr/th[1]      Name        #Column with "Name" for all veterinarians are visable
    Element Text Should be              //*[@id="vets"]/thead/tr/th[2]      Specialties     #Column with "Specialties" for all veterinarians are visable

AND can add veterinarian 1 to the list
#Add Julia Winberg, radiology
    [Arguments]                         ${FIRST_NAME_VETERINARIAN_1}        ${LAST_NAME_VETERINARIAN_1}
    Click Element                       xpath:/html/body/app-root/app-vet-list/div/div/div/button[2]    #Click on button "Add Vet"
    Wait Until Page Contains            New Veterinarian
    Page Should Contain Textfield       id:firstName
    Input Text                          id:firstName        ${FIRST_NAME_VETERINARIAN_1}
    Page Should Contain Textfield       id:lastName
    Input Text                          id:lastName         ${LAST_NAME_VETERINARIAN_1}
    Click Element                       //*[@id="specialties"]
    Click Element                       //*[@id="specialties"]/option[1]    #Choose option 1 radiology
    Click Button                        //*[@id="vet"]/div[5]/div/button[2]     #Click on "Add vet" button to save a new veterinarian

AND can confirm new veterinarian 1 are added
    [Arguments]                         ${COMPLETE_NAME_VETERINARIAN_1}
    Wait Until Page Contains            Veterinarians
    Wait Until Page Contains Element    //*[@id="vets"]/tbody
    Element Should Contain              //*[@id="vets"]/tbody       ${COMPLETE_NAME_VETERINARIAN_1}

AND can add veterinarian 2 to the list
#Add Fredrik Stensson, dentistry
    [Arguments]                         ${FIRST_NAME_VETERINARIAN_2}        ${LAST_NAME_VETERINARIAN_2}
    Click Element                       xpath:/html/body/app-root/app-vet-list/div/div/div/button[2]    #Click on button "Add Vet"
    Wait Until Page Contains            New Veterinarian
    Page Should Contain Textfield       id:firstName
    Input Text                          id:firstName        ${FIRST_NAME_VETERINARIAN_2}
    Page Should Contain Textfield       id:lastName
    Input Text                          id:lastName         ${LAST_NAME_VETERINARIAN_2}
    Click Element                       //*[@id="specialties"]
    Click Element                       //*[@id="specialties"]/option[3]    #Choose option 3 dentistry
    Click Button                        //*[@id="vet"]/div[5]/div/button[2]     #Click on "Add vet" button to save a new veterinarian

THEN can confirm new veterinarian 2 are added
    [Arguments]                         ${COMPLETE_NAME_VETERINARIAN_2}
    Wait Until Page Contains            Veterinarians
    Wait Until Page Contains Element    //*[@id="vets"]/tbody
    Element Should Contain              //*[@id="vets"]/tbody       ${COMPLETE_NAME_VETERINARIAN_2}

END WEB TEST
    Close Browser