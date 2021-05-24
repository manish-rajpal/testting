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

AND Add Extra Pet to Owner 1
#We start from a list with all owners
#We are adding an extra pet for Thomas Johansson: dog Lassie with birth date 2018/02/23
    [Arguments]                         ${EXTRA_PET_NAME_OWNER_1}       ${EXTRA_BIRTH_DATE_PET_OWNER_1}
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[11]/td[1]/a     #Click on the 11th owner on the list (Thomas Johansson)
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/button[3]    #Click on "Add new pet"
    Input Text                          id:name    ${EXTRA_PET_NAME_OWNER_1}
    Input Text                          xpath:/html/body/app-root/app-pet-add/div/div/form/div[4]/div/input    ${EXTRA_BIRTH_DATE_PET_OWNER_1}
    Click Element                       //*[@id="type"]
    Click Element                       //*[@id="type"]/option[2]   #Choose option 2 dog
    Click Button                        xpath:/html/body/app-root/app-pet-add/div/div/form/div[6]/div/button[2]   #Click on "add pet" to save new pet
#We are now on the page with detailed information about towner 1: "Owner information" & "Pets and Visits"

AND can verify an extra pet for owner 1 is saved
#We are on the page with detailed information about owner 1: "Owner information" & "Pets and Visits"
    #Page Should Contain                 Owner Information
    #Page Should Contain                 Pets and Visits
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/button[1]     #Wait until "Back" button is visible
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/button[1]    #Click on "Back" to go to the list with all owners
#We are back to the list with all owners

END WEB TEST
    Close Browser