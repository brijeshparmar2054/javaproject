package com.brijesh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController 
{
	@RequestMapping("/customer/form")
	public String customerForm()
	{
		return "customer/form";
	}
	
	@RequestMapping("/employee/login")
	public String employeeLoginPage()
	{
		return "employee/login";
	}
	
	@RequestMapping("/admin/login")
	public String adminLoginPage()
	{
		return "admin/login";
	}
	
	@RequestMapping("/errorPage")
	public String errorPage()
	{
		return "errorPage";
	}
}
