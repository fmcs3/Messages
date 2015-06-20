Feature: Login

  Usuário deverá fornecer login e senha para poder acessar o sistema
  O sistema deverá cuidar das novas sessões, das atuais e encerrar as antigas.


  Scenario: Singup
    Given The email "fillipe@yahoo.com.br" is not used by an user
    And I am at the singup Page
    When I fill first_name with "Fillipe"
    And I fill last_name with "De Menezes"
    And I fill email with "fillipe@yahoo.com.br"
    And I fill password with "1234567"
    And I click create user button
    Then I should be at root page

  Scenario: Login
    Given I have an user with email "fillipe@yahoo.com.br" is registred on the system
    And I am at the Login Page
    When I fill email field with "fillipe@yahoo.com.br"
    And I fill the password field with "1234567"
    And I click the Button "Login"
    Then I should be logged in with email "fillipe@yahoo.com.br"