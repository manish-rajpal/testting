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

AND can find and edit owner 1 in the list
#We are going to the page with detailed information about owner 2: "Owner information" & "Pets and Visits"
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[11]/td[1]/a  #We can see 11th owner on the list (Thomas Johansson)
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[11]/td[1]/a  #Click on the 11th owner on the list (Thomas Johansson)
#We are now in the window there we can edit user 1, pets and add visit

AND can remove a visit for Owners 1 pet 1
#Remove visit for user 1 Thomas Johanssons cat Molly who has problems with teeth
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[2]/app-visit-list/table/tr[1]/td[3]/button[2]       #button "Delete Visit" is visable
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[2]/app-visit-list/table/tr[1]/td[3]/button[2]      #Click on button "Delete Visit"


AND can update a visit for Owners 1 pet 2
#Add visit for user 1 Thomas Johanssons dog Lassie who has now URGENT problems with stomack
    [Arguments]                         ${NEW_DESCRIPTION_VISIT_PET_2_OWNER_1}
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[1]       #button "Edit Visit" is visable
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[2]/app-visit-list/table/tr/td[3]/button[1]       #Click on "Edit Visit" for pet 2
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-visit-edit/div/div/h2     #verify that we are on the page for editing visit and see "Edit Visit"
    Clear Element Text                  id:description
    Input Text                          id:description      ${NEW_DESCRIPTION_VISIT_PET_2_OWNER_1}     #type description for visit
    Click Button                        //*[@id="visit"]/div[2]/div/button[2]       #Click on button "Edit Visit"

AND we can see new information saved
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/h2[2]    #"Pets and Visits# are visable
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/button[1]     #Wait until "Back" button is visible
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/button[1]    #Click on "Back" to go to the list with all owners
#We are back to the list with all owners

THEN we can find owner 1 in the list
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[11]/td[1]/a  #We can see 11th owner on the list (Thomas Johansson)


END WEB TEST
    Close Browser