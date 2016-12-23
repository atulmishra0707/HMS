package com.hms.spring.aspects;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.JoinPoint;

@Aspect
public class LoggingAspect {

	@Before("allMethod()")
	public void loggingAdvise(){
		System.out.println(" - Advise Execution - ");
	}
	
	@Before("within(com.hms.spring..*)")
		public void loggingAdviseforAll(JoinPoint jp){
			System.out.println("Advise Execution of method - "+jp.toString());
		}
		
	@Pointcut("within(com.hms.spring..*)")
	public void allMethod(){}
}
