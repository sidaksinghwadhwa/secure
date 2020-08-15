package com.nuc.service;

import java.util.List;

import com.nuc.model.Customer;



public interface CustomerManager 
{
	public void addEmployee(Customer employee);
   public List<Customer> getAllEmployees();
    public void deleteEmployee(Customer code);
    public void update(Customer employee);
    public Customer getCustomerByCode(String code) ;
    public boolean checkCustomerCode(String code) ;
    public List<String> getAllimages() ;
}
