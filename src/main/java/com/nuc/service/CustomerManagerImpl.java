package com.nuc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nuc.dao.CustomerDAO;
import com.nuc.model.Customer;



@Service
public class CustomerManagerImpl implements CustomerManager 
{
	@Autowired
    private CustomerDAO employeeDAO;


	@Transactional
	public void addEmployee(Customer employee)
	{
		employee.setCreateDate(new java.util.Date());
		employeeDAO.addEmployee(employee);
	}


	@Transactional
	public List<Customer> getAllEmployees() {
		return employeeDAO.getAllEmployees();
	}


	@Transactional
	public void deleteEmployee(Customer code) {
		employeeDAO.deleteEmployee(code);
	}

	public void setEmployeeDAO(CustomerDAO employeeDAO) {
		this.employeeDAO = employeeDAO;
	}
	
	@Transactional
	public void update(Customer employee)
	{
		employee.setCreateDate(new java.util.Date());
		
		employeeDAO.update(employee);
	}

	
	public Customer getCustomerByCode(String code) {
		// TODO Auto-generated method stub
		return employeeDAO.getCustomerByCode(code);
	}

	@Transactional
	public boolean checkCustomerCode(String code) {
		
		return employeeDAO.checkCustomerCode(code);
	}


	@Transactional
	public List getAllimages() {
		// TODO Auto-generated method stub
		return employeeDAO.getAllimages();
	}


	
}

	


