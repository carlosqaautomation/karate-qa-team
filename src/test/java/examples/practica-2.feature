Feature: Practica Data Driven Testing

  Background:
    * def response = call read('classpath:examples/login.feature@login')
    * def token = response.authToken
    * url "https://reqres.in"
    * header Autorization = "Bearer " + response

    @CP1
  Scenario:Crear usuario con token
    And path "/api/users"
    And request {"name":"morpheus","job": "leader"}
    When method post
    Then status 201

    @CP2
  Scenario Outline:Crear usuario con token con CSV - <name>
    Given path "/api/users"
    And request { name: <name> ,job: <job>}
    When method post
    Then status 201

  Examples:
      | read('user.csv') |