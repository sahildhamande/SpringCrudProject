package sahildhamande.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import java.sql.*;

import javax.sql.DataSource;

@Configuration
public class UserConfig {
    
    @Autowired
    DataSource datasource;
    
    @Bean
    public UserDetailsService userDetailService() {
        JdbcUserDetailsManager manager = new JdbcUserDetailsManager(datasource);
        manager.setUsersByUsernameQuery(
                "select username, password, true as enabled from userdetails where username = ?");
        manager.setAuthoritiesByUsernameQuery(
                "select username, 'ROLE_USER' as authority from userdetails where username = ?");
        return manager;
    }
    
    @Bean
    public PasswordEncoder passwordencoder() {
        return new BCryptPasswordEncoder();
    }
}
