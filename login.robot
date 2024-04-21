*** Settings ***
Resource    variables.robot
Resource     keywords.robot



*** Test Cases ***
Login successfully
    [Tags]      login
    Open Url     ${baseUrl} 
    Login valide     ${login}    ${password} 