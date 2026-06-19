package sahildhamande.config;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import DBConfig.DBConfig;

import java.io.*;

public class WebAppInitializer implements WebApplicationInitializer{
  public static String docFilepath;
  public static String imgFilepath;
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {
		
		
		AnnotationConfigWebApplicationContext context=new AnnotationConfigWebApplicationContext();
		context.register(WebMvcConfig.class);
		
	//	AnnotationConfigWebApplicationContext ctx=new AnnotationConfigWebApplicationContext();
		context.register(DBConfig.class);
		
		DispatcherServlet ds=new DispatcherServlet(context);
		ServletRegistration.Dynamic servlet= servletContext.addServlet("dispatcher",ds);
		servlet.addMapping("/");
		servlet.setLoadOnStartup(1);
		
		//creating folder for pdf file and img
		
		String path=servletContext.getRealPath("/");
		/*
	//	System.out.println(path);
		File docFile=new File("D:\\Spring-project\\SpringMvcFirstCrudApp\\src\\main\\webapp\\doc\\");
		 docFilepath=docFile.toString() +"\\";
		
		if(!docFile.exists())
		{
			docFile.mkdir();
		}
		File imgFile=new File("D:\\Spring-project\\SpringMvcFirstCrudApp\\src\\main\\webapp\\img\\"
);
		if(!imgFile.exists())
		{
			imgFile.mkdir();
		}
		docFilepath=path+"doc\\";
		
		imgFilepath = imgFile.toString() + "\\";
		
		*/
		imgFilepath = path + "img\\";
		docFilepath = path + "doc\\";

		new File(imgFilepath).mkdirs();
		new File(docFilepath).mkdirs();

		System.out.println("IMG PATH = " + imgFilepath);
		System.out.println("DOC PATH = " + docFilepath);
		//configuration of file uploading
		MultipartConfigElement multiConfigElement=new MultipartConfigElement
				("D:\\Spring-project\\SpringMvcFirstCrudApp\\src\\main\\webapp\\img", //location
				 10*1024*1024,  //maxFileSize (10mb)
				 20*1024*1024,  //maxRequestSize(20mb)
				 0);            //fileSize threshold
			servlet.setMultipartConfig(multiConfigElement);	
		
	}

}
