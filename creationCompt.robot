*** Settings ***
Library         SeleniumLibrary
Resource        variables.robot
Resource        keywords.robot





*** Test Cases ***
Creation de compte  
     CreationCompte 
  
 

Création de compte avec un email déjà utilisé
    CreationCompte avec email deja utilisé



Création de compte sans remplir le champs téléphone
     Création de compte sans remplir le champs téléphone