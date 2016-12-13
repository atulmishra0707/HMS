package com.hms.spring;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RootController {
	private static final Logger logger = LoggerFactory.getLogger(RootController.class);
	@RequestMapping("/")
	public String getStaticPage(){
		logger.info("Welcome Page");
		//return "redirect:html/index.html";
		return "welcome";
		
	}
}
