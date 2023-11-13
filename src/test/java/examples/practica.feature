Feature: Ejemplos practicos Karate

  @CP01
  Scenario: Listado de comentarios
    Given url "https://jsonplaceholder.typicode.com"
    And path "/comments"
    When method get
    Then status 200
    And match responseType == "json"

  @CP02
  Scenario: Listado de comentario especifico
    Given url "https://jsonplaceholder.typicode.com"
    And path "comments/2"
    When method get
    Then status 200
    And match responseType == "json"
    And match response.id == 2

  @CP03
  Scenario: Listado de usuarios
    Given url "https://reqres.in"
    And path "api/users"
    When method get
    Then status 200
    And match response.data[4].first_name == "Charles"
    And match response.data[4].id == 5
    * print response.data[4]

  @CP04
  Scenario: Listado de comentario especifico v2
    * def id = 10
    Given url "https://jsonplaceholder.typicode.com"
    And path "comments/" + id
    When method get
    Then status 200
    And match responseType == "json"
    And match response.id == id

  @CP05
  Scenario: Crear un post - 1
    Given url "https://jsonplaceholder.typicode.com"
    And path "posts"
    And request { title: 'foo',body: 'bar',userId: 1 }
    When method post
    Then status 201
    And match response.title == "foo"
    And match response.body == "bar"
    And match response.userId == 1

  @CP06
  Scenario: Crear un post con docString
    Given url "https://jsonplaceholder.typicode.com"
    And path "posts"
    And request
      """
        {
          title: 'foo',
          body: 'bar',
          userId: 1
        }
      """
    When method post
    Then status 201
    And match response.title == "foo"
    And match response.body == "bar"
    And match response.userId == 1

  @CP07
  Scenario: Crear un post con docString en variable
    * def body =
    """
      { title: 'foo',body: 'bar', userId: 1}
    """
    Given url "https://jsonplaceholder.typicode.com"
    And path "posts"
    And request body
    When method post
    Then status 201
    And match response.title == "foo"
    And match response.body == "bar"
    And match response.userId == 1

  @CP08
  Scenario: Crear un post con un archivo JSON
    Given url "https://jsonplaceholder.typicode.com"
    And path "posts"
    And request read("example.json")
    When method post
    Then status 201
    And match response.title == "foo"
    And match response.body == "bar"
    And match response.userId == 1

  @CP09
  Scenario: Login con form field
    Given url "https://reqres.in"
    And path "/api/login"
    And form field email = "eve.holt@reqres.in"
    And form field password = "cityslicka"
    When method post
    Then status 200
    And match response.token == "#notnull"

  @CP10
  Scenario: Filtro de usuarios
    Given url "https://reqres.in"
    And path "api/users"
    And param delay = 3
    When method get
    Then status 200

  @CP11
  Scenario: Metodo actualizar con request
    Given url "https://reqres.in"
    And path "api/users/2"
    And request
      """
        {
          name: 'morpheus',
          job: 'zion resident'
        }
      """
    When method patch
    Then status 200
    And match response.name == 'morpheus'
    And match response.job == 'zion resident'

  @CP12
  Scenario: Metodo actualizar con form field
    Given url "https://reqres.in"
    And path "api/users/2"
    And form field name = 'morpheus'
    And form field job = 'zion resident'
    When method patch
    Then status 200
    And match response.name == 'morpheus'
    And match response.job == 'zion resident'

  @CP12
  Scenario: Metodo get usuario no encontrado
    Given url "https://reqres.in"
    And path "api/users/23"
    When method get
    Then status 404

@CP13
  Scenario Outline: crear usuario con csv
    Given  url "https://reqres.in"
    And path "/api/users"
    And request {name: '#(name)', job:'#(job)'}
    When method post
    Then status 201

    Examples:
       |read ('usuarios.csv')|




