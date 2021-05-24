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

AND can delete a veterinarian
    [Arguments]                         ${VETERINARIAN_TO_BE_DELETED}
    Click Button                        xpath=//td[contains(text(), "${VETERINARIAN_TO_BE_DELETED}")]/parent::tr/td[3]/button[2]        #/parent::tr  look for parent element
    Wait Until Page Contains Element    //*[@id="vets"]/tbody

THEN can see a veterinarian is deleted
    [Arguments]                         ${VETERINARIAN_TO_BE_DELETED}
    Element Should Not Contain          //*[@id="vets"]/tbody           ${VETERINARIAN_TO_BE_DELETED}

END WEB TEST
    Close Browser