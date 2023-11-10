Feature: Practica data driven testing

  Background:
    * def response = call read('classpath:examples/login.feature@login') {"correo": "eve.holt@reqres.in","clave": "12345678"}
    * def token = response.authToken
    * url "https://reqres.in/"
    * header Autorization = "Bearer " +token

Scenario:  Creando usuario con token Probar un servicio que primero se autentique y con ese token consumir el sig servicio

  Given path "/api/users"
  And request {"name": "morpheus","job": "leader"}
  When method post
  Then status 201


  Scenario Outline: Crear usuario con CSV

    Given path "/api/users"
    And request {"name": #(name),"job": #(job)}
    When method post
    Then status 201

    Examples:
      |read('user.csv') |