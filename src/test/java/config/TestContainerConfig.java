package config;

import static constants.TestConstants.POSTGRESQL_IMG;

import org.springframework.test.context.DynamicPropertyRegistry;
import org.springframework.test.context.DynamicPropertySource;
import org.testcontainers.containers.PostgreSQLContainer;
import org.testcontainers.junit.jupiter.Testcontainers;

@Testcontainers
public class TestContainerConfig {

    public static final PostgreSQLContainer<?> postgresContainer = new PostgreSQLContainer<>(POSTGRESQL_IMG)
            .withDatabaseName("transactiondb")
            .withUsername("testuser")
            .withPassword("test")
            .withInitScript("sql/db-init.sql")
            .withReuse(true);

    static {
        postgresContainer.start();
    }

    @DynamicPropertySource
    static void setProperties(DynamicPropertyRegistry registry) {
        PostgreSQLContainer container = postgresContainer;
        registry.add("spring.datasource.url", container::getJdbcUrl);
        registry.add("spring.datasource.username", container::getUsername);
        registry.add("spring.datasource.password", container::getPassword);
        registry.add("spring.datasource.driverClassName", container::getDriverClassName);
        System.out.println(container.getJdbcUrl());
    }
}
