Feature: Aplicando lo aprendido

  @CP01
  Scenario: Ejercicio 1
    Given url "https://reqres.in"
    And path "api/users/2"
    And form field name = "morpheus"
    And form field job = "zion resident"
    When method put
    Then status 200
    And match response.name == "morpheus"
    And match response.job == "zion resident"


  @CP02
  Scenario: Ejercicio 2
    * def body =
    """
      { "name": "morpheus", "job": "zion resident"}
    """
    Given url "https://reqres.in"
    And path "api/users/2"
    And request body
    When method patch
    Then status 200
    And match response.name == "morpheus"
    And match response.job == "zion resident"

  @CP03
  Scenario: Ejercicio 3
    Given url "https://reqres.in"
    And path "api/users/2"
    And request read("ejercicio.json")
    When method put
    Then status 200
    And match response.name == "morpheus"
    And match response.job == "zion resident"