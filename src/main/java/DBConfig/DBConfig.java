package DBConfig;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
@ComponentScan(basePackages= {"sahildhamande"})
public class DBConfig {

	 @Bean
		public DriverManagerDataSource getDataSource() {
	    	DriverManagerDataSource dataSource=new DriverManagerDataSource();
	    	dataSource.setUrl("jdbc:mysql://localhost:3306/jdbc_db");
	    	dataSource.setUsername("root");
	    	dataSource.setPassword("P3267D");
	    	dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
			return dataSource;
			
		}
	    @Bean(name="template")
	    public JdbcTemplate getTemplate() {
			return new JdbcTemplate(this.getDataSource());
	    }
}
