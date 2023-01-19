Feature: pet store api tests

  Scenario: basic test with status code validation
    Given url 'https://petstore.swagger.io/v2/store/inventory'
    When method GET
    Then status 200

  Scenario: header verification
    Given url 'https://petstore.swagger.io/v2/store/inventory'
    When method get
    Then status 200
    And match header Content-Type == 'application/json'
    And match header Connection == 'keep-alive'
    #to verify headers we use header keyword then headername without double or single code
    # and == 'header value'
    And match header Date == '#present'
    And match header Date != '#notpresent'
    #this equals to headers().hasHeaderWithName("headername") in restassured




  Scenario: json body verification
    Given url 'https://petstore.swagger.io/v2/store/inventory'
    When method get
    Then status 200
    And match header Content-Type == 'application/json'
    And print response
    And print response.Available
    #verify base is EUR
    And match response.available == 423
    And match response.Available == '#notpresent'
    And match response.roma == '#notpresent'

#  17:07:56.610 [main] INFO  com.intuit.karate - [print] {
#  "sold": 10,
#  "string": 549,
#  "Fire on work": 1,
#  "pending": 11,
#  "available": 423,
#  "for rent": 1,
#  "qavalible": 1,
#  "qwe": 1
#  }










