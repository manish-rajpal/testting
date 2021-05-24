*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Generate Tests
    Open Browser            about:blank     ${BROWSER}

# Access web page
Go To Web
    Load Web
    Verify Page Loaded
Load Web
    Go To                   ${URL}
Verify Page Loaded
    ${GET_TITLE}            Get Title
    Should Be Equal         ${GET_TITLE}        SpringPetclinicAngular
    Page Should Contain                         Welcome to Petclinic

Click Owner
    Page Should Contain Element         xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]     #"Owner" link
    Click Element                       xpath:/html/body/app-root/div[1]/nav/div/ul/li[2]

Click Specalist
    Page Should Contain Element         xpath:/html/body/app-root/div[1]/nav/div/ul/li[5]/a
    Click Element                       xpath:/html/body/app-root/div[1]/nav/div/ul/li[5]/a
Update Specalist
    Page Should Contain                 Specialties
    Page Should Contain Element         xpath:/html/body/app-root/app-specialty-list/div/div/h2  # click "all" link
    Wait Until Element Is Visible       //*[@id="specialties"]/tbody/tr[1]/td[2]/button[1]
    Click Button                        //*[@id="specialties"]/tbody/tr[1]/td[2]/button[1]
    Input Text                          //*[@id="name"]  heart
    Click Button                       //*[@id="specialty"]/div[2]/div/button[1]
    #Page Should Contain                 xpath:/html/body/app-root/app-specialty-list/div/div/h2
    Wait Until Element Is Visible       //*[@id="specialties"]/tbody/tr[2]/td[2]/button[1]
    Click Button                       //*[@id="specialties"]/tbody/tr[2]/td[2]/button[1]
    Input Text                          //*[@id="name"]  brain
    Wait Until Element Is Visible       //*[@id="specialty"]/div[2]/div/button[1]
    Click Button                       //*[@id="specialty"]/div[2]/div/button[1]
    Wait Until Element Is Visible       //*[@id="specialties"]/tbody/tr[3]/td[2]/button[1]
    Click Button                       //*[@id="specialties"]/tbody/tr[3]/td[2]/button[1]
    Input Text                          //*[@id="name"]    Tooth
    Click Button                       //*[@id="specialty"]/div[2]/div/button[1]

Add Specalist
    #Page Should Contain                Specialties


    Wait Until Element Is Visible      xpath:/html/body/app-root/app-specialty-list/div/div/div/button[2]
    Click Button                       xpath:/html/body/app-root/app-specialty-list/div/div/div/button[2]
    Wait Until Element Is Visible       //*[@id="name"]
    Input Text                          //*[@id="name"]    EliasA
    Wait Until Element Is Visible       //*[@id="specialty"]/div[2]/div/button
    Click Button                       //*[@id="specialty"]/div[2]/div/button
    
Delete Specalist
    Click Button                       //*[@id="specialties"]/tbody/tr[4]/td[2]/button[2]

All Query
    Page Should Contain Element         //*[@routerlink="/owners"]    # click "all" link
    Click Element                       //*[@routerlink="/owners"]

    Page Should Contain                 Owners

    Page Should Contain Element         //*[@class="table table-striped"]
    Element Text Should be              //*[@class="table table-striped"]/thead/tr/th[1]      Name
    Element Text Should be              //*[@class="table table-striped"]/thead/tr/th[2]      Address
    Element Text Should be              //*[@class="table table-striped"]/thead/tr/th[3]      City
    Element Text Should be              //*[@class="table table-striped"]/thead/tr/th[4]      Telephone
    Element Text Should be              //*[@class="table table-striped"]/thead/tr/th[5]      Pets

Add Owner Value
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/div/button   #Click "Add owner"
    Input Text                          //*[@id="firstName"]  TestFirstName
    Input Text                          //*[@id="lastName"]   TestLatsName
    Input Text                          //*[@id="address"]    TestAddress
    Input Text                          //*[@id="city"]   TestCity
    Input Text                          //*[@id="telephone"]  1234567890
    Click Button                        xpath:/html/body/app-root/app-owner-add/div/div/form/div[7]/div/button[2]   #Click Add owner again to save it

Edit Owner Value
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[1]/td[1]/a
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[1]/td[1]/a  #Click on the owner
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/button[2]  #Click on edit
    Clear Element Text                  //*[@id="firstName"]      #Remove current values
    Input Text                          //*[@id="firstName"]    EditName      #Name it "EditName"
    Clear Element Text                  //*[@id="lastName"]       #Remove current Last name
    Input Text                          //*[@id="lastName"]    EditLastName  #Name it "EditLastName"
    Clear Element Text                  //*[@id="address"]    #Remove current adress
    Input Text                          //*[@id="address"]    EditAdress
    Clear Element Text                  //*[@id="city"]       #Remove City
    Input Text                          //*[@id="city"]    EditCity
    Clear Element Text                  //*[@id="telephone"]     #Remove the phonenumber
    Input Text                          //*[@id="telephone"]    9955441122
    Click Button                        xpath:/html/body/app-root/app-owner-edit/div/div/form/div[7]/div/button[2]

Add Pet Value
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[3]/td[1]/a
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[3]/td[1]/a  #Click on the third owner on the list
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/button[3]    #Click on Add new pet
    Input Text                          //*[@id="name"]    New pet
    Input Text                          xpath:/html/body/app-root/app-pet-add/div/div/form/div[4]/div/input    2021/01/20   #Put in a date
    Click Element                       //*[@id="type"]
    Click Element                       //*[@id="type"]/option[1]   #Choose option 1 Cat
    Click Button                        xpath:/html/body/app-root/app-pet-add/div/div/form/div[6]/div/button[2]   #Press add pet

Edit Pet Value
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[3]/td[1]/a    #Click name of owner
    Click Element                       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl/button[1]  #Click edit pet
    Clear Element Text                  //*[@id="name"]     #Clean imputbox for petname
    Input Text                          //*[@id="name"]    EditPet
    Input Text                          xpath:/html/body/app-root/app-pet-edit/div/div/form/div[4]/input    2012/01/31  #Imput date of birth
    Click Element                       //*[@id="type"]   #Click the type
    Click Element                       //*[@id="type"]/option[1]   #Choose option 1 for cat
    Click Button                        xpath:/html/body/app-root/app-pet-edit/div/div/form/div[6]/div/button[2]  #Save data

Remove Pet Value     # revised by Feng
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[3]/td[1]/a  #Click name of owner
    Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[1]/dl/button[2]   #Choose and delete pet

Create Pet Visit    # revised by Feng
    Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[6]/td[1]/a
    Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[6]/td[1]/a
    Wait Until Page Contains Element     //button[contains(text(),"Add Visit")]
    Page Should Contain                 Pets and Visits

    Click Button                         //button[contains(text(),"Add Visit")]

    Input Text                          //*[@id="visit"]/div[1]/div[1]/div/input    2012/01/31
    Input Text                          //*[@id="description"]    Test Visit
    Click Button                        //*[@id="visit"]/div[2]/div/button[2]

Edit Pet Visit
     Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[6]/td[1]/a
     Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[6]/td[1]/a
     Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[2]/app-visit-list/table/tr[1]/td[3]/button[1]
     Click Button                        xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[2]/app-visit-list/table/tr[1]/td[3]/button[1]
     Clear Element Text                  //*[@id="description"]
     Input Text                          //*[@id="description"]    Placeholder
     Click Button                        //*[@id="visit"]/div[2]/div/button[2]

Delete Pet Visit
     Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[6]/td[1]/a
     Click Element                       xpath:/html/body/app-root/app-owner-list/div/div/div/table/tbody/tr[6]/td[1]/a
     Wait Until Element Is Visible       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[2]/app-visit-list/table/tr[1]/td[3]/button[2]
     Click Element                       xpath:/html/body/app-root/app-owner-detail/div/div/table[2]/tr/app-pet-list[1]/table/tr/td[2]/app-visit-list/table/tr[1]/td[3]/button[2]

Close Active Browser
    Close Browser     #Close the test


