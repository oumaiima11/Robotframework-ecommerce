*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BASE_URL}    https://ecommerce-playground.lambdatest.io/
${ADD_TO_CART_BUTTON}     //div[@id='entry_216842']//button[@title='Add to Cart'][normalize-space()='Add to Cart']
${UPDATE_CART_BUTTON}    i[class="fas fa-sync-alt"]
${REMOVE_BUTTON}    button[class="btn btn-danger"]

*** Test Cases ***
Ajouter un produit au panier
    Open Browser    ${BASE_URL}    chrome
    Title Should Be    Your Store
    Maximize Browser Window
    Input Text      //div[@id='entry_217822']//input[@placeholder='Search For Products']   HTC Touch HD
    Click Button    //button[normalize-space()='Search']
    Page Should Contain    Search - HTC Touch HD
    Click Element   //a[@id='mz-product-grid-image-28-212469']//div[@class='carousel-item active']//img[@title='HTC Touch HD']
    Click Button    ${ADD_TO_CART_BUTTON}
    Wait Until Element Is Visible    css:a[aria-controls="cart-total-drawer"]
    Click Element    css:a[aria-controls="cart-total-drawer"]
    Click Link    https://ecommerce-playground.lambdatest.io/index.php?route=checkout/cart
    


Modifier la quantité de produit dans le panier
    Open Browser    ${BASE_URL}    chrome
    Title Should Be    Your Store
    Maximize Browser Window
    Input Text      //div[@id='entry_217822']//input[@placeholder='Search For Products']   HTC Touch HD
    Click Button    //button[normalize-space()='Search']
    Page Should Contain    Search - HTC Touch HD
    Click Element   //a[@id='mz-product-grid-image-28-212469']//div[@class='carousel-item active']//img[@title='HTC Touch HD']
    Click Button    ${ADD_TO_CART_BUTTON}
    Wait Until Element Is Visible    css:a[aria-controls="cart-total-drawer"]
    Click Element    css:a[aria-controls="cart-total-drawer"]
    Click Link    https://ecommerce-playground.lambdatest.io/index.php?route=checkout/cart
    Clear Element Text  name="quantity[53597]"
    Input Text    //input[@name='quantity[53555]']   5
    Click Element    //i[@class='fas fa-sync-alt']
    Page Should Contain    Success: You have modified your shopping cart!
   




Supprimer un produit du panier
    [Documentation]    Remove a product from the cart
    Open Browser    ${BASE_URL}    chrome
    Title Should Be    Your Store
   Input Text      //div[@id='entry_217822']//input[@placeholder='Search For Products']   HTC Touch HD
    Click Button    //button[normalize-space()='Search']
    Page Should Contain    Search - HTC Touch HD
    Click Element    id:entry_212469 > .row > :nth-child(1)
    Click Button    ${ADD_TO_CART_BUTTON}
    Page Should Contain    Success: You have added
    Go To    https://ecommerce-playground.lambdatest.io/index.php?route=checkout/cart
    Click Element    ${REMOVE_BUTTON}
    Page Should Contain    Success: You have modified your shopping cart!
    Page Should Contain    Your shopping cart is empty!
    [Teardown]    Close All Browsers