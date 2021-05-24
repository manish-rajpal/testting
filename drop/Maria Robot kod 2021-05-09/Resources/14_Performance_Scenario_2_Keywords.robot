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

AND can add a new pet type
    [Arguments]                         ${PERFORMANCE_PET_TYPE}
    Click Button                        xpath:/html/body/app-root/app-pettype-list/div/div/div/button[2]        #Click on button "Add" to be able to add a new pet type
#A new table is now appeared under all pet types
    Page Should Contain                 New Pet Type
    Page Should Contain Element         xpath:/html/body/app-root/app-pettype-list/div/div/div[1]/app-pettype-add/div/div/h2        #"New Pet Type" as a table-name is visable
    Page Should Contain Textfield       id:name
    Input Text                          id:name         ${PERFORMANCE_PET_TYPE}
    Click Button                        //*[@id="pettype"]/div[2]/div/button         #Click on button to save new pet type

AND can remove pet excisting type
#Delete excisting pet type bird
    Page Should Contain Element         //*[@id="4"]        #Id 4 is row 5 (starts with 0)
    Click Button                        //*[@id="pettypes"]/tbody/tr[5]/td[2]/button[2]     #Click on button "Delete"

THEN can go to the start page
    Click Button                        xpath:/html/body/app-root/app-pettype-list/div/div/div/button[1]        #Click on "Home" button to go to the start page
    Page Should Contain                 Welcome to Petclinic

END WEB TEST
    Close Browser
