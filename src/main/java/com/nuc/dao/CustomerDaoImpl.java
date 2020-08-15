package com.nuc.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.nuc.model.Customer;


@Repository
public class CustomerDaoImpl implements CustomerDAO 
{
	@Autowired
    private SessionFactory sessionFactory;
	
	public void addEmployee(Customer employee) {
		this.sessionFactory.getCurrentSession().save(employee);
	}

	
	@SuppressWarnings("unchecked")
	public List<Customer> getAllEmployees() {
		return this.sessionFactory.getCurrentSession().createQuery("from Customer").list();
	}

	
	public void deleteEmployee(Customer cust) 
	
	{
		String code = cust.getCustomerCode();
		Customer employee = (Customer) sessionFactory.getCurrentSession().load
				(
				Customer.class, code);
        if (null != employee) {
        	this.sessionFactory.getCurrentSession().delete(employee);
        }
	}
	
	
	
	public void update(Customer c) {
		
		Session session = this.sessionFactory.getCurrentSession();
		
		
		
 		
		System.out.println("DAO !!"+c.getCustomerCode()+"!!!IDD"+c.getCustomerId());
		
		session.update(c);
	
		
	

	}

	public Customer getCustomerByCode(String code) {
		Session session = this.sessionFactory.getCurrentSession();
		Customer c=(Customer) session.get(Customer.class,code);
		return c;
	}

	public boolean checkCustomerCode(String code) {
		int counter = 0;
		List<Customer> list = getAllEmployees();
		for (int i = 0; i < list.size(); i++) {
			if(list.get(i).getCustomerCode().equalsIgnoreCase(code))
			{
				counter++;
				break;
			}
			
			
		}
		if(counter==0){
			return true;
		}
		else
		{
			return false;
		}
		
	}

	@SuppressWarnings("unchecked")
	public List getAllimages() {
		System.out.println("inGetImages!"+this.sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM sidimages22").list().size());
		return this.sessionFactory.getCurrentSession().createSQLQuery("SELECT * FROM sidimages22").list();
	}
	
	
}
