package sahildhamande.config;

import DBConfig.DBConfig;
import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

public class SecurityWebApplicationInitializer extends AbstractSecurityWebApplicationInitializer{

	public SecurityWebApplicationInitializer() {
		super(SecurityConfig.class, UserConfig.class, DBConfig.class);
	}

}
