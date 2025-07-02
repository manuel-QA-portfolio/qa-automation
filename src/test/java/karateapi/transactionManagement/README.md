# Bank Transaction - Karate

🔍 **Overview**  
These Karate tests validate banking transaction processes. The tests focus on **transaction management**, **validation of required fields**, **error handling**, and **data persistence**. They simulate real-world scenarios like retrieving, posting, and validating transactions.

---

## 🧪 **Tests Included**

1. **Transaction Retrieval**  
   **Retrieve transactions for a specific account number**  
   Verifies that transactions can be retrieved based on an account number.

2. **Field Validation**  
   **Validate required fields in transactions**  
   Ensures that fields like `amount`, `accountNumber`, and `transactionType` are validated. Invalid or missing fields trigger appropriate error messages.

3. **Transaction Persistence**  
   **Persist successful transactions**  
   Validates that successful transactions are correctly stored in the database.

4. **Error Handling**  
   **Handle failed transactions**  
   Tests that transactions with errors (invalid amount, missing data) return the correct error responses, such as status `400` with detailed messages.

5. **Simulating Errors**  
   **Simulate incorrect transaction data**  
   Checks that invalid or incomplete transactions are rejected with specific validation messages for each error (e.g., "Amount must be greater than 0.0").

---

## 🚀 **Best Practices Followed**

1. **No Use of `Thread.sleep()`**  
   **Efficient waits**  
   We avoid unnecessary waits by using robust synchronization techniques to wait for the required API responses.

2. **Data Simulations**  
   **WireMock for service simulation**  
   WireMock is used to mock external services, ensuring that the tests are independent and fast.

3. **Isolated Tests**  
   **Independent test execution**  
   Each test runs in isolation using **TestContainers** for creating temporary services, ensuring no interference between tests.

4. **Clear Error Messages**  
   **Descriptive error responses**  
   In case of failed transactions, clear error messages are returned, helping to debug and understand what went wrong.

5. **Gherkin Syntax (BDD)**  
   **Readable test scenarios**  
   Tests are written using Gherkin syntax for easy understanding by both technical and non-technical stakeholders.
