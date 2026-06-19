package sahildhamande.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages= {"sahildhamande"})
public class WebMvcConfig implements WebMvcConfigurer{

	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver vr=new InternalResourceViewResolver();
		vr.setPrefix("/WEB-INF/view/");
		vr.setSuffix(".jsp");
		return vr;
		
	}
	 public void addResourceHandlers(ResourceHandlerRegistry registry) {
		 registry.addResourceHandler("/resources/**")
		 .addResourceLocations("/resources/");
		 
		 //for image view
		 registry.addResourceHandler("/img/**")
		 .addResourceLocations("/img/");
		 
		 //for downlaod pdf
		 registry.addResourceHandler("/doc/**")
		 .addResourceLocations("/doc/");
	 }
	 @Bean
	 public StandardServletMultipartResolver multipartResolver() {
		return new StandardServletMultipartResolver();
		 
	 }

}
