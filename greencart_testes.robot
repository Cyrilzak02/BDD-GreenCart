*** Settings ***
Documentation    Essa suíte testa o site da GreenCart
Resource         greencart_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - Cadastro Produtor sem email
         [Documentation]     Verifica que o sistema mostra uma mensagem de erro na caixa de email e nao deixa o usuario se cadastrar
		 
         Given o usuario acessa a home page do site GreenCart
         When Clicar no cadastro produtor
		 And Preencher informacoes produtor com nome empresa "Wagner E Co" , email "",telefone "4192882882" ,cnpj "77223303000106" , senha "Wagner@123" ,senha confirmacao "Wagner@123",insta "Wagner123"
         Then mensagem de erro deve estar presente no campo email

Caso de Teste 02 - Cadastro Produtor sem celular
         [Documentation]     Verifica que o sistema mostra uma mensagem de erro na caixa de celular e nao deixa o usuario se cadastrar
         Given o usuario acessa a home page do site GreenCart
         When Clicar no cadastro produtor
         And Preencher informacoes produtor com nome empresa "Wagner E Co" , email "wagner23@gmail.com",telefone "" ,cnpj "77223303000106" , senha "Wagner@123" ,senha confirmacao "Wagner@123",insta "Wagner123"
         Then mensagem de erro deve estar presente no campo celular
Caso de Teste 03 - Cadastro Produtor sem cnpj
         [Documentation]     Verifica que o sistema mostra uma mensagem de erro na caixa de CNPJ e nao deixa o usuario se cadastrar
         Given o usuario acessa a home page do site GreenCart
         When Clicar no cadastro produtor
         And Preencher informacoes produtor com nome empresa "Wagner E Co" , email "wagner23@gmail.com",telefone "4192882882" ,cnpj "" , senha "Wagner@123" ,senha confirmacao "Wagner@123",insta "Wagner123"
         Then mensagem de erro deve estar presente no campo CNPJ

Caso de Teste 04 - Cadastro Produtor sem senha
         [Documentation]     Verifica que o sistema mostra uma mensagem de erro na caixa de senha e nao deixa o usuario se cadastrar
         Given o usuario acessa a home page do site GreenCart
         When Clicar no cadastro produtor
         And Preencher informacoes produtor com nome empresa "Wagner E Co" , email "wagner23@gmail.com",telefone "4192882882" ,cnpj "77223303000106" , senha "" ,senha confirmacao "Wagner@123",insta "Wagner123"
         Then mensagem de erro deve estar presente no campo senha

Caso de Teste 05 - Editar perfil preenchendo nome com caracteres especiais
         [Documentation]     Verifica que o sistema mostra uma mensagem de erro na caixa de senha e não deixa o usuário editar o nome utilizando caracteres especiais
         Given o usuario acessa a home page do site GreenCart
         When Preencher informacoes de login de comprador com login = "robotest@gmail.com" e senha = "Robot123@"
         And Clicar no icone de usuario
         And Clicar no botao de editar perfil
         And Preencher primeiro nome com "$%¨&*¨%%"
		 Then a mensagem de erro deve estar presente no campo primeiro nome
		 


Caso de Teste 06 - Cadastrar produto com data de colheita inválida
         [Documentation]     Verifica que o sistema mostra uma mensagem de erro ao inserir uma data de colheita inválida
         Acessar a home page do site GreenCart
         Preencher informacoes de login de produtor
         Clicar no icone de usuario
         Clicar em registrar produto
        Prencher informações do produto com data de colheita invalida


Caso de Teste 07 - Cadastrar comprador sem primeiro nome
         [Documentation]     Verifica que o sistema mostra uma mensagem de erro ao não inserir um primeiro nome
         Given o usuario acessa a home page do site GreenCart
         When Clicar no cadastro comprador
         And Preencher informacoes comprador com first_name = "" , last_name = "Neto" , email = "salsa@salsa.com" , phone = "4199670061" , password = "Wagner@123" , confirmPassword = "Wagner@123" , gender = "male"
         Then a mensagem de erro deve estar presente no campo do primeiro nome
Caso de Teste 08 - Cadastrar usuario sem sobrenome
         [Documentation]     Verifica que o sistema mostra uma mensagem de erro ao não inserir sobrenome
         Given o usuario acessa a home page do site GreenCart
         When Clicar no cadastro comprador
         And Preencher informacoes comprador com first_name = "Clovis" , last_name = "" , email = "salsa@salsa.com" , phone = "4199670061" , password = "Wagner@123" , confirmPassword = "Wagner@123" , gender = "male"
         Then a mensagem de erro deve estar presente no campo do sobrenome

Caso de Teste 09 - Cadastrar cliente sem email
         [Documentation]     Verifica que o sistema mostra uma mensagem de erro ao não inserir um email
         Given o usuario acessa a home page do site GreenCart
         When Clicar no cadastro comprador
         And Preencher informacoes comprador com first_name = "Clovis" , last_name = "Neto" , email = "" , phone = "4199670061" , password = "Wagner@123" , confirmPassword = "Wagner@123" , gender = "male"
         Then a mensagem de erro deve estar presente no campo do email

Caso de Teste 10 - Cadastrar cliente2 sem telefone
         [Documentation]     Verifica que o sistema mostra uma mensagem de erro ao não inserir um telefone
         Given o usuario acessa a home page do site GreenCart
         When Clicar no cadastro comprador
         And Preencher informacoes comprador com first_name = "Clovis" , last_name = "Neto" , email = "salsa@salsa.com" , phone = "" , password = "Wagner@123" , confirmPassword = "Wagner@123" , gender = "male"
         Then a mensagem de erro deve estar presente no campo do telefone
Caso de teste 11 - Comprar mais produtos do que os existentes
        [Documentation]    Verifica que o sistema mostra uma mensagem de erro ao tentar realizar a compra de mais produtos do que o ofertado e impedindo a compra
        Acessar a home page do site GreenCart
        Preencher informacoes de login de comprador
        Clicar na pagina de produtos
        Clicar no botao de Comprar na aba de produto
        Preencher quantidade de produto
        Clicar em comprar produto

Caso de teste 12 - Cadastro de Comprador com campos senha e confirmar senhas diferentes
        [Documentation]    Verifica que o sistema mostra uma mensagem de erro ao tentar realizar o cadastro inserindo senhas diferentes na aba de cadastro e impede a realização do cadastro
        Acessar a home page do site GreenCart
        Clicar em cadastro de comprador
        Preencher informacoes de cadastro de comprador

Caso de Teste 13 - Excluir Perfil do Usuario
        [Documentation]    Verifica que é possivel excluir a conta do sistema
        Acessar a home page do site GreenCart
        Preencher informacoes de login de produtor
        Clicar no icone de usuario
        Editar perfil
        Excluir perfil
        Aceitar alert

Caso de Teste 14 - Efetuar Login com uma conta excluida
        [Documentation]    Verifica que se é possivel fazer login no site, mesmo após excluir a conta do sistema
        Acessar a home page do site GreenCart
        Preencher Login com conta a ser excluida