package management.admin;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesView;

import management.aop.UserAspect;

// AdminWebApplicationInitializer가 설정하는
// DispatcherServlet(/admin/* 요청 처리)의 IoC 컨테이너를 위한 설정이다.
//
@ComponentScan(value = "management.admin")
@EnableWebMvc
public class AdminWebConfig {

  static Logger logger = LogManager.getLogger(AdminWebConfig.class);

  public AdminWebConfig() {
    logger.debug("AdminWebConfig 객체 생성!");
  }

  //  @Bean
  //  public ViewResolver viewResolver() {
  //    InternalResourceViewResolver vr = new InternalResourceViewResolver(//
  //        "/WEB-INF/admin/", // prefix
  //        ".jsp" // suffix
  //    );
  //    return vr;
  //  }


  @Bean
  public MultipartResolver multipartResolver() {
    CommonsMultipartResolver mr = new CommonsMultipartResolver();
    mr.setMaxUploadSize(10000000);
    mr.setMaxInMemorySize(2000000);
    mr.setMaxUploadSizePerFile(5000000);
    return mr;
  }
  @Bean
  public UserAspect userAspect() {
	  UserAspect ur = new UserAspect();
	  return ur;
  }
  
}


