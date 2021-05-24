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

AND can add a new pet type 1
    [Arguments]                         ${PET_TYPE_1}
    Click Button                        xpath:/html/body/app-root/app-pettype-list/div/div/div/button[2]        #Click on button "Add" to be able to add a new pet type
#A new table is now appeared under all pet types
    Page Should Contain                 New Pet Type
    Page Should Contain Element         xpath:/html/body/app-root/app-pettype-list/div/div/div[1]/app-pettype-add/div/div/h2        #"New Pet Type" as a table-name is visable
    Page Should Contain Textfield       id:name
    Input Text                          id:name         ${PET_TYPE_1}
    Click Button                        //*[@id="pettype"]/div[2]/div/button         #Click on button to save new pet type

AND can add a new pet type 2
    [Arguments]                         ${PET_TYPE_2}
    Click Button                        xpath:/html/body/app-root/app-pettype-list/div/div/div/button[2]        #Click on button "Add" to be able to add a new pet type
#A new table is now appeared under all pet types
    Page Should Contain                 New Pet Type
    Page Should Contain Element         xpath:/html/body/app-root/app-pettype-list/div/div/div[1]/app-pettype-add/div/div/h2        #"New Pet Type" as a table-name is visable
    Page Should Contain Textfield       id:name
    Input Text                          id:name         ${PET_TYPE_2}
    Click Button                        //*[@id="pettype"]/div[2]/div/button         #Click on button to save new pet type

AND can add a new pet type 3
    [Arguments]                         ${PET_TYPE_3}
    Click Button                        xpath:/html/body/app-root/app-pettype-list/div/div/div/button[2]        #Click on button "Add" to be able to add a new pet type
#A new table is now appeared under all pet types
    Page Should Contain                 New Pet Type
    Page Should Contain Element         xpath:/html/body/app-root/app-pettype-list/div/div/div[1]/app-pettype-add/div/div/h2        #"New Pet Type" as a table-name is visable
    Page Should Contain Textfield       id:name
    Input Text                          id:name         ${PET_TYPE_3}
    Click Button                        //*[@id="pettype"]/div[2]/div/button         #Click on button to save new pet type

THEN can go to the start page
    Click Button                        xpath:/html/body/app-root/app-pettype-list/div/div/div/button[1]        #Click on "Home" button to go to the start page
    Page Should Contain                 Welcome to Petclinic

END WEB TEST
    Close Browser


