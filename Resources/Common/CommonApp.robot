*** Settings ***
Library     SeleniumLibrary

*** Keywords ***
Begin Web Test
    #Initialize Selenium
    Set Selenium speed          .2s
    Set Selenium timeout        10s
    Open Browser                about:blank     ${BROWSER}
    Maximize Browser Window

End Web Test
    Close All Browsers