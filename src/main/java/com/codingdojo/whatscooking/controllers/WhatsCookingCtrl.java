package com.codingdojo.whatscooking.controllers;

import java.security.Principal;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.whatscooking.models.User;
import com.codingdojo.whatscooking.services.WhatsCookingServices;
import com.codingdojo.whatscooking.validators.UserValidator;

@Controller
public class WhatsCookingCtrl {
	
	@Autowired
	private WhatsCookingServices whatsCookingServices;
	@Autowired
	private UserValidator userValidator;
	
	@RequestMapping("/")
	public String loginForm(@Valid @ModelAttribute("user") User user, 
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
		return "index";
	}
	
	@PostMapping("/register")
	public String registration(@Valid @ModelAttribute("user") User user, BindingResult result, Model model) {
		
		userValidator.validate(user, result);
		
		if (result.hasErrors()) {
			return "landing";
		}

		whatsCookingServices.saveWithUserRole(user);
		return "redirect:/";
	}
	
	@RequestMapping(value={"home"})
	public String home(Principal principal, Model model) {
		String username = principal.getName();
		User user = whatsCookingServices.findByUsername(username);
		model.addAttribute("currentUser", user);
		return "home";
	}
	
	
}
