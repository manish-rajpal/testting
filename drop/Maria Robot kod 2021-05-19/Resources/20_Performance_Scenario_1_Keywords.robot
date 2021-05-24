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

WHEN the user can find and click OWNER menu
#Find "OWNERS" in menu and click on it
    wait until page contains            Owners
    Click Element                       xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]

AND find ALL
#Find ALL under OWNERS roll-down menu and click on it
    Page Should Contain Element         //*[@routerlink="/owners"]
    Click Element                       //*[@routerlink="/owners"]

AND see all menu for Owners
#verify that we can see all menu and list with owners
    Page Should Contain                 Owners
    Page Should Contain Element         //*[@class="table table-striped"]
    Element Text Should be              //*[@class="table table-striped"]/thead/tr/th[1]      Name
    Element Text Should be              //*[@class="table table-striped"]/thead/tr/th[2]      Address
    Element Text Should be              //*[@class="table table-striped"]/thead/tr/th[3]      City
    Element Text Should be              //*[@class="table table-striped"]/thead/tr/th[4]      Telephone
    Element Text Should be              //*[@class="table table-striped"]/thead/tr/th[5]      Pets

AND can click on "Add Owner"
#We can click on menu button for "Add Owner"
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/div/button

AND can add a new Owner
# adding information about new owner 1
    [Arguments]                         ${PERFORMANCE_1_FIRST_NAME_OWNER}      ${PERFORMANCE_1_LAST_NAME_OWNER}     ${PERFORMANCE_1_ADDRESS_OWNER}      ${PERFORMANCE_1_CITY_OWNER}     ${PERFORMANCE_1_TELEPHONE_OWNER}
    Input Text                          id:firstName    ${PERFORMANCE_1_FIRST_NAME_OWNER}
    Input Text                          id:lastName     ${PERFORMANCE_1_LAST_NAME_OWNER}
    Input Text                          id:address      ${PERFORMANCE_1_ADDRESS_OWNER}
    Input Text                          id:city         ${PERFORMANCE_1_CITY_OWNER}
    Input Text                          id:telephone    ${PERFORMANCE_1_TELEPHONE_OWNER}
    Click Button                        xpath:/html/body/app-root/app-owner-add/div/div/form/div[7]/div/button[2]   #Click Add owner (under all input) to save it
#We are back to the list with all owners

AND can verify a new owner is saved
#We are on the list with all owners
    Page Should Contain                 Owners
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[14]/td[1]/a
    #We can see in the list Number 14 is Eva Olsson (if we didn't run any tests before. otherwise it will be another number

AND Add Pet 1
#We start from a list with all owners
    [Arguments]                         ${PERFORMANCE_1_PET_1_NAME}     ${PERFORMANCE_1_BIRTH_DATE_PET_1}
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[14]/td[1]/a     #Click on the 14th owner on the list (Eva Olsson)
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/button[3]    #Click on "Add new pet"
    Input Text                          id:name    ${PERFORMANCE_1_PET_1_NAME}
    Input Text                          xpath:/html/body/app-root/app-pet-add/div/div/form/div[4]/div/input    ${PERFORMANCE_1_BIRTH_DATE_PET_1}
    Click Element                       //*[@id="type"]
    Click Element                       //*[@id="type"]/option[1]   #Choose option 1 Cat
    Click Button                        xpath:/html/body/app-root/app-pet-add/div/div/form/div[6]/div/button[2]   #Click on "add pet" to save new pet
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]
#We are now on the page with detailed information about owner 1: "Owner information" & "Pets and Visits"

AND Add Pet 2
#We start from a list with all owners
    [Arguments]                         ${PERFORMANCE_1_PET_2_NAME}     ${PERFORMANCE_1_BIRTH_DATE_PET_2}
    #Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[13]/td[1]/a     #Click on the 14th owner on the list (Eva Olsson)
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/button[3]    #Click on "Add new pet"
    Input Text                          id:name    ${PERFORMANCE_1_PET_2_NAME}
    Input Text                          xpath:/html/body/app-root/app-pet-add/div/div/form/div[4]/div/input    ${PERFORMANCE_1_BIRTH_DATE_PET_2}
    Click Element                       //*[@id="type"]
    Click Element                       //*[@id="type"]/option[2]   #Choose option 2 Dog
    Click Button                        xpath:/html/body/app-root/app-pet-add/div/div/form/div[6]/div/button[2]   #Click on "add pet" to save new pet
#We are now on the page with detailed information about towner 1: "Owner information" & "Pets and Visits"

AND can verify 2 pets for owner are saved
#We are on the page with detailed information about towner 1: "Owner information" & "Pets and Visits"
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/button[1]     #Wait until "Back" button is visible
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/button[1]    #Click on "Back" to go to the list with all owners
#We are back to the list with all owners

AND can remove pet 2
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[14]/td[1]/a
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[14]/td[1]/a     #Click on the 14th owner on the list (Eva Olsson)
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl/button[2]
    #Click on "Delete Pet" button for Toro

AND can change last name
    [Arguments]                         ${PERFORMANCE_1_NEW_LAST_NAME_OWNER}
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/button[2]  #Click on "edit owner"
    Clear Element Text                  id:lastName       #Remove current Last name
    Input Text                          id:lastName    ${PERFORMANCE_1_NEW_LAST_NAME_OWNER}
    Click Button                        xpath:/html/body/app-root/app-owner-edit/div/div/form/div[7]/div/button[2]  #Click on "Update Owner"
#We are now on the page with detailed information about towner 1: "Owner information" & "Pets and Visits"

THEN can verify modifications for owner
#We are on the page with detailed information about towner 1: "Owner information" & "Pets and Visits" and want to go to the complete list with all owners
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/button[1]    #Wait until "Back" button is visible
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/button[1]    #Click on "Back" to go to the list with all owners
    Page Should Contain                 Owners
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[14]/td[1]/a     #Owner number 14 Eva Nilsson (before - Olsson) is now visable

END WEB TEST
    Close Browser
