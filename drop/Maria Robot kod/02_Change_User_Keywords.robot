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


AND can edit Owner 2
#We changing information about owner 2 (Sara Svensson will be Andersson)
    [Arguments]                         ${NEW_LAST_NAME_OWNER_2}
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[12]/td[1]/a  #Click on the 12th owner on the list (Sara Sve
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/button[2]  #Click on "edit owner"
    Clear Element Text                  id:lastName       #Remove current Last name
    Input Text                          id:lastName    ${NEW_LAST_NAME_OWNER_2}
    Click Button                        xpath:/html/body/app-root/app-owner-edit/div/div/form/div[7]/div/button[2]  #Click on "Update Owner"
#We are now on the page with detailed information about towner 1: "Owner information" & "Pets and Visits"

AND can verify a modifications for owner 2 is saved
#We are on the page with detailed information about towner 1: "Owner information" & "Pets and Visits" and want to go to the complete list with all owners
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/button[1]    #Wait until "Back" button is visible
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/button[1]    #Click on "Back" to go to the list with all owners
    Page Should Contain                 Owners
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[12]/td[1]/a

END WEB TEST
    Close Browser
