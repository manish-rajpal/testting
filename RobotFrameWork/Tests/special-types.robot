*** Settings ***
Documentation     A test suite with a single test for valid login.
...
...               This test has a workflow that is created using keywords in
...               the imported resource file.
#Resource
Library    SeleniumLibrary

*** Variables ***
${BROWSER}      chrome
${URL}          http://localhost:4200

*** Test Cases ***
Add Type
  [Documentation]         Pettypes can be added
  [Tags]                  Adding Pettype
  #Open the website
  Open Browser            about:blank     ${BROWSER}
  Go To                   ${URL}
  Click Element           xpath:/html/body/app-root/div[1]/nav/div/ul/li[4]/a     #klickar på pet types

  #Add the Pettype
  Click Element           xpath:/html/body/app-root/app-pettype-list/div/div/div/button[2]
  Input Text              //*[@id="name"]    Wolf
  Click Element           //*[@id="pettype"]/div[2]/div/button  #klickar på save

  Close Browser

*** Test Cases ***
Edit Type
  [Documentation]         Pettypes can be edited
  [Tags]                  Editing Pettype
  #Open the website
  Open Browser            about:blank     ${BROWSER}
  Go To                   ${URL}
  Click Element           xpath:/html/body/app-root/div[1]/nav/div/ul/li[4]/a     #klickar på pet types

  #Edit the Pettype
  Click Element           //*[@id="pettypes"]/tbody/tr[7]/td[2]/button[1]
  Clear Element Text      //*[@id="name"]
  Input Text              //*[@id="name"]    Shiban
  Click Button           //*[@id="pettype"]/div[2]/div/button[1]

  Close Browser

*** Test Cases ***
Delete Type
  [Documentation]         Pettypes can be Deleted
  [Tags]                  Deleting Pettype
  #Open the website
  Open Browser            about:blank     ${BROWSER}
  Go To                   ${URL}
  Click Element           xpath:/html/body/app-root/div[1]/nav/div/ul/li[4]/a     #klickar på pet types

  #Delete the pettype
  Wait Until Element Is Visible    //*[@id="pettypes"]/tbody/tr[3]/td[2]/button[2]
  Click Button                     //*[@id="pettypes"]/tbody/tr[3]/td[2]/button[2]

  Close Browser
