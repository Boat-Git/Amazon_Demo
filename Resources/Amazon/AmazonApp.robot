*** Settings ***
Resource        ${EXECDIR}/Resources/Amazon/PO/Landing.robot
Resource        ${EXECDIR}/Resources/Amazon/PO/SignIn.robot
Resource        ${EXECDIR}/Resources/Amazon/PO/TopNav.robot
Resource        ${EXECDIR}/Resources/Amazon/PO/SearchResults.robot
Resource        ${EXECDIR}/Resources/Amazon/PO/Product.robot
Resource        ${EXECDIR}/Resources/Amazon/PO/Cart.robot

*** Keywords ***
Login with Many Invalid credentials
    [Arguments]     ${InvalidLoginScenarios}
    FOR  ${LoginScenario}  IN  @{InvalidLoginScenarios}
        Go To "Landing" Page
        Go To "Sign In" Page
        Attem Login     ${LoginScenario}
        Verify Login Error Message      ${LoginScenario}
    END

Go To "Landing" Page
    Landing.Navigate To
    Landing.Verify Page Loaded

Go To "Sign In" Page
    TopNav.Hover "Sign In" Link
    TopNav.Click "Sign In" Link
    SignIn.Verify Page Loaded

Attem Login
    [Arguments]     ${Credentials}
    SignIn.Enter Credentials  ${Credentials}
    SignIn.Click "Continue" Button
    Sleep  1s

Verify Login Error Message
    [Arguments]     ${ExpectedErrorMessage}
    SignIn.Verify Error Message  ${ExpectedErrorMessage}

Search for products
    Landing.Navigate To
    Landing.Verify Page Loaded
    TopNav.Search for Products
    SearchResults.Verify Result Completed

Select Product from Search Results
    ${PRODUCT_SELECTED_NAME} =          SearchResults.Click On Product Link
    Product.Verify Page Loaded
    Product.Verify Product Selected     ${PRODUCT_SELECTED_NAME}

Add Product to Cart
    Product.Add to Cart
    Cart.Verify Product Added

Begin Checkout
    Cart.Proceed to Checkout
    SignIn.Verify Page Loaded