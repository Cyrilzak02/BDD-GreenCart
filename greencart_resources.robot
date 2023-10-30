*** Settings ***
Library     SeleniumLibrary
Library     String
Library    XML
Library    Screenshot

#Lopes :http://localhost:8080/greencart/Login_test.php 
#Baduy: http://localhost/Greencart/GreenCart/GreenCart/login_test.php 
#Clovis:http://localhost:8080/greencart/login_test.php 
#Cyril:http://localhost/GreenCartGit/GreenCart/Login_test.php

*** Variables ***
${BROWSER}          chrome
${URL}              http://localhost/GreenCartGit/GreenCart/Login_test.php                    
${balanceBefore}    ${EMPTY}
${string_length}    ${EMPTY}
${balance-after}    ${EMPTY}
${i}                ${EMPTY}
${valor-antes}      ${EMPTY}
${dinheiro}         ${EMPTY}

${valor-depois}      ${EMPTY}
${valor_antes_float}  ${EMPTY}
${valor_depois_float}
${conta_excluir}    exp@gmail.com                        #cyrigilorganico@gmail.com
${senha_excluir}    Joao12345@
${conta_excluida}   Conta excluida
${senha_excluida}   Senha  excluida
*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window
    


Clicar no cadastro produtor

     Click Element    css:a[href="Cadastro_produtor.php"]
 


Preencher informacoes produtor com nome empresa "${nome_empresa}" , email "${email}",telefone "${number}" ,cnpj "${CNPJ}" , senha "${password}" ,senha confirmacao "${confirmPassword}",insta "${instagram_prod}"

        Input Text    locator=nome_empresa        text= ${nome_empresa}
        Input Text    locator=email       text=${email}
        Input Text    locator=number       text=${number}
        Input Text    locator=CNPJ    text=${CNPJ}
        Input Text    locator=password     text=${password}
        Input Text    locator=confirmPassword     text=${confirmPassword}
        Input Text    locator=instagram_prod     text=${instagram_prod}
        
        Submit Form
        
        
mensagem de erro deve estar presente no campo email
       Location Should Be    http://localhost/GreenCartGit/GreenCart/Cadastro_produtor.php            #Lopes :http://localhost:8080/greencart/Cadastro_Produtor.php
        Element Should Be Visible    locator=error-email        

        


mensagem de erro deve estar presente no campo celular
       Location Should Be    http://localhost/GreenCartGit/GreenCart/Cadastro_produtor.php              #Lopes :http://localhost:8080/greencart/Cadastro_Produtor.php
       Element Should Be Visible    locator=error-phone
       Take Screenshot

mensagem de erro deve estar presente no campo CNPJ
        Location Should Be    http://localhost/GreenCartGit/GreenCart/Cadastro_produtor.php                    #Lopes :http://localhost:8080/greencart/Cadastro_Produtor.php
        Element Should Be Visible    locator=error-cnpj 
        Take Screenshot

mensagem de erro deve estar presente no campo senha
        Location Should Be    http://localhost/GreenCartGit/GreenCart/Cadastro_produtor.php                    #Lopes :http://localhost:8080/greencart/Cadastro_Produtor.php
        Element Should Be Visible    locator=error-password
        Take Screenshot

Fechar o navegador
    
    Capture Page Screenshot
    Close Browser

o usuario acessa a home page do site GreenCart
    Go To    url=${URL}

Preencher informacoes de login de comprador com login = "${login}" e senha = "${senha}"

        Input Text    locator=login        text=${login}
        Input Text    locator=senha       text=${senha}
        Submit Form
                     #Lopes: http://localhost:8080/greencart/index.php
        Location Should Be         http://localhost/GreenCartGit/GreenCart/index.php                        #Lopes: http://localhost:8080/greencart/index.php , Cyril:http://localhost/GreenCartGit/GreenCart/index.php


Preencher informacoes de login de produtor com login = "${login}" e senha = "${senha}"

        Input Text    locator=login        text=${login}
        Input Text    locator=senha       text=${senha}
        Submit Form

          Location Should Be        http://localhost/GreenCartGit/GreenCart/index.php                           #Lopes:http://localhost:8080/greencart/index.php

Clicar no icone de usuario

    Click Element    css:a[href="User.php"]


Clicar no botao de visualizar compras

     Click Element    locator=Registrar Produto



Clicar na pagina de produtos
    Click Element     css:a[href="produtos.php"]

Clicar no botao de comprar produto
     Execute javascript  document.body.style.zoom="70%"
    Click Element   css:button[class="comprar-botao"]
    Sleep    5

Clicar no botao de editar perfil

    Click Element     locator=Edit Profile
    Click Element     css:button[class="edit-btn"]

Preencher primeiro nome com "${first_name}"
    Input Text       locator=first_name        text=${first_name} 
    Submit Form
    
a mensagem de erro deve estar presente no campo primeiro nome
        Location Should Be    http://localhost/GreenCartGit/GreenCart/Info_User.php                  #Lopes :http://localhost:8080/greencart/Info_User.php
        Element Should Be Visible    locator=error-name
        Take Screenshot
    
Clicar em registrar produto
    Click Button    locator=Registrar Produto

Prencher informações do produto com nome_produto = "${nome_produto}" , qtd_produto = "${qtd_produto}" , descricao_produto ="${descricao_produto}" , preco_produto = "${preco_produto}" , data_colheta = "${data_colheta}"
    Input Text    locator=nome_produto        text= ${nome_produto}
    Input Text    locator=qtd_produto      text= ${qtd_produto}
    Input Text    locator=descricao_produto       text= ${descricao_produto}
    Input Text    locator=preco_produto  text=${preco_produto}
    Input Text    locator=data_colheta     text= ${data_colheta}
    Press Key    id=nome_produto    \\13

uma mensagem de erro sobre a data inválida preenchida deve ser visível
    Take Screenshot
Clicar no cadastro comprador

   Click Element    css:a[href="Cadastro_test.php"]

Preencher informacoes comprador com first_name = "${first_name}" , last_name = "${last_name}" , email = "${email}" , phone = "${phone}" , password = "${password}" , confirmPassword = "${confirmPassword}" , gender = "${gender}"

        Input Text    locator=first_name        text=${first_name} 
        Input Text    locator=last_name       text=${last_name}
        Input Text    locator=email    text=${email}
        Input Text    locator=phone     text=${phone}
        Input Text    locator=password     text=${password}
        Input Text    locator=confirmPassword     text=${confirmPassword}
        Select Radio Button    group_name=gender    value=${gender}
        Submit Form
        
        
a mensagem de erro deve estar presente no campo do primeiro nome 
        Location Should Be    http://localhost/GreenCartGit/GreenCart/Cadastro_test.php          #http://localhost/GreenCart/Cadastro_test.php  clovis
        Element Should Be Visible    locator=error-name
        Take Screenshot

Clicar no cadastro usuario

     Click Element    css:a[href="Cadastro_test.php"]

a mensagem de erro deve estar presente no campo do sobrenome
        
        Location Should Be    http://localhost/GreenCartGit/GreenCart/Cadastro_test.php           #http://localhost/GreenCart/Cadastro_test.php  clovis
        Element Should Be Visible    locator=error-last-name      
        Take Screenshot
Clicar no cadastro cliente

     Click Element    css:a[href="Cadastro_test.php"]

a mensagem de erro deve estar presente no campo do email
        Location Should Be    http://localhost/GreenCartGit/GreenCart/Cadastro_test.php          #http://localhost/GreenCart/Cadastro_test.php  clovis
        Element Should Be Visible    locator=error-email
        Take Screenshot
Clicar no cadastro cliente2

     Click Element    css:a[href="Cadastro_test.php"]
a mensagem de erro deve estar presente no campo de confirmar senha
        Location Should Be    http://localhost/GreenCartGit/GreenCart/Cadastro_test.php
        Element Should Be Visible    locator=error-confirmPassword
        Take Screenshot

a mensagem de erro deve estar presente no campo do telefone
        Location Should Be    http://localhost/GreenCartGit/GreenCart/Cadastro_test.php            #http://localhost/GreenCart/Cadastro_test.php  clovis
        Element Should Be Visible    locator=error-phone 
        Take Screenshot

a mensagem de erro deve estar presente no campo de quantidade
        Location Should Be    http://localhost/GreenCartGit/GreenCart/produtos.php
        Take Screenshot

Preencher quantidade suficiente para saldo insuficiente
    Input Text    locator=qtd_produto    text=10

Clicar em cadastro de comprador
    Click Element    css:a[href="Cadastro_test.php"]



Clicar no botao de Comprar na aba de produto
    Click Element     css:button[class="comprar-botao"]

Preencher quantidade de produto com qtd_produto = "${qtd_produto}"
    Input Text    locator=qtd_produto    text=${qtd_produto}

Clicar em comprar produto
    Click Button    Comprar
    

Preencher Login com conta a ser excluida
    Input Text  locator=login  text=${conta_excluir}
    Input Text  locator=senha  text=${senha_excluir}
    Submit Form
    ${message} =  Handle Alert    ACCEPT
    Log To Console     ${message}

Preencher Login com conta excluida
    Input Text   locator=login   text=${conta_excluida}
    Input Text   locator=senha   text=${senha_excluida}
    Submit Form

Editar perfil
   Click Button    //*[@id="home"]/div[1]/div/button[1]

Excluir perfil
  Click Button    //*[@id="home"]/table/tbody/tr[5]/td/button[1]
  Alert Should Be Present     action=ACCEPT

Aceitar alert
  ${message}=   Handle Alert    ACCEPT
  

  Log To Console    ${message}
  
  