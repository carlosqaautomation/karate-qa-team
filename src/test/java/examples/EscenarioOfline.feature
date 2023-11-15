Feature:  escenario ofline

  @practica1
  Scenario Outline: crear usuario con csv
    Given url "https://reqres.in/"
    And path "/api/users"
    And request {"name": '<name>', "job":'<job>'}
    When method post
    Then status <status>
    Examples:
      | name   |  | job        |  | status |
      | yazmin |  | analistaqa |  | 201    |
      | carmen |  | analisraqa |  | 201    |

  @practica2
  Scenario Outline: Listado de usuarios
    Given url "https://reqres.in"
    And path "api/users"
    When method get
    Then status <status>
    And match response.data[4].first_name == '<first_name>'
    And match response.data[4].id == <id>
    * print response.data[4]
    Examples:
      | first_name | id | status |
      | Charles    | 5  | 200    |


  @practica3
  Scenario Outline: Listado de usuarios
    Given url "https://reqres.in"
    And path "api/users"
    When method get
    Then status <status>
    And  request first_name == '<first_name>'
    And request id == <id>

    Examples:
      | first_name | id | status |
      | Charles    | 5  | 200    |
      | Michael    | 6  | 200    |