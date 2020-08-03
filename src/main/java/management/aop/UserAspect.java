package management.aop;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;


@Aspect
@Component
public class UserAspect {
	
	static Logger logger = LogManager.getLogger(UserAspect.class);
	
	@Around("execution(* management..service.impl.*ServiceImpl.*(..)")
	public Object Logging(ProceedingJoinPoint jp) throws Throwable {
		
		System.out.println(jp);
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
//		logger.debug("메서드명: " + jp.getSignature().getName() + " 시작");
//		logger.debug("파라미터: " + Arrays.toString(jp.getArgs()));
		Object result =  jp.proceed();
//		logger.debug("메서드 명: " + jp.getSignature().getName() + " 종료");
		return result; 

	}
}
