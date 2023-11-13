Feature:  Login de sesion
  @login
  Scenario: Generar token
    Given url "https://reqres.in/"
    And path '/api/login'
    #And request { "email": #(email), "password": #(password)}
    And request {"email": "eve.holt@reqres.in","password": "cityslicka"}
    When method post
    Then status 200
    * print response
    * def Authtoken = response.token

