Feature: Inicio de Sesion

  @login
  Scenario: Generar Token
    Given url urlBase
    And path "/api/login"
    And request { "email": "eve.holt@reqres.in", "password": "cityslicka" }
    When method post
    Then status 200
    * print response
    * def authToken = response.token