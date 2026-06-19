package sahildhamande.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private PasswordEncoder passwordEncoder;
/*	
    @Bean
	public SecurityFilterChain filterChain(HttpSecurity http)throws Exception {
		http.
		authorizeHttpRequests(auth->auth.anyRequest().
				authenticated()).
		       formLogin()
		       .and().
		       httpBasic();
		       //here add that
    	http.csrf().disable();
		http.
		authorizeHttpRequests(auth->   //(request come from controller and it matches with resources folder)
		auth.anyRequest().permitAll())
         .formLogin(form->form.loginPage("/custlogin").
				loginProcessingUrl("/login").defaultSuccessUrl("/dashboard",true).permitAll())
		.logout(logout->logout.logoutSuccessUrl("/custlogin?logout=true").permitAll()); //here we are give url of controller//get what ever present in resource folder

	    return http.build();
	    
	

	}
*/
@Bean
public DaoAuthenticationProvider authenticationProvider() {
    DaoAuthenticationProvider provider = new DaoAuthenticationProvider();
    provider.setUserDetailsService(userDetailsService);
    provider.setPasswordEncoder(passwordEncoder);
    return provider;
}

@Bean
public AuthenticationManager authenticationManager(AuthenticationConfiguration authConfig) throws Exception {
    return authConfig.getAuthenticationManager();
}

@Bean
public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
	http.csrf().disable();
	http.authenticationProvider(authenticationProvider());
	http.authorizeHttpRequests(auth -> auth
		.requestMatchers(
			AntPathRequestMatcher.antMatcher("/custlogin"),
			AntPathRequestMatcher.antMatcher("/login"),
			AntPathRequestMatcher.antMatcher("/register"),
			AntPathRequestMatcher.antMatcher("/saveuser"),
			AntPathRequestMatcher.antMatcher("/css/**"),
			AntPathRequestMatcher.antMatcher("/js/**"),
			AntPathRequestMatcher.antMatcher("/img/**")
		)
		.permitAll()
		.anyRequest().authenticated()
	)
	.formLogin(form -> form
		.loginPage("/custlogin")
		.loginProcessingUrl("/login")
		.defaultSuccessUrl("/dashboard", true)
		.permitAll()
	)
	.logout(logout -> logout
		.logoutSuccessUrl("/custlogin?logout=true")
		.permitAll()
	);
	return http.build();
}



}
