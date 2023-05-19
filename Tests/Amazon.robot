*** Settings ***
Resource        ${EXECDIR}/Data/InputData.robot
Resource        ${EXECDIR}/Resources/Common/CommonApp.robot
Resource        ${EXECDIR}/Resources/Amazon/AmazonApp.robot
Resource        ${EXECDIR}/Resources/DataManager/DataManager.robot

Test Setup      CommonApp.Begin Web Test
Test Teardown   CommonApp.End Web Test

#   Copy/Paste the comand below into terminal to run the script
#   robot -d Results Tests/Amazon.robot
#   robot -d Results -i Check_out Tests/Amazon.robot
#   robot -d Results -i invalid-credentials Tests/Amazon.robot

*** Test Cases ***
Should be able to access "Landing" page
    [Documentation]     this is case 1
    [Tags]              Landing
    AmazonApp.Go To "Landing" Page

Should see correct error message with invalid logins
    [Documentation]     this is case 2
    [Tags]              invalid-credentials
    ${InvalidLoginScenarios} =  DataManager.Get CSV Data  ${INVALID_CREDENTIALS_CSV_PATH}
    AmazonApp.Login with Many Invalid credentials         ${InvalidLoginScenarios}

Logged out user should be able to search product
    [Documentation]     this is case 3
    [Tags]              Search_product
    AmazonApp.Search for products

Logged out user should be able to view product
    [Documentation]     this is case 4
    [Tags]              Search_product2
    AmazonApp.Search for products
    AmazonApp.Select Product from Search Results

Logged out user should be able to add product to cart
    [Documentation]     this is case 5
    [Tags]              Search_product3
    AmazonApp.Search for products
    AmazonApp.Select Product from Search Results
    AmazonApp.Add Product to Cart

Logged out user should be asked to sign in to check out
    [Documentation]     this is case 6
    [Tags]              Check_out
    AmazonApp.Search for products
    AmazonApp.Select Product from Search Results
    AmazonApp.Add Product to Cart
    AmazonApp.Begin Checkout