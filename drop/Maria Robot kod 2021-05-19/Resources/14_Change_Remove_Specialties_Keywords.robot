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

AND can change a specialty
#We change row 5 from dermatology to neurology
    [Arguments]                         ${NEW_SPECIALTY_2}
    Click Button                        xpath://*[@id="specialties"]/tbody/tr[5]/td[2]/button[1]      #Click on button "Edit" for row 5 to be able to change specialty type
#A table is still appeared under Specialties types
    Page Should Contain                 Edit Specialty
    Page Should Contain Element         xpath:/html/body/app-root/app-specialty-edit/div/div        #New table with name "Edit specialty" should be visable
    Page Should Contain Textfield       id:name
    Clear Element Text                  id:name
    Input Text                          id:name         ${NEW_SPECIALTY_2}
    Click Button                        //*[@id="specialty"]/div[2]/div/button[1]     #Click on button to save updated specialty type

AND can remove a specialty
#Remove 6 row ophthalmology
    Page Should Contain                 Specialties
    Page Should Contain Element         //*[@id="specialties"]      #A table with a list of all specialties are visable
    Click Button                        //*[@id="specialties"]/tbody/tr[6]/td[2]/button[2]      #Click on "Delete" button for ophthalmology

THEN can go to the start page
    Click Button                        xpath:/html/body/app-root/app-specialty-list/div/div/div/button[1]     #Click on "Home" button to go to the start page
    Page Should Contain                 Welcome to Petclinic

END WEB TEST
    Close Browser