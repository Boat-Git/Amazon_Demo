*** Settings ***
Library         SeleniumLibrary
Resource        C:/Users/Natth/RF_Projects/Amazon/Data/InputData.robot

*** Variables ***
${SEARCHRESULTS_FIRST_PRODUCT_IMG} =    //*[@id="search"]/div[1]/div[1]/div/span[1]/div[1]/div[3]/div/div/div/div/div[1]/span/a/div/img
${SEARCHRESULTS_FIRST_PRODUCT_LINK} =   //*[@id="search"]/div[1]/div[1]/div/span[1]/div[1]/div[3]/div/div/div/div/div[2]/div[1]/h2

*** Keywords ***
Verify Result Completed
    Wait Until Page Contains        results for "${SEARCH_TERM}"

Click On Product Link
    [Documentation]                 Clicks on the first product in the search results list
    ${SELECTED_PRODUCT} =           get text  ${SEARCHRESULTS_FIRST_PRODUCT_LINK}  
    Click Element                   ${SEARCHRESULTS_FIRST_PRODUCT_IMG}
    [Return]  ${SELECTED_PRODUCT}