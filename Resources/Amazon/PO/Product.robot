*** Settings ***
Library         SeleniumLibrary
Resource        ${EXECDIR}/Resources/Amazon/PO/SearchResults.robot

*** Variables ***
${PRODUCT_TITLE_LABEL} =            //*[@id="productTitle"]
${PRODUCT_ADD_TO_CART_BUTTON} =     //*[@id="add-to-cart-button"]

*** Keywords ***
Verify Page Loaded
    Wait Until Page Contains                Back to results

Verify Product Selected
    [Arguments]     ${PRODUCT_SELECTED_NAME}
    ${PRODUCT_TITLE_NAME} =                 get text  ${PRODUCT_TITLE_LABEL} 
    Should Be Equal As Strings              ${PRODUCT_SELECTED_NAME}     ${PRODUCT_TITLE_NAME}      ignore_case=true

Add to Cart
    Click Button                            ${PRODUCT_ADD_TO_CART_BUTTON}