*** Settings ***
Library         SeleniumLibrary
Resource        variables.robot
Resource        keywords.robot


*** Variables ***
${BASE_URL}   https://ecommerce-playground.lambdatest.io/index.php?route=account/forgotten
${EMAIL}       med@test.com
${NON_REGISTERED_EMAIL}    email@nonenregistre.com

*** Test Cases ***
Mot de pass oublié
    Open Browser    ${BASE_URL}    chrome
    Title Should Be    Forgot Your Password?
    Input Text        //input[@id='input-email']   ${EMAIL}   
    Click Button      //button[normalize-space()='Continue']
    Page Should Contain    An email with a confirmation link has been sent your email address.
    







Réinitialisation du mot de passe avec email non enregistré
    Open Browser    ${BASE_URL}    chrome
    Title Should Be    Forgot Your Password?
    Input Text        //input[@id='input-email']    ${NON_REGISTERED_EMAIL}  
    Click Button      //button[normalize-space()='Continue']
    Page Should Contain   Warning: The E-Mail Address was not found in our records, please try again!
  

Réinitialisation du mot de passe sans saisir ladresse email
    Open Browser    ${BASE_URL}    chrome
    Title Should Be    Forgot Your Password?
    Click Button      //button[normalize-space()='Continue']
    Page Should Contain    The E-Mail Address was not found in our records, please try again!
  