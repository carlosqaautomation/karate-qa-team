Feature: Inicio de Sesion

  @login
  Scenario: Generar token
    Given url urlBase
    And path "/api/login"
    And request { "email": #(correo), "password": #(contra) }
    When method post
    Then status 200
    * print response
    * def authToken = response.token