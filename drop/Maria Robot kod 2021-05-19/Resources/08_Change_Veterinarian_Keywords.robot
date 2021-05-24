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

AND can change veterinarian 1 in the list
#Change Julia Winberg, radiology to Julia Winblad
    [Arguments]                         ${NEW_LAST_NAME_VETERINARIAN_1}
    Click Element                       //*[@id="vets"]/tbody/tr[7]/td[3]/button[1]     #Click on button #Edit Vet" number 7 in the list
    Wait Until Page Contains            Edit Veterinarian
    Clear Element Text                  id:lastName       #Remove current Last name
    Input Text                          id:lastName       ${NEW_LAST_NAME_VETERINARIAN_1}
    Click Button                        //*[@id="vet_form"]/div[5]/div/button[2]    #Click on "Save Vet" button to save changes for veterinarian
#We are back to the list with all veterinarians

THEN can confirm veterinarian 1 are changed
#We are on the list with all veterinarians
    [Arguments]                         ${COMPLETE_NEW_NAME_VETERINARIAN_1}
    Wait Until Page Contains            Veterinarians
    Wait Until Page Contains Element    //*[@id="vets"]/tbody
    Element Should Contain              //*[@id="vets"]/tbody       ${COMPLETE_NEW_NAME_VETERINARIAN_1}

END WEB TEST
    Close Browser
