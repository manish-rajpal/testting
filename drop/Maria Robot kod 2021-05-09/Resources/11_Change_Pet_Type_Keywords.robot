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

WHEN the user can find and click PET TYPES menu
#Find "PET TYPES" in menu and click on it
    wait until page contains            Pet Types
    Click Element                       xpath:/html/body/app-root/div[1]/nav/div/ul/li[4]/a/span[2]     #Click on menu-button "PET TYPES"

AND can see a list with all pet types
    Page Should Contain                 Pet Types
    Page Should Contain Element         //*[@id="pettypes"]     #A table with a list of vall pet types are visable
    Element Text Should be              //*[@id="pettypes"]/thead/tr/th[1]      Name        #Column with "Name" for all pet types are visable

AND can change pet type 2
    [Arguments]                         ${NEW_PET_TYPE_2}
    Click Button                        //*[@id="pettypes"]/tbody/tr[8]/td[2]/button[1]        #Click on "Edit" button for fish with id-number 8
    Page Should Contain                 Edit Pet Type
    Page Should Contain Element         xpath:/html/body/app-root/app-pettype-edit/div/div
#A new table is now appeared to be able to edit the pet type
    Clear Element Text                  id:name       #Remove current Pet type
    Input Text                          id:name         ${NEW_PET_TYPE_2}
    Click Button                        //*[@id="pettype"]/div[2]/div/button[1]         #Click on button "Update" to save changed pet type

THEN can go to the start page
    Click Button                        xpath:/html/body/app-root/app-pettype-list/div/div/div/button[1]        #Click on "Home" button to go to the start page
    Page Should Contain                 Welcome to Petclinic

END WEB TEST
    Close Browser
