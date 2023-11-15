Feature: Ejemplo comun en automatizacion

  Background:
    Given url "https://reqres.in/"
    And path "/api/login"
    And request { "email": "eve.holt@reqres.in", "password": "cityslicka" }
    When method post
    Then status 200
    * print response
    * def authToken = response.token

  Scenario: Creando usuario con token
    Given url "https://reqres.in/"
    And path "/api/users"
    And header Autorization = "Bearer "+authToken
    And request {"name": "morpheus","job": "leader"}
    When method post
    Then status 201

  Scenario: Creando usuario con token
    Given url "https://reqres.in/"
    And path "/api/users"
    And header Autorization = "Bearer "+authToken
    And request {"name": "morpheus","job": "leader"}
    When method post
    Then status 201