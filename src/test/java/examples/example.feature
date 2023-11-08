Feature: Ejemplos QA Team
  
  Scenario: Caso 1 - lista de usuarios
    Given url "https://reqres.in/"
    And path "api/users"
    When method get
    Then status 201