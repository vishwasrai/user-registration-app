package com.fse.user.configuration;

import com.captcha.botdetect.web.servlet.SimpleCaptchaServlet;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

public class UserRegAppInitializer implements WebApplicationInitializer {

	public void onStartup(ServletContext container) throws ServletException {

		AnnotationConfigWebApplicationContext ctx = new AnnotationConfigWebApplicationContext();
		ctx.register(UserRegAppConfiguration.class);
		ctx.setServletContext(container);

		ServletRegistration.Dynamic servlet = container.addServlet(
				"spring-mvc", new DispatcherServlet(ctx));

		servlet.setLoadOnStartup(1);
		servlet.addMapping("/");

		ServletRegistration.Dynamic botDetectCaptcha = container.addServlet(
				"botdetect-captcha", new SimpleCaptchaServlet());
		botDetectCaptcha.addMapping("/simple-captcha-endpoint");
	}

}
