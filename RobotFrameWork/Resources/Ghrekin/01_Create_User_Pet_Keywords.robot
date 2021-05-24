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

AND can click on "Add Owner" 1
#We can click on menu button for "Add Owner"
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/div/button

AND can add a new Owner 1
# adding information about new owner 1
    [Arguments]                         ${FIRST_NAME_OWNER_1}       ${LAST_NAME_OWNER_1}     ${ADDRESS_OWNER_1}      ${CITY_OWNER_1}    ${TELEPHONE_OWNER_1}
    Input Text                          id:firstName    ${FIRST_NAME_OWNER_1}
    Input Text                          id:lastName     ${LAST_NAME_OWNER_1}
    Input Text                          id:address      ${ADDRESS_OWNER_1}
    Input Text                          id:city         ${CITY_OWNER_1}
    Input Text                          id:telephone    ${TELEPHONE_OWNER_1}
    Click Button                        xpath:/html/body/app-root/app-owner-add/div/div/form/div[7]/div/button[2]   #Click Add owner (under alll input) to save it
#We are back to the list with all owners

AND can verify a new owner 1 is saved       # revised by Feng
#We are on the list with all owners
#How to verify a right name is in the list?
    [Arguments]                         ${FIRST_NAME_OWNER_1}       ${LAST_NAME_OWNER_1}
    Page Should Contain                 Owners
    Sleep                               5
    Element Should Contain              //*[@class="table table-striped"]/tbody  ${FIRST_NAME_OWNER_1} ${LAST_NAME_OWNER_1}
    #We can see in the list Number 11 is Thomas Johansson

AND Add Pet 1 Value
#We start from a list with all owners
    [Arguments]                         ${PET_NAME_OWNER_1}     ${BIRTH_DATE_PET_OWNER_1}
    Sleep                               10
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[11]/td[1]/a     #Click on the 11th owner on the list (Thomas Johansson)
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/button[3]    #Click on "Add new pet"
    Input Text                          id:name    ${PET_NAME_OWNER_1}
    Input Text                          xpath:/html/body/app-root/app-pet-add/div/div/form/div[4]/div/input    ${BIRTH_DATE_PET_OWNER_1}
    Click Element                       //*[@id="type"]
    Click Element                       //*[@id="type"]/option[1]   #Choose option 1 Cat
    Click Button                        xpath:/html/body/app-root/app-pet-add/div/div/form/div[6]/div/button[2]   #Click on "add pet" to save new pet
#We are now on the page with detailed information about towner 1: "Owner information" & "Pets and Visits"

AND can verify a pet for owner 1 is saved
#We are on the page with detailed information about towner 1: "Owner information" & "Pets and Visits"
    #Page Should Contain                 Owner Information
    #Page Should Contain                 Pets and Visits
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/button[1]     #Wait until "Back" button is visible
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/button[1]    #Click on "Back" to go to the list with all owners
#We are back to the list with all owners

AND can click on "Add Owner" 2
#We can click on menu button for "Add Owner"
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/div/button

AND can add a new Owner 2
# adding information about new owner 2
    [Arguments]                         ${FIRST_NAME_OWNER_2}       ${LAST_NAME_OWNER_2}     ${ADDRESS_OWNER_2}      ${CITY_OWNER_2}    ${TELEPHONE_OWNER_2}
    Input Text                          id:firstName    ${FIRST_NAME_OWNER_2}
    Input Text                          id:lastName     ${LAST_NAME_OWNER_2}
    Input Text                          id:address      ${ADDRESS_OWNER_2}
    Input Text                          id:city         ${CITY_OWNER_2}
    Input Text                          id:telephone    ${TELEPHONE_OWNER_2}
    Click Button                        xpath:/html/body/app-root/app-owner-add/div/div/form/div[7]/div/button[2]   #Click Add owner again to save it
#We are back to the list with all owners

AND can verify a new owner 2 is saved
#We are on the list with all owners
#How to verify a right name is in the list?
    Page Should Contain                 Owners
    Sleep                               5
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[12]/td[1]/a     #We can see in the list Number 12 is Sara Svensson

AND Add Pet 2 Value
#We start from a list with all owners
    [Arguments]                         ${PET_NAME_OWNER_2}     ${BIRTH_DATE_PET_OWNER_2}
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[12]/td[1]/a     #Click on the 12th owner on the list (Sara Svensson)
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/button[3]        #Click on "Add new pet"
    Input Text                          id:name    ${PET_NAME_OWNER_2}
    Input Text                          xpath:/html/body/app-root/app-pet-add/div/div/form/div[4]/div/input    ${BIRTH_DATE_PET_OWNER_2}
    Click Element                       //*[@id="type"]
    Click Element                       //*[@id="type"]/option[2]   #Choose option 2 dog
    Click Button                        xpath:/html/body/app-root/app-pet-add/div/div/form/div[6]/div/button[2]   #Click on "add pet" to save new pet
#We are now on the page with detailed information about towner 1: "Owner information" & "Pets and Visits"

AND can verify a pet for owner 2 is saved
#We are on the page with detailed information about towner 1: "Owner information" & "Pets and Visits"
    #Page Should Contain                 Owner Information
    #Page Should Contain                 Pets and Visits
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/button[1]     #Wait until "Back" button is visible
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/button[1]    #Click on "Back" to go to the list with all owners
#We are back to the list with all owners

AND can click on "Add Owner" 3
#We can click on menu button for "Add Owner"
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/div/button

AND can add a new Owner 3
# adding information about new owner 3
    [Arguments]                         ${FIRST_NAME_OWNER_3}       ${LAST_NAME_OWNER_3}     ${ADDRESS_OWNER_3}      ${CITY_OWNER_3}    ${TELEPHONE_OWNER_3}
    Input Text                          id:firstName    ${FIRST_NAME_OWNER_3}
    Input Text                          id:lastName     ${LAST_NAME_OWNER_3}
    Input Text                          id:address      ${ADDRESS_OWNER_3}
    Input Text                          id:city         ${CITY_OWNER_3}
    Input Text                          id:telephone    ${TELEPHONE_OWNER_3}
    Click Button                        xpath:/html/body/app-root/app-owner-add/div/div/form/div[7]/div/button[2]   #Click Add owner again to save it
#We are back to the list with all owners

AND can verify a new owner 3 is saved
#We are on the list with all owners
#How to verify a right name is in the list?
    Page Should Contain                 Owners
    Sleep                               5
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[13]/td[1]/a     #We can see in the list Number 13 is Ken Maccoy

AND Add Pet 3 Value
#We start from a list with all owners
    [Arguments]                         ${PET_NAME_OWNER_3}     ${BIRTH_DATE_PET_OWNER_3}
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[13]/td[1]/a     #Click on the 13th owner on the list (Kent Maccoy)
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/button[3]    #Click on "Add new pet"
    Input Text                          id:name    ${PET_NAME_OWNER_3}
    Input Text                          xpath:/html/body/app-root/app-pet-add/div/div/form/div[4]/div/input    ${BIRTH_DATE_PET_OWNER_3}
    Click Element                       //*[@id="type"]
    Click Element                       //*[@id="type"]/option[5]   #Choose option 5 bird
    Click Button                        xpath:/html/body/app-root/app-pet-add/div/div/form/div[6]/div/button[2]   #Click on "add pet" to save new pet
#We are now on the page with detailed information about towner 1: "Owner information" & "Pets and Visits"

THEN can verify a pet for owner 3 is saved
#We are on the page with detailed information about towner 1: "Owner information" & "Pets and Visits"
    #Page Should Contain                 Owner Information
    #Page Should Contain                 Pets and Visits
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/button[1]     #Wait until "Back" button is visible
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/button[1]    #Click on "Back" to go to the list with all owners
#We are back to the list with all owners

END WEB TEST
    Close Browser