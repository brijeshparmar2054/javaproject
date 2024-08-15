package com.brijesh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.brijesh.model.Employee;
import com.brijesh.repository.EmployeeRepository;

@Service
public class EmployeeService 
{
	@Autowired
	private EmployeeRepository employeeRepository;
	
	public void save(Employee employee)
	{
		employeeRepository.save(employee);
	}
	
	public Employee findById(Long id)
	{
		return employeeRepository.findById(id).get();
	}
	
	public List<Employee> findAll()
	{
		return employeeRepository.findAll();
	}
	
	public Employee findByEmail(String email)
	{
		return employeeRepository.findByEmail(email);
	}
	
	public void delete(Long id)
	{
		employeeRepository.deleteById(id);
	}
}
