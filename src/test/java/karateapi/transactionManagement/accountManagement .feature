# [PR-12132] [https://examplebank.atlassian.net/browse/PR-12132] Expose transactions endpoint
Feature: Transaction Management
  AS A Transaction Manager
  I WANT TO Expose a /transactions endpoint that accepts and persists banking transaction data
  SO THAT the transaction data can be stored in our database

  Background:
    * headers { Content-Type: 'application/json' }
    * url 'http://localhost:8082/banking-transaction-service'
    * path '/secureNet/transactions'
    * def postTransactions = read('classpath:json/transactionRequest.json')
    * def mixedTransactions = read('classpath:json/mixedTransactionRequest.json')

  Scenario: New transactions are correctly processed
    Given request postTransactions
    When method POST
    Then status 200
    * def expectedTransactions = karate.sizeOf(postTransactions)
    * def expectedMessage = "Received '" + expectedTransactions + "' transactions"
    * match response.id == 200
    * match response.message == '#(expectedMessage)'

  Scenario: Service retrieves the number of processed and failed transactions
    Given request mixedTransactions
    When method POST
    Then status 207
    * def unprocessedList = response.unprocessedTransactions.length
    * match response.id == 207
    * match response.inserted == 1
    * match unprocessedList == response.unprocessed
    * match response.unprocessedTransactions[0].constraintValidations == "Amount must be greater than 0"
    * match response.unprocessedTransactions[1].constraintValidations == "AccountNumber or TransactionId must be provided"
    * match response.unprocessedTransactions[2].constraintValidations contains "AccountNumber or TransactionId must be provided"
    * match response.unprocessedTransactions[2].constraintValidations contains "Currency must be a valid ISO 4217 code"
    * match response.unprocessedTransactions[2].constraintValidations contains "Incorrect Provider"
    * match response.unprocessedTransactions[2].constraintValidations contains "Amount is mandatory"
    * match response.unprocessedTransactions[2].constraintValidations contains "Currency is mandatory"
    * match response.unprocessedTransactions[2].constraintValidations contains "Description is mandatory"
    * match response.unprocessedTransactions[2].constraintValidations contains "Incorrect TransactionType"
    * match response.unprocessedTransactions[2].constraintValidations contains "Incorrect DateTime"
    * match response.unprocessedTransactions[2].constraintValidations contains "Timezone is mandatory"

  Scenario: Transactions are not stored when are sent with errors
    Given request postTransactions
    * set postTransactions[0].amount = -12.34
    * set postTransactions[1].accountNumber = null
    * set postTransactions[1].transactionId = null
    * set postTransactions[2].provider = "Test"
    * set postTransactions[3].transactionType = "Test"
    * set postTransactions[4].dateTime = "32-32-32T00:02:03"
    * set postTransactions[5].description = null
    When method POST
    Then status 400
