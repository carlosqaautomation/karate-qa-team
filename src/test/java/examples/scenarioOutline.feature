Feature: Casos de prueba con escenario outline

  Scenario Outline: Creando usuario con token de <name>
    Given url "https://reqres.in/"
    And path "/api/users"
    And request {"name": "<name>","job": "<job>"}
    When method post
    Then status <status>
    Examples:
    |name     | job         | status  |
    | Yazmin  | Analista QA | 201     |
    | Carmen  | Analista QA | 201     |
    | Daniela | Analista QA | 201     |






    Scenario Outline: Actualizar usuario por <id>
      * def bodyput = read('body2.json')
      * def iduser2 = <id>
      Given url "https://reqres.in"
      And path 'api/users/' + iduser2
      And request bodyput
      When method put
      Then status 200
      Examples:
       |read('usersupdate.csv')|




  Scenario Outline: Actualizar usuario por <id>
    * def body = read('body.json')
    * def iduser = <id>
    Given url "https://reqres.in"
    And path 'api/users/' + iduser
    And request body
    When method put
    Then status 200
    Examples:
    |read('update.csv')|



