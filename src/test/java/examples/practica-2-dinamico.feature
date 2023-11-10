Feature: Practica Data-Driven Testing

  Background:
    * def response = call read('classpath:examples/login.feature@login') {"email": "eve.holt@reqres.in", "password": "12345678" }
    * def token = response.authToken
    * url "https://reqres.in/"
    * header Autorization = "Bearer "+response.authToken


  @CP1
  Scenario: Creando usuario con token
    Given path "/api/users"
    And request { "name": "morpheus", "job": "leader" }
    When method post
    Then status 201

  @CP2
  Scenario Outline: Crear usuario con CSV
    Given path "/api/users"
    And request { name: '#(name)', job: '#(job)' }
    When method post
    Then status 201

    Examples:
      | read('user.csv') |