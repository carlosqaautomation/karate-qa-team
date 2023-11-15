Feature: Casos de prueba con escenario outline

  @CP1
  Scenario Outline: Creando usuario con token del id # <id> con nombre <name>
    Given url urlBase
    And path "/api/users"
    And request { "name": "<name>", "job": "<job>" }
    When method post
    Then status <status>
    Examples:
      | id | name   | job         | status |
      | 1  | Yazmin | Analista QA | 201    |
      | 2  | Carmen | Analista QA | 201    |
      | 3  | $$$$$  | Analista QA | 201    |

  @CP2
  Scenario Outline: Crear un post - 1
    Given url "https://jsonplaceholder.typicode.com"
    And path "posts"
    And request { title: '<title>',body: '<body>',userId: <userId> }
    When method post
    Then status <status>
    And match response.title == "<title>"
    And match response.body == "<body>"
    And match response.userId == <userId>

    Examples:
      | title | body | userId | status |
      | foo   | bar  | 1      | 201    |
      | boo   | sal  | 2      | 201    |