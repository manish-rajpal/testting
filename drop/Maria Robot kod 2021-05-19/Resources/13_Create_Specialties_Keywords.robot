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

WHEN the user can find and click SPECIALTIES menu
#Find "SPECIALTIES" in menu and click on it
    wait until page contains            Specialties
    Click Element                       xpath:/html/body/app-root/div[1]/nav/div/ul/li[5]/a/span[2]     #Click on menu-button "SPECIALTIES"

AND can see a list with specialties types
    Page Should Contain                 Specialties
    Page Should Contain Element         //*[@id="specialties"]      #A table with a list of all specialties are visable
    Element Text Should be              //*[@id="specialties"]/thead/tr/th[1]   Name        #Column with "Name" for all specialties are visable

AND can add a new specialty 1
    [Arguments]                         ${SPECIALTY_1}
    Click Button                        xpath:/html/body/app-root/app-specialty-list/div/div/div/button[2]      #Click on button "Add" to be able to add a new specialty type
#A new table is now appeared under Specialties types
    Page Should Contain                 New Specialty
    Page Should Contain Element         xpath:/html/body/app-root/app-specialty-list/div/div/div[1]/app-specialty-add/div/div/h2        #"New Specialty" as a table-name is visable
    Page Should Contain Textfield       id:name
    Input Text                          id:name         ${SPECIALTY_1}
    Click Button                        //*[@id="specialty"]/div[2]/div/button          #Click on button to save new specialty type

AND can add a new specialty 2
    [Arguments]                         ${SPECIALTY_2}
    Click Button                        xpath:/html/body/app-root/app-specialty-list/div/div/div/button[2]      #Click on button "Add" to be able to add a new specialty type
#A table is still appeared under Specialties types
    Page Should Contain                 New Specialty
    Page Should Contain Element         xpath:/html/body/app-root/app-specialty-list/div/div/div[1]/app-specialty-add/div/div/h2        #"New Specialty" as a table-name is visable
    Page Should Contain Textfield       id:name
    Input Text                          id:name         ${SPECIALTY_2}
    Click Button                        //*[@id="specialty"]/div[2]/div/button          #Click on button to save new specialty type

AND can add a new specialty 3
    [Arguments]                         ${SPECIALTY_3}
    Click Button                        xpath:/html/body/app-root/app-specialty-list/div/div/div/button[2]      #Click on button "Add" to be able to add a new specialty type
#A table is still appeared under Specialties types
    Page Should Contain                 New Specialty
    Page Should Contain Element         xpath:/html/body/app-root/app-specialty-list/div/div/div[1]/app-specialty-add/div/div/h2        #"New Specialty" as a table-name is visable
    Page Should Contain Textfield       id:name
    Input Text                          id:name         ${SPECIALTY_3}
    Click Button                        //*[@id="specialty"]/div[2]/div/button          #Click on button to save new specialty type

THEN can go to the start page
    Click Button                        xpath:/html/body/app-root/app-specialty-list/div/div/div/button[1]     #Click on "Home" button to go to the start page
    Page Should Contain                 Welcome to Petclinic

END WEB TEST
    Close Browser
