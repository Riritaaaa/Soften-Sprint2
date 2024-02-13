*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ImageFilePath}    C:/Users/coopt/Desktop/qrcode.jpg

*** Test Cases ***
TC01 : Open Catalog
    Open Browser    http://localhost:8080/    Chrome
    Log    This is executed.

TC02 : Click Product
    Click Element    //*[@id="content"]/section/div/div/article/div/div[1]/a 
    Click Element    //*[@id="add-to-cart-or-refresh"]/div[2]/div/div[2]/button
    Sleep    3s
    Click Element    //*[@id="blockcart-modal"]/div/div/div[2]/div/div[2]/div/div/a
    Click Element    //*[@id="main"]/div/div[2]/div/div[2]/div/a
    Location Should Be    http://localhost:8080/order

TC03 : Input Personal Info
    Select Radio Button    id_gender    1
    Input text    //*[@id="field-firstname"]    demo
    Input text    //*[@id="field-lastname"]    demo
    Input text    //*[@id="field-email"]    demo@gmail.com
    Select Checkbox    //*[@id="customer-form"]/div/div[5]/div[1]/span/label/input
    Select Checkbox    //*[@id="customer-form"]/div/div[6]/div[1]/span/label/input
    Unselect Checkbox    //*[@id="needinvoice"]
    Click Button    //*[@id="customer-form"]/footer/button
    Sleep    2s

TC04 : Choose Payment
    Click Element    //*[@id="payment-option-1"]
    Choose File    //*[@id="payment-option-1-additional-information"]/form/input    ${ImageFilePath}
    Sleep    2s
    Click Button    //*[@id="payment-option-1-additional-information"]/form/button
    Sleep    2s
    Capture Page Screenshot    TC02.jpg     
Teardown
    Close Browser



