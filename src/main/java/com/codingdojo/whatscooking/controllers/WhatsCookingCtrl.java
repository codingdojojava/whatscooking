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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.whatscooking.models.Allergy;
import com.codingdojo.whatscooking.models.Diet;
import com.codingdojo.whatscooking.models.Recipe;
import com.codingdojo.whatscooking.models.User;
import com.codingdojo.whatscooking.models.Week;
import com.codingdojo.whatscooking.services.AllergyService;
import com.codingdojo.whatscooking.services.DietService;
import com.codingdojo.whatscooking.services.RecipeService;
import com.codingdojo.whatscooking.services.UserService;
import com.codingdojo.whatscooking.services.WeekService;
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
	private RecipeService recipeServ;
	private WeekService weekServ;
	private UserService userServ;
	public WhatsCookingCtrl(WeekService weekServ, RecipeService recipeServ, AllergyService allergyServ, DietService dietServ, UserService userServ) {
		this.allergyServ=allergyServ;
		this.dietServ=dietServ;
		this.recipeServ=recipeServ;
		this.weekServ=weekServ;
		this.userServ=userServ;
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
		
		if (result.hasErrors()) {
			return "index";
		}

		
		Week temp = new Week();
		temp.setUser(user);
		temp.setUserSelected(user);
		
		List<Week> tempWeeks = new ArrayList<>();
		user.setWeeks(tempWeeks);
		user.getWeeks().add(temp);
		user.setSelected(user.getWeeks().get(user.getWeeks().size()-1));
		
//		if success this will NOTE! Only adds a user role to user. This is where you place your role logic
//		check for admin
		System.out.println("FFADLFMAKDFMLAKDFLAK");
		whatsCookingServices.saveWithUserRole(user);
		return "redirect:/";
	}
	
	@RequestMapping(value={"home"})
	public String home(Principal principal, Model model) {
		String username = principal.getName();
		User user = whatsCookingServices.findByUsername(username);
		String tempURL = "http://api.yummly.com/v1/api/recipes?_app_id=05610fe6&_app_key=bbb5f5f86b3b34fc33b68a21e83c13ee";
		for(Allergy a : user.getAllergies()) {
			tempURL += "&allowedAllergy[]=" + a.getSearchName();
		}
		model.addAttribute("url", tempURL);
		model.addAttribute("current", user);
		return "home";
	}
	
	@RequestMapping("addtoplan/{recipe}")
	public String addToPlan(@PathVariable("recipe") String recipe, Model model) {
		model.addAttribute("recipeId", recipe);
		return "addtoplan";
	}
	
	@RequestMapping("addtoplan/{recipe}/{day}")
	public String addToDay(Principal principal, @PathVariable("recipe") String recipe, @PathVariable("day") String day) {
		String email = principal.getName();
		User user = whatsCookingServices.findByUsername(email);
		if(recipeServ.getByName(recipe) == null)
		{
			Recipe tempRecipe = new Recipe();
			tempRecipe.setName(recipe);
			recipeServ.addRecipe(tempRecipe);
			
		}
		System.out.println(day);
		if(day.equals("monday")) {
			user.getSelected().getMonRecipes().add(recipeServ.getByName(recipe));
		}
		else if(day.equals("tuesday")) {
			user.getSelected().getTueRecipes().add(recipeServ.getByName(recipe));
		}
		else if(day.equals("wednesday")) {
			user.getSelected().getWedRecipes().add(recipeServ.getByName(recipe));
		}
		else if(day.equals("thursday")) {
			user.getSelected().getThurRecipes().add(recipeServ.getByName(recipe));
		}
		else if(day.equals("friday")) {
			user.getSelected().getFriRecipes().add(recipeServ.getByName(recipe));
		}
		else if(day.equals("saturday")) {
			user.getSelected().getSatRecipes().add(recipeServ.getByName(recipe));
		}
		else if(day.equals("sunday")) {
			user.getSelected().getSunRecipes().add(recipeServ.getByName(recipe));
		}
		weekServ.updateWeek(user.getSelected());
		return "redirect:/home";
	}
	
	@RequestMapping("favorite/{recipe}")
	public String addFavoriteRecipe(Principal principal, @PathVariable("recipe") String recipe, Model model) {
		String email = principal.getName();
		User user = whatsCookingServices.findByUsername(email);
		if(recipeServ.getByName(recipe) == null)
		{
			Recipe tempRecipe = new Recipe();
			tempRecipe.setName(recipe);
			recipeServ.addRecipe(tempRecipe);
			
		}
		user.getFavorites().add(recipeServ.getByName(recipe));
		userServ.updateUser(user);
		model.addAttribute("recipeId", recipe);
		return "redirect:/home";
	}
	
	@RequestMapping("/home/favorites")
	public String showFavorites(Principal principal, Model model) {
		String username = principal.getName();
		User user = whatsCookingServices.findByUsername(username);
		List<Recipe> favorites = user.getFavorites();
		model.addAttribute("currentUser", user);
		model.addAttribute("favorites", favorites);
		return "allfavorites";
	}
	
	@RequestMapping("/home/profile")
	public String showProfile(Principal principal, Model model) {
		String username = principal.getName();
		User user = whatsCookingServices.findByUsername(username);
		model.addAttribute("currentUser", user);
		return "profile";
	}
	
	
	
}
