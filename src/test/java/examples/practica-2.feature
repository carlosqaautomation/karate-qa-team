Feature: Practica Data-Driven Testing

  Scenario: Creando usuario con token
    * def response = call read('classpath:examples/login.feature@login')
    Given url urlBase
    And path "/api/users"
    And header Autorization = "Bearer "+response.authToken
    And request { "name": "morpheus", "job": "leader" }
    When method post
    Then status 201