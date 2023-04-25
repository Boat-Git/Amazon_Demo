*** Settings ***
Documentation   Amazaon sign in page
Library         SeleniumLibrary

*** Variables ***
${SIGIN_TITLE_PAGE} =               Amazon Sign-In
${SIGIN_HEADER_LABEL} =             Sign in
${SIGIN_EMAIL_TEXTBOX} =            //*[@id="ap_email"]
${SIGIN_CONTINUE_BUTTON} =          //*[@id="continue"]

*** Keywords ***
Verify Page Loaded
    Title Should Be                 ${SIGIN_TITLE_PAGE}
    Wait Until Page Contains        ${SIGIN_HEADER_LABEL}

Enter Credentials
    [Arguments]  ${Credentials}
    Run Keyword If  '${Credentials[0]}' != '#BLANK'  Input Text    ${SIGIN_EMAIL_TEXTBOX}  ${Credentials[0]}

Click "Continue" Button
    Click Element  ${SIGIN_CONTINUE_BUTTON}

Verify Error Message
    [Arguments]  ${Credentials}
    Wait Until Page Contains        ${Credentials[1]}