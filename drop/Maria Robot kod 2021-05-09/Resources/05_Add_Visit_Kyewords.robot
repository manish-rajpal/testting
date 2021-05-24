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
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[11]/td[1]/a  #We can see 11th owner on the list (Thomas Johansson)
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[11]/td[1]/a  #Click on the 11th owner on the list (Thomas Johansson)
#We are now in the window there we can edit user 1, pets and add visit

AND can add a visit for Owners 1 pet 1
#Add visit for user 1 Thomas Johanssons cat Molly who has problems with teeth
    [Arguments]                         ${VISIT_DATE_PET_1_OWNER_1}       ${DESCRIPTION_VISIT_PET_1_OWNER_1}
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/button[3]      #button "Add Visit" is visable
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[1]/dl/button[3]      #Click on "Add Visit" for pet 2
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-visit-add/div/div/h2      #verify that we are on the page for adding new visit and see "New Visit"
    Input Text                          //*[@id="visit"]/div[1]/div[1]/div/input        ${VISIT_DATE_PET_1_OWNER_1}      #type a visit date
    Input Text                          id:description      ${DESCRIPTION_VISIT_PET_1_OWNER_1}     #type description for visit
    Click Button                        //*[@id="visit"]/div[2]/div/button[2]       #Click on button "Add Visit"

AND can see a new booked visit for Owners 1 pet 1
#We are now on the page with detailed information about owner 1: "Owner information" & "Pets and Visits"
#verify that a new visit is added and visable:
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[2]/table/tr/td[2]/app-visit-list/table/tr/td[1]


AND can add a visit for Owners 1 pet 2
#Add visit for user 1 Thomas Johanssons dog Lassie who has problems with stomack
    [Arguments]                         ${VISIT_DATE_PET_2_OWNER_1}       ${DESCRIPTION_VISIT_PET_2_OWNER_1}
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl/button[3]      #button "Add Visit" is visable
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl/button[3]      #Click on "Add Visit" for pet 2
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-visit-add/div/div/h2      #verify that we are on the page for adding new visit and see "New Visit"
    Input Text                          //*[@id="visit"]/div[1]/div[1]/div/input        ${VISIT_DATE_PET_2_OWNER_1}      #type a visit date
    Input Text                          id:description      ${DESCRIPTION_VISIT_PET_2_OWNER_1}     #type description for visit
    Click Button                        //*[@id="visit"]/div[2]/div/button[2]       #Click on button "Add Visit"

AND can see a new booked visit for Owners 1 pet 2
#We are now on the page with detailed information about owner 1: "Owner information" & "Pets and Visits"
#verify that a new visit is added and visable:
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[2]/app-visit-list/table/tr/td[1]

AND can go back to list with all owners
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/button[1]     #Wait until "Back" button is visible
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/button[1]    #Click on "Back" to go to the list with all owners
#We are back to the list with all owners


AND can find and edit owner 2 in the list
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[12]/td[1]/a  #We can see 12th owner on the list (Sara Andersson)
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[12]/td[1]/a  #Click on the 12th owner on the list (Sara Andersson)
#We are now in the window there we can edit user 1, pets and add visit

AND can add a visit for Owners 2 pet
#Add visit for user 2 Sara Anderssons dog Buddy who needs to do X-ray on rear legs
    [Arguments]                         ${VISIT_DATE_PET_OWNER_2}       ${DESCRIPTION_VISIT_PET_1_OWNER_2}
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[3]     #button "Add Visit" is visable
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[1]/dl/button[3]     #Click on "Add Visit"
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-visit-add/div/div/h2      #verify that we are on the page for adding new visit and see "New Visit"
    Input Text                          //*[@id="visit"]/div[1]/div[1]/div/input        ${VISIT_DATE_PET_OWNER_2}      #type a visit date
    Input Text                          id:description      ${DESCRIPTION_VISIT_PET_1_OWNER_2}     #type description for visit
    Click Button                        //*[@id="visit"]/div[2]/div/button[2]       #Click on button "Add Visit"

AND can see a new booked visit for Owners 2 pet
#We are now on the page with detailed information about owner 2: "Owner information" & "Pets and Visits"
#verify that a new visit is added and visable:
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list/table/tr/td[2]/app-visit-list/table/tr/td[1]
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/button[1]     #Wait until "Back" button is visible
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/button[1]    #Click on "Back" to go to the list with all owners
#We are back to the list with all owners

THEN we can find owner 2 in the list
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[12]/td[1]/a  #We can see 12th owner on the list (Sara Andersson)


END WEB TEST
    Close Browser


