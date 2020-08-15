package com.nuc.dao;

import java.util.List;

import com.nuc.model.Customer;



public interface CustomerDAO 
 {
	public void addEmployee(Customer employee);
    public List<Customer> getAllEmployees();
    public void deleteEmployee(Customer id);
    public void update(Customer employee);
    public Customer getCustomerByCode(String code) ;
    public boolean checkCustomerCode(String code);

    public List getAllimages();

 }
