package com.nuc.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="sidakmaster123")
public class Customer implements Serializable  {
     
    
    @Column(name="CustomerId")
    @GeneratedValue
    private int CustomerId;
    
    @Id
    @NotEmpty(message = "not") 
    @Column(name="CustomerCode")
	private String CustomerCode;
    @Column(name="CustomerName")
	private String CustomerName;
    @Column(name="Address1")
	private String Address1;
    @Column(name="Address2")
	private String Address2;
    @Column(name="PinCode")
	private String PinCode;//in string form to make it easy for validation
    @Column(name="Email")
	private String Email;
    @Column(name="ContactNumber")
	private String ContactNumber;//in string form to make it easy for validation
    @Column(name="ContactPerson")
	private String ContactPerson;
    @Column(name="RecordStatus")
	private char RecordStatus;
    @Column(name="Flag")
	private char Flag;
    
    
    @Temporal(TemporalType.DATE)
    @Column(name="CreateDate")
	private Date CreateDate;
    
    
    @Column(name="CreatedBy")
   	private String CreatedBy;
    
    
	public String getCreatedBy() {
		return CreatedBy;
	}
	public void setCreatedBy(String createdBy) {
		CreatedBy = createdBy;
	}
	public Integer getCustomerId() {
		return CustomerId;
	}
	public void setCustomerid(Integer customerid) {
		CustomerId = customerid;
	}
	public String getCustomerCode() {
		return CustomerCode;
	}
	public void setCustomerCode(String customerCode) {
		CustomerCode = customerCode;
	}
	public String getCustomerName() {
		return CustomerName;
	}
	public void setCustomerName(String customerName) {
		CustomerName = customerName;
	}
	public String getAddress1() {
		return Address1;
	}
	public void setAddress1(String address1) {
		Address1 = address1;
	}
	public String getAddress2() {
		return Address2;
	}
	public void setAddress2(String address2) {
		Address2 = address2;
	}
	public String getPinCode() {
		return PinCode;
	}
	public void setPinCode(String pinCode) {
		PinCode = pinCode;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getContactNumber() {
		return ContactNumber;
	}
	public void setContactNumber(String contactNumber) {
		ContactNumber = contactNumber;
	}
	public String getContactPerson() {
		return ContactPerson;
	}
	public void setContactPerson(String contactPerson) {
		ContactPerson = contactPerson;
	}
	public char getRecordStatus() {
		return RecordStatus;
	}
	public void setRecordStatus(char recordStatus) {
		RecordStatus = recordStatus;
	}
	public char getFlag() {
		return Flag;
	}
	public void setFlag(char flag) {
		Flag = flag;
	}
	public Date getCreateDate() {
		return CreateDate;
	}
	public void setCreateDate(Date createDate) {
		CreateDate = createDate;
	}
	
	
}
	
	