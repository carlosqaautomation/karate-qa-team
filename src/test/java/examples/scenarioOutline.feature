Feature: Casos de prueba con escenario outline

  Scenario Outline: Creando usuario con token de <id> - <name>
    Given url urlBase
    And path "/api/users"
    And request {"name": "<name>","job": "<job>"}
    When method post
    Then status <status>
    Examples:
      | id | name    | job         | status |
      | 1  | Yazmin  | Analista QA | 201    |
      | 2  | Carmen  | Analista QA | 201    |
      | 3  | Lisseth | Analista QA | 201    |