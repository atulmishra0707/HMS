package com.hms.spring.aspects;

import java.lang.reflect.Method;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.aop.AfterReturningAdvice;
import org.springframework.aop.MethodBeforeAdvice;
import org.springframework.aop.ThrowsAdvice;

public class LoggingInterceptor implements MethodBeforeAdvice, AfterReturningAdvice, ThrowsAdvice, MethodInterceptor {
	private static final Logger logger = LoggerFactory.getLogger(LoggingInterceptor.class);

	@Override
	@Around("execution(* com.hms.spring.*.*(..))")
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
	@After("execution(* com.hms.spring.*.*(..))")
	public void afterReturning(Object returnValue, Method method, Object[] args, Object target) throws Throwable {
		String msg = "Class: "+ target.getClass().getSimpleName() + ", Before the Method:" + method.getName();
		if(!"void".equals(method.getReturnType().toString())){
			msg = msg + ", that has produced: " + method.getReturnType().getSimpleName() + "-" + returnValue; 
		}
		logger.info(msg);
		System.out.println("Advise After Execution of method - "+ msg);
	}

	@Override
	@Before("execution(* com.hms.spring.*.*(..))")
	public void before(Method method, Object[] args, Object target) throws Throwable {
		String msg = "Class: "+ target.getClass().getSimpleName() + ", Before the Method:" + method.getName();
		logger.info(msg);
		System.out.println("Advise Before Execution of method - "+ msg);
	}
	
	

}
