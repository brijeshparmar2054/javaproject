package com.brijesh.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.brijesh.model.Customer;
import com.brijesh.model.Employee;
import com.brijesh.service.CustomerService;
import com.brijesh.service.EmployeeService;

@Controller
@RequestMapping("/admin")
public class AdminController 
{
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private CustomerService customerService;
	
	@PostMapping("/login")
	public ModelAndView loginProcess(@RequestParam String username, @RequestParam String password)
	{
		if(username.equalsIgnoreCase("admin") && password.equalsIgnoreCase("admin"))
		{
			return new ModelAndView("redirect:/admin/dashboard");
		}
		else
		{
			return new ModelAndView("redirect:/errorPage");
		}
	}
	
	@RequestMapping("/dashboard")
	public ModelAndView dashboard()
	{
		List<Employee> list = employeeService.findAll();
		
		return new ModelAndView("admin/dashboard", "employeelist", list);
	}
	
	@RequestMapping("/viewcustomer")
	public ModelAndView viewCustomer()
	{
		List<Customer> list = customerService.findAll();
		
		return new ModelAndView("admin/viewcustomer", "customerlist", list);
	}
	
	@RequestMapping("/addemployee")
	public String addEmployee()
	{
		return "admin/addemployee";
	}
	
	@PostMapping("/save")
	public String addEmployee(@ModelAttribute Employee employee)
	{
		employeeService.save(employee);
		
		return "redirect:/admin/dashboard";
	}
	
	@GetMapping("/delete/{id}")
	public String deleteEmployee(@PathVariable Long id)
	{
		employeeService.delete(id);
		
		return "redirect:/admin/dashboard";
	}
	
	@GetMapping("/edit/{id}")
	public String editEmployee(@PathVariable Long id, Model model)
	{
		Employee employeeById = employeeService.findById(id);
		model.addAttribute(employeeById);
		
		return "admin/updateemployee";
	}
}
