package com.brijesh.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.brijesh.model.Customer;
import com.brijesh.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController 
{
	@Autowired
	private CustomerService customerService;
	
	@PostMapping("/save")
	public String save(@ModelAttribute Customer customer)
	{
		customerService.save(customer);
		
		return "redirect:/";
	}
}
