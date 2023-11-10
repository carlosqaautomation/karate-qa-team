Feature: Practica

  @CP11
  Scenario: Ejercicio1-Actualizar usuario patch
    Given url "https://reqres.in"
    * def id = 2
    And path "/api/users/" +  id
    And request
      """
        { name: 'morpheus',job: 'zion resident'
        }
      """
    When method patch
    Then status 200
    And match response.name == "morpheus"

  @CP12
  Scenario: Ejercicio2 -Actualizar usuario patch
    Given url "https://reqres.in"
    * def id = 2
    And path "/api/users/" +  id
    And request read("ejercicio2.json")
    When method patch
    Then status 200
    And match response.name == "morpheus"
    And match response.job == "zion resident"

  @CP13
  Scenario: Ejercicio3 -Actualizar usuario put
    Given url "https://reqres.in"
    * def id = 2
    And path "/api/users/" +  id
    And request read("ejercicio2.json")
    When method put
    Then status 200
    And match response.name == "morpheus"
    And match response.job == "zion resident"