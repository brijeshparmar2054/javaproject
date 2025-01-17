package com.brijesh.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.brijesh.model.Customer;
import com.brijesh.model.Employee;

@Repository
public interface CustomerRepository extends JpaRepository<Customer, Long> 
{
	public List<Customer> findByEmployee(Employee employee);
}
