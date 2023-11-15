Feature: Ejemplos QA Team
  
  Scenario: Caso 1 - lista de usuarios
    Given url urlBase
    And path "api/users"
    When method get
    Then status 201