*** Settings ***
Documentation   Amazaon landing page
Library         SeleniumLibrary

*** Variables ***
${AMAZON_COPYRIGHT_LABEL} =         © 1996-2023, Amazon.com, Inc. or its affiliates

*** Keywords ***
Navigate To
    Go to       ${BASE_URL.${ENVIRONMENT}}

Verify Page Loaded
    Wait Until Page Contains        ${AMAZON_COPYRIGHT_LABEL}