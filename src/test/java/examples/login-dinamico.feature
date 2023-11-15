Feature: Inicio de Sesion dinamico

  @login
  Scenario: Generar Token
    Given url urlBase
    And path "/api/login"
    And request { "email": #email, "password": #password }
    When method post
    Then status 200
    * print response
    * def authToken = response.token