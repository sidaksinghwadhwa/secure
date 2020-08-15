package com.nuc.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.nuc.model.Customer;
import com.nuc.service.CustomerManager;

@Controller
public class LoginController {
	
	static int counter=0;
	
	
	@Autowired
	private CustomerManager employeeManager;
	
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String executeSecurity(ModelMap model, Principal principal ) {
 //Principal is an interface A principal can be an individual, a corporation,
		//a program thread; anything which can have an identity.
		String name = principal.getName();
		model.addAttribute("author", name);
		model.addAttribute("message", "Welcome To Login Form Based Spring Security Example!!!");
		return "welcome";
 
	}
 
	@RequestMapping(value = "/Maker")
	public String goback(ModelMap model, Principal principal) 
	{
		String name = principal.getName();
		model.addAttribute("author", name);
		System.out.println("inside maker");
		return "Maker";

	}
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
 
		return "login";
 
	}
 
	
	@RequestMapping(value="/kk", method = RequestMethod.GET)
	public String kk(ModelMap model) {
 
		return "hi";
 
	}

	@RequestMapping(value="/fail2login", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
 
		model.addAttribute("error", "true");
		return "login";
 
	}
 
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
 
		return "login";
 
	}
	
	

	
	
	//////////////////////////////////////
	
	@RequestMapping("/create")
	public String create(Model model , HttpServletRequest request) 
	{
		
		String s="create1";
		HttpSession session=request.getSession(false);
		session.setAttribute("page",s);
		System.out.println("inside crete");
		model.addAttribute("command", new Customer());
		return "Maker";

	}
	
	
	
	@RequestMapping(value="/save" ,method = RequestMethod.GET)   
	public String save(@ModelAttribute("command") @Valid Customer cus ,BindingResult result,ModelMap model,HttpServletRequest request,Principal principal)
	{  
		
		
		boolean val=false;
		val=employeeManager.checkCustomerCode(cus.getCustomerCode());
		
		if (result.hasErrors()) {

			System.out.println("sidak11");
			String s="create1";
			HttpSession session=request.getSession(false);
			session.setAttribute("page",s);
			System.out.println("inside Binding Error");
			model.addAttribute("command", new Customer());
			return "Maker";
			
		}
		else
		{
			if(val==true)
			{
				
				System.out.println(cus.getCustomerCode());
				cus.setCreatedBy(principal.getName());
				System.out.println(cus.getCreatedBy());
				employeeManager.addEmployee(cus);
				System.out.println("codeEXISTTS");
				return"Maker";
			}
			
			else
			{
				String s="code";
				HttpSession session=request.getSession(false);
				session.setAttribute("page",s);
				
				return "Maker";
			}
			
		}
		
		
		
	}
	
	
	
	
	//retrieve
	@RequestMapping(value="/retrieveAll", method=RequestMethod.POST)
	@ResponseBody
	public String retrieveAll(Model model) 
	{
		List<Customer> list1 = employeeManager.getAllEmployees();
		
		System.out.println("ret");
		Gson gson = new GsonBuilder().create();
		String array = gson.toJson(list1);
		System.out.println(array.length());
		return array;

	}
	
	 
	
	
	
	
	
	@RequestMapping(value="/processForm",params="retrieveOne", method = RequestMethod.GET)
	public ModelAndView retrieve(Model model) 
	
	{ 
		List<Customer> list = employeeManager.getAllEmployees();
		
		System.out.println("sdgh");
		
		return new ModelAndView("retrieve1","list",list);
	}
	
	
	
	@RequestMapping("/retrieve2") 
	public String retrieve2 (@RequestParam("CustomerCode") String code ,Model model,HttpServletRequest request)
	{
		
		
		boolean val = false;
		
		if(employeeManager.checkCustomerCode(code)==false)
		{
			System.out.println(code);
			HttpSession session=request.getSession(false);
			session.setAttribute("page","search1");
			System.out.println("reee");
			Customer  c = new Customer();
			List<Customer> list = employeeManager.getAllEmployees();
			
			for (int i = 0; i < list.size(); i++) {
				if(code.equals(list.get(i).getCustomerCode()))
				{
					c = list.get(i);
					break;
				}
			}

			List<Customer> list2 =  new ArrayList<Customer>();
			list2.add(c);
			model.addAttribute("list",list2);
			return "Maker";
		}
		
		else
			
			
		{
			
			HttpSession session=request.getSession(false);
			session.setAttribute("page","problem");
			System.out.println("reee");
			
			return "Maker";
			
			
		}
		
	
	    
	}
	
	
	//for delete
	@RequestMapping("/delete")
	public ModelAndView delete(Model model,HttpServletRequest request) 
	
	{ 
		String s="delete1";
		
		System.out.println("delete!!!!!!!");
		HttpSession session=request.getSession(false);
		session.setAttribute("page",s);
		List<Customer> list = employeeManager.getAllEmployees();
		
		System.out.println("sdgh");
		
		return new ModelAndView("Maker","list",list);
	}
	
	
	@RequestMapping("/deleterecord" ) 
	public String delete (@RequestParam("customerCode") String code ,ModelMap model,HttpServletRequest request)
	{
		
		System.out.println("**********");
		Customer  c = employeeManager.getCustomerByCode(code);
		System.out.println("Add"+c.getAddress2());
		
		employeeManager.deleteEmployee(c);
	    return "Maker";
	    
	}
	
	

	@RequestMapping("/update")
	public ModelAndView update(Model model,HttpServletRequest request) 
	
	{ 
		String s="update1";
		HttpSession session=request.getSession(false);
		session.setAttribute("page",s);
		List<Customer> list = employeeManager.getAllEmployees();
		
		System.out.println("sdgh");
		
		return new ModelAndView("Maker","list",list);
	}

	@RequestMapping("/update2")
	public String update2(@RequestParam("customerCode") String code ,Model model,HttpServletRequest request) 
	{
		String s="update2";
		HttpSession session=request.getSession(false);
		session.setAttribute("page",s);
		Customer  c = employeeManager.getCustomerByCode(code);
		
		System.out.println("inside update2");
		model.addAttribute("command", c);
		return "Maker";

	}
	
	@RequestMapping("/update3" )   
	public String update3(@ModelAttribute("SpringWeb") Customer cus ,ModelMap model)
	{  
		System.out.println("UPDATE@@@@@@");
		System.out.println(cus.getCustomerCode());
		employeeManager.update(cus);
		System.out.println("update3");
		return"Maker";
	}
	
	
	@RequestMapping(value = "/getImage", method = RequestMethod.GET)
	@ResponseBody
	 public  String image()
	{
		
			
			String arr[] =  new String[200]; 
			List<String> str = employeeManager.getAllimages();
			
			for (int i = 0; i <str.size(); i++) {
				arr[i]=str.get(i);
			}
			System.out.println("@@@@"+arr[0]);
			System.out.println("!@"+counter);
			counter = (counter + 1)%arr.length;
			String img = arr[counter]; 
			return img;
	   }
	
	
}


