package com.hms.spring.aspects;

import java.lang.reflect.Method;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.AfterReturningAdvice;
import org.springframework.aop.MethodBeforeAdvice;
import org.springframework.aop.ThrowsAdvice;

public class LoggingInterceptor implements MethodBeforeAdvice, AfterReturningAdvice, ThrowsAdvice, MethodInterceptor {
	private static final Logger logger = LoggerFactory.getLogger(LoggingInterceptor.class);

	@Override
	public Object invoke(MethodInvocation arg) throws Throwable {
		Object obj = null;
		try{
			obj = arg.proceed();
		}catch(Throwable t){
			t.printStackTrace();
		}
		return obj;
	}

	@Override
	public void afterReturning(Object returnValue, Method method, Object[] args, Object target) throws Throwable {
		String msg = "Class: "+ target.getClass().getSimpleName() + ", Before the Method:" + method.getName();
		if(!"void".equals(method.getReturnType().toString())){
			msg = msg + ", that has produced: " + method.getReturnType().getSimpleName() + "-" + returnValue; 
		}
		logger.info(msg);
		
	}

	@Override
	public void before(Method method, Object[] args, Object target) throws Throwable {
		String msg = "Class: "+ target.getClass().getSimpleName() + ", Before the Method:" + method.getName();
		logger.info(msg);
	}
	
	

}
