# Bank Transaction - Karate tests

🔍 **Overview**  
These Karate tests validate banking transaction processes. The tests focus on **transaction management**, **validation of required fields**, **error handling**, and **data persistence**. They simulate real-world scenarios like retrieving, posting, and validating transactions.

This suite of tests combines **Cucumber** and **Karate** to create a more robust testing phase:
   
   - **Karate**: Focuses on verifying the API functionality, such as validating transaction data, checking response status codes, ensuring correct field values (e.g., amount, account number), and validating the integrity of system responses.
   
   - **Cucumber**: Used to verify the business requirements, focusing on **happy paths**, user scenarios, and **business logic validation**. Cucumber scenarios describe **high-level user journeys** in Gherkin syntax, such as validating that a transaction is processed correctly or that error handling works as expected for edge cases.

   This hybrid approach allows for a suite of tests that covers both technical correctness and business-driven functionality, ensuring both backend integrity and end-to-end user story validation.

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
   Checks that invalid or incomplete transactions are rejected with specific validation messages for each error (e.g., "Amount must be greater than 0").

---

## 🚀 **Best Practices Followed**

1. **No Use of `Thread.sleep()`**  
   **Efficient waits**  
   We avoid unnecessary waits like `Thread.sleep()` and instead use efficient synchronization techniques to wait for the required API responses, ensuring that tests run smoothly.

2. **Service and Database Isolation**  
   **TestContainers for Environment Setup**  
   Each test is executed in an isolated environment using **TestContainers**. This ensures that a fresh, clean instance of the database is created before the tests, preventing interference between tests and ensuring a reliable environment for each test execution.

3. **Isolated Test Execution**  
   **Independent Tests**  
   Tests are designed to run independently, with no shared state between them. This ensures that each test runs in isolation, allowing for consistent and predictable test results, following good practices.

4. **Clear and Descriptive Error Messages**  
   **Error Handling**  
   When a transaction fails, detailed error messages are provided, making it easy to understand exactly why a particular test failed. This helps developers and QA engineers quickly identify and resolve issues with the input data, such as missing or invalid fields.

5. **Readable and Collaborative Test Scenarios (BDD-style)**  
   **Gherkin-like syntax**  
   Test scenarios are written using a **Gherkin-like syntax**, which allows for clear, readable, and understandable test cases. This approach makes it easy for both technical and non-technical stakeholders to collaborate, ensuring that everyone is aligned with the expected system behavior.

