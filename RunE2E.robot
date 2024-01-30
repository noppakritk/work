*** Settings ***
Documentation    This is a simple example test suite
Library          SeleniumLibrary

*** Variables ***
${BROWSER}       chrome
${URL}           https://training-platform.doppio-tech.com     #SIT ENV https://doppee.doppio-tech.com
${name}          Qa
${surname}       Tester
${address}       30/9 siam village bangkok
${telephone}     0953353363        
${creditcard}    4111111111111111

*** Test Cases ***
TC01 - Verify that can open browser success
    Open Browser    ${URL}    ${BROWSER}
    ...             options=add_experimental_option("detach",True) 
TC02 - Verify that can click icon profile 
    Click profile
TC03 - Verify that can click button sign up to register successful
    Register New User    acc0@gmail.com   Test1234@    Test1234@
TC04 - Verify that can logout after register successful
    Logout
TC05 - Verify that can login after register successful
    Click Profile
    Login    acc@gmail.com    Test1234@
TC06 - Page should equal Doppee after login successful
    Page Shoudl Be Equal Doppee On Top Left Bar
TC07 - Verify that can search item phone successful
    Search Item
TC08 - Verify that can purchase the item with credit card successful
    Order Item
    Input Name
    Input Surname
    Input Address
    Input Telephone
    Process Payment
    Input Credit Card
    Order Success Confirmed
TC09 - Verify that can comfirmed order successful
    Order Success Confirmed
*** Keywords ***
Register New User
    [Arguments]    ${user}    ${pass}    ${confirmPass}
    Click Element   //*[@id="app"]/section/div/div/form/div[4]/div/div/div/div/button 
    Input Text    id:basic_username    ${user}
    Input Text    id:basic_password    ${pass}
    Input Text    id:basic_confirmPassword    ${confirmPass}
    Click Element    //*[@id="app"]/section/div/div/form/div[4]/div/div/div/div/button
    Wait Until Element Is Visible    //button[@type='button'][1]    # first element 
    Click Element    //button[@type='button'][1]
Login 
    [Arguments]    ${loginUser}    ${loginPass}
    #Click Element    //*[@id="app"]/section/header/ul/div/div[2]/div[2]/span
    Input Text    //*[@id="app"]/section/div/div/form/div[1]/div/div[2]/div/div/span/input    ${loginUser}
    Input Text    //*[@id="app"]/section/div/div/form/div[2]/div/div[2]/div/div/span/input    ${loginPass}
    Click Element    //*[@id="app"]/section/div/div/form/div[3]/div/div/div/div/button
    Wait Until Element Is Visible    //div[2]/div/div[2]/div/div[2]/div/div/div[2]/button
    Click Element    //div[2]/div/div[2]/div/div[2]/div/div/div[2]/button
Logout
    Wait Until Element Is Visible    //*[@id="app"]/section/header/ul/div/div[2]/div[2]/span
    Click Element    //*[@id="app"]/section/header/ul/div/div[2]/div[2]/span
    Click Element    //*[@id="app"]/section/button
Click Profile
    Click Element    //*[@id="app"]/section/header/ul/div/div[2]/div[2]/span
Search Item    
    Input Text    //*[@id="app"]/section/div/div[1]/span/span/input    Phone
    Click Element    //*[@id="app"]/section/div/div[1]/span/span/span/button
Order Item
    Wait Until Element Is Visible    //*[@id="app"]/section/div/div[2]/div/div[4]/div/div[2]
    Click Element    //*[@id="app"]/section/div/div[2]/div/div[4]/div/div[2]
    Wait Until Element Is Visible    //*[@id="app"]/section/div/div/div[4]/button   
    Click Element    //*[@id="app"]/section/div/div/div[4]/button
    Wait Until Element Is Visible    //div[3]/div/div[2]/div/div[2]/div/div/div[2]/button
    Click Element    //div[3]/div/div[2]/div/div[2]/div/div/div[2]/button
    Click Element    //*[@id="app"]/section/header/ul/div/div[2]/div[1]/span
Page Shoudl Be Equal Doppee On Top Left Bar
    Element Text Should Be    //*[@id="app"]/section/header/ul/div/div[1]/li/span/h2    Doppee
Input Name
    sleep    1s  
    Input Text    id:form_item_name    ${name} 
Input Surname
    Input Text    id:form_item_surName    ${surname}
Input Address
    Input Text    id:form_item_address    30/9 siam village bangkok
Input Telephone 
    Input Text    id:form_item_phone    ${telephone}
Process Payment
    Click Element    //*[@id="app"]/section/div/div[3]/div/div/div/div/div/div/div/button
    Click Element    //*[@id="app"]/section/div/div/button
Input Credit Card
    Input Text    id:basic_bin    ${creditcard}
    Input Text    id:basic_exp    06/2024
    Input Text    id:basic_cvc    333
    Input Text    id:basic_owner    Qa Tester
    Click Element    //*[@id="app"]/section/div/div/form/div[4]/div/div/div/div/button
    Wait Until Element Is Visible    //div[3]/div/div[2]/div/div[2]/div/div/div[2]/button
    Click Element    //div[3]/div/div[2]/div/div[2]/div/div/div[2]/button
Order Success Confirmed
    Element Text Should Be    css:.success-title     Payment Complete 
