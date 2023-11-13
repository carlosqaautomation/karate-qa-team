Feature: Practica usando el token
  Background
    * def response = call read ('classpath: examples/login.feature@login)
    * def token = response.Authtoken
    * url "https://reqres.in/"
    * header Authorization = "Bearer"+token

    Scenario: Creando usuario de token
      Given url "https://reqres.in/"
      And path  "/api/users"
        And request {name:'#(morpheus)', job:'#(leader)'}
        When method post
        Then status 201
      * print response




