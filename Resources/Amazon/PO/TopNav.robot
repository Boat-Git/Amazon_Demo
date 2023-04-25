*** Settings ***
Documentation   Amazon top navigation
Library         SeleniumLibrary

*** Variables ***
${TOPNAV_SEARCH_BAR} =      //*[@id="twotabsearchtextbox"]
${TOPNAV_SEARCH_BUTTON} =       //*[@id="nav-search-submit-button"]
${AMAZON_ACCOUNT_LIST_LINK} =   //*[@id="nav-link-accountList-nav-line-1"]
${AMAZON_SIGNIN_LINK} =         //*[@id="nav-flyout-ya-signin"]/a/span

*** Keywords ***
Hover "Sign In" Link
    Mouse Over                  ${AMAZON_ACCOUNT_LIST_LINK}

Click "Sign In" Link
    Click Element               ${AMAZON_SIGNIN_LINK}

Search for Products
    Enter Search term
    Submit Search

Enter Search term
    Input Text                  ${TOPNAV_SEARCH_BAR}    ${SEARCH_TERM}

Submit Search
    Click Element               ${TOPNAV_SEARCH_BUTTON}