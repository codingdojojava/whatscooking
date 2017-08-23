package com.codingdojo.whatscooking.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.whatscooking.models.Allergy;
import com.codingdojo.whatscooking.models.Diet;
import com.codingdojo.whatscooking.models.User;
import com.codingdojo.whatscooking.models.Week;
import com.codingdojo.whatscooking.services.AllergyService;
import com.codingdojo.whatscooking.services.DietService;
import com.codingdojo.whatscooking.services.WhatsCookingServices;
import com.codingdojo.whatscooking.validators.UserValidator;

@Controller
public class WhatsCookingCtrl {
	
	@Autowired
	private WhatsCookingServices whatsCookingServices;
	@Autowired
	private UserValidator userValidator;
	private AllergyService allergyServ;
	private DietService dietServ;
	
	public WhatsCookingCtrl(AllergyService allergyServ, DietService dietServ) {
		this.allergyServ=allergyServ;
		this.dietServ=dietServ;
	}
	@RequestMapping("/")
	public String loginForm(@Valid @ModelAttribute("userInfo") User user, 
								@RequestParam(value="error", required=false) String error, 
								@RequestParam(value="logout", required=false) String logout,
								Model model) 
	{
		if(error != null) {
			model.addAttribute("errorMessage", "Invalid Credentials, please try again.");
		}
		if(logout != null) {
			model.addAttribute("logoutMessage", "Logout Successful");
		}
		model.addAttribute("diets", dietServ.getDiets());
		model.addAttribute("allergies", allergyServ.getAllergies());
		return "index";
	}
	
	@PostMapping("/register")
	public String registration(@Valid @ModelAttribute("userInfo") User user, BindingResult result, Model model) {
//		validate user and populate result if it has errors
		userValidator.validate(user, result);
		
//		condition logic of what to do if it has errors
		if (result.hasErrors()) {
			return "index";
		}
		
		Week temp = new Week();
		temp.setSelected(true);
		temp.setUser(user);
		List<Week> tempWeeks = new ArrayList<>();
		user.setWeeks(tempWeeks);
		user.getWeeks().add(temp);
		
//		if success this will NOTE! Only adds a user role to user. This is where you place your role logic
//		check for admin
		whatsCookingServices.saveWithUserRole(user);
		return "redirect:/";
	}
	
	@RequestMapping(value={"home"})
	public String home(Principal principal, Model model) {
		String username = principal.getName();
		User user = whatsCookingServices.findByUsername(username);
		model.addAttribute("current", user);
		return "home";
	}
}
