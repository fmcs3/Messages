Feature: Messages

  Dado que o usuário está logado o mesmo pode ler as mensagens dos outros usuários
  e postar suas proprias messagens, podendo deletar, atualizar as suas messagens.

com
  Scenario: User adds a new message to the system
    Given I am already logged in
    And I am at the messages page
    When I click the button "New Message"
    Then I should be at the news message page
    When I fill the title with "Amazing Application"
    And I fill the text with "This application is super cool e and very..."
    And I click create button
    Then I should be at the messages page
    And I should see a notice with "Message was successfully created."