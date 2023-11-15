Feature: Casos de prueba con Escenario Outline


  Scenario Outline: Creando usuario con token del id # <id> con nombre <name>
    Given url "https://reqres.in/"
    And path "/api/users/"
    And request {"name": <name>,"job": <job>}
    When method post
    Then status <status>
    Examples:
      | id | name   | job                | status |
      | 1  | jazmin | Analista QA        | 201    |
      | 2  | Carmen | Analista QA Senior | 201    |
      | 3  | liseth | Analista QA        | 201    |


  Scenario Outline: Login usuario <namecase>
    Given url UrlBase
    And path "/api/login"
    And form field email = "<email>"
    And form field password = "<password>"
    When method post
    Then status <status>
    #And match response.token == "<expression>"

    Examples:
      | email              | password   | status | expression | namecase |
      | eve.holt@reqres.in | cityslicka | 200    | #notnull   | Exitoso  |
      | prueba@reqres.in   | pass       | 400    | #notnull   | Fallido  |