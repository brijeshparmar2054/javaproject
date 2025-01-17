package com.brijesh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.brijesh.model.Customer;
import com.brijesh.model.Employee;
import com.brijesh.service.CustomerService;
import com.brijesh.service.EmployeeService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/employee")
public class EmployeeController 
{
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@PostMapping("/login")
	public ModelAndView loginProcess(@RequestParam String email, @RequestParam String password, HttpSession session)
	{
		Employee employee = employeeService.findByEmail(email);
		
		if(employee != null)
		{
			if(password.equalsIgnoreCase(employee.getPassword()))
			{
				session.setAttribute("employeeId", employee.getId());
				
				return new ModelAndView("redirect:/employee/dashboard","employee",employee);
			}
			else
			{
				return new ModelAndView("redirect:/errorPage");
			}
		}
		else
		{
			return new ModelAndView("redirect:/errorPage");
		}
		
	}
	
	@GetMapping("/dashboard")
	public ModelAndView dashboard(HttpSession session)
	{
		Long employeeId = (Long) session.getAttribute("employeeId");
		Employee employee = employeeService.findById(employeeId);
		
		List<Customer> list = customerService.findAll();
		
		List<Customer> findByEmployeeId = customerService.findByEmployeeId(null);
		System.out.println(findByEmployeeId);
		
		ModelAndView mv = new ModelAndView("/employee/dashboard");
		mv.addObject("employee", employee);
		
		if(findByEmployeeId!=null)
		{
			mv.addObject("customerlist",findByEmployeeId);
		}
		else
		{
			mv.addObject("customerlist", list);
		}
		
		return mv;
	}
	
	@RequestMapping("/mycustomer")
	public ModelAndView mycustomer(HttpSession session)
	{
		Long employeeId = (Long) session.getAttribute("employeeId");
		Employee employee = employeeService.findById(employeeId);
		
		List<Customer> list = customerService.findByEmployeeId(employee);
		
		ModelAndView mv = new ModelAndView("/employee/mycustomer");
		mv.addObject("employee", employee);
		mv.addObject("mycustomerlist", list);
		
		return mv;
	}
	
	@GetMapping("/accept/{id}")
	public String addtomycustomer(@PathVariable Long id, HttpSession session)
	{
		Long employeeId = (Long) session.getAttribute("employeeId");
		
		Customer customer = customerService.findById(id);
		
		customerService.addCustomerToEmployee(employeeId, customer);
		
		return "redirect:/employee/dashboard";
	}
}
