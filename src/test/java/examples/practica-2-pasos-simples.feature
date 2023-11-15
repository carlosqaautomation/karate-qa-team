Feature: Ejemplo comun en automatizacion

  Background:
    Given url urlBase
    And path "/api/login"
    And request { "email": "eve.holt@reqres.in", "password": "cityslicka" }
    When method post
    Then status 200
    * print response
    * def authToken = response.token

  Scenario: Creando usuario con token
    And path "/api/users"
    And request {"name": "morpheus","job": "leader"}
    When method post
    Then status 201


  Scenario: Creando usuario con token
    And path "/api/users"
    And header Autorization = "Bearer "+authToken
    And request {"name": "morpheus","job": "leader"}
    When method post
    Then status 201