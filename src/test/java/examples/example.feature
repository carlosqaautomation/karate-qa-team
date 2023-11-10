Feature: Ejemplos QA Team
  
  Scenario: Caso 1 - lista de usuarios
    Given url "https://reqres.in/"
    And path "api/users"
    When method get
    Then status 200

  @CP01
  Scenario: Listado de comentarios
    Given url "https://jsonplaceholder.typicode.com"
    And path "/comments"
    When method get
    Then status 200
    And match responseType == "json"

  Scenario: Listado de comentario especifico
    Given url "https://jsonplaceholder.typicode.com"
    And path "comments/2"
    When method get
    Then status 200
    And match responseType == "json"
    And match response.id == 2

  Scenario: Actualizar usuario
    Given url "https://reqres.in"
    And path "api/users/2"
    And request
      """
       {
          name: "morpheus",
          job: "zion resident"
        }
      """
    When method put
    Then status 200
    And match response.name == "morpheus"
    And match response.job == "zion resident"