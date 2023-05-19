*** Settings ***
Documentation       Use this layer to get data from external files
Library             ${EXECDIR}/CustomLibs/Invalid_Credentials.py

*** Keywords ***
Get CSV Data
    [Arguments]     ${FilePath}
    ${Data} =       read csv file   ${FilePath}
    [Return]        ${Data}