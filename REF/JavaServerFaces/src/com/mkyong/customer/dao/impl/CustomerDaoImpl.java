package com.mkyong.customer.dao.impl;
 
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
 
import com.mkyong.customer.dao.CustomerDao;
import com.mkyong.customer.model.Customer;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
 
public class CustomerDaoImpl extends 
       HibernateDaoSupport implements CustomerDao{
 
	public void addCustomer(Customer customer){
 
		customer.setCreatedDate(new Date());
		getHibernateTemplate().save(customer);
 
	}
 
	public List<Customer> findAllCustomer(){
 
//		return getHibernateTemplate().find("from Customer");
		List<Customer> result = new ArrayList<Customer>();
		Customer aCus = new Customer();
		aCus.setAddress("juusho");
		aCus.setCreatedDate(new Date());
		aCus.setCustomerId(12345);
		aCus.setName("namae");
		result.add(aCus);
		return result;
	}
}