Feature: Transaction Request
  AS A Transaction Manager
  I WANT TO be able to retrieve all transactions for an account number
  SO THAT the transaction data can be retrieved for the user

  Background:
    * headers { Content-Type: 'application/json' }
    * url 'http://localhost:8082/banking-transaction-service'
    * path '/v1/transactions'

  Scenario: Retrieve transactions for a specific account number
    Given param accountNumber = '14523456657'
    When method GET
    Then status 200
    And match response.transactions[0].accountNumber == '14523456657'
    And match response.transactions[0].transactionId == 'TXN1234567890'
    And match response.transactions[0].amount == 1135.32
    And match response.transactions[0].currency == 'EUR'
    And match response.transactions[0].dateTime == '2023-09-25T03:45:00'
    And match response.transactions[0].transactionType == 'WITHDRAWAL'
    And match response.transactions[0].description == 'ATM withdrawal at downtown branch'
    And match response.transactions == '#[1]'

  Scenario: Retrieve several transactions for a specific account number
    Given param accountNumber = '987654321'
    When method GET
    Then status 200
    And match each response.transactions[*].accountNumber == '987654321'
    And match response.transactions == '#[2]'

  Scenario: Request for an account number that does not exist in database
    Given param accountNumber = '111222333'
    When method GET
    Then status 404
    And match response.message == 'No transactions found for this account number'
