*** Settings ***
Library         SeleniumLibrary

*** Variables ***
#${CART_ADDED_LABEL} =                   //*[@id="attachDisplayAddBaseAlert"]
${CART_ADD_BUTTON} =                    //*[@id="sc-buy-box-ptc-button"]/span/input
#${CART_CHECKOUT_BUTTON} =               //*[@id="attach-sidesheet-checkout-button"]

*** Keywords ***
Verify Product Added
    Wait Until Page Contains            Added to Cart

Proceed to Checkout
    Click Element                       ${CART_ADD_BUTTON}