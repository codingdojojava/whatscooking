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
		temp.setName("Week 1");
		
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
		for(Diet d : user.getDiets()){
			tempURL += "&allowedDiet[]=" + d.getSearchName();
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
			if(!user.getSelected().getMonRecipes().contains(recipeServ.getByName(recipe)))
				user.getSelected().getMonRecipes().add(recipeServ.getByName(recipe));
		}
		else if(day.equals("tuesday")) {
			if(!user.getSelected().getTueRecipes().contains(recipeServ.getByName(recipe)))
				user.getSelected().getTueRecipes().add(recipeServ.getByName(recipe));
		}
		else if(day.equals("wednesday")) {
			if(!user.getSelected().getWedRecipes().contains(recipeServ.getByName(recipe)))
				user.getSelected().getWedRecipes().add(recipeServ.getByName(recipe));
		}
		else if(day.equals("thursday")) {
			if(!user.getSelected().getThurRecipes().contains(recipeServ.getByName(recipe)))
				user.getSelected().getThurRecipes().add(recipeServ.getByName(recipe));
		}
		else if(day.equals("friday")) {
			if(!user.getSelected().getFriRecipes().contains(recipeServ.getByName(recipe)))
				user.getSelected().getFriRecipes().add(recipeServ.getByName(recipe));
		}
		else if(day.equals("saturday")) {
			if(!user.getSelected().getSatRecipes().contains(recipeServ.getByName(recipe)))
				user.getSelected().getSatRecipes().add(recipeServ.getByName(recipe));
		}
		else if(day.equals("sunday")) {
			if(!user.getSelected().getSunRecipes().contains(recipeServ.getByName(recipe)))
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
		List<Recipe> userFavs = user.getFavorites();
		Recipe addRecipe = recipeServ.getByName(recipe);
		if(!userFavs.contains(addRecipe)){
			user.getFavorites().add(recipeServ.getByName(recipe));
			userServ.updateUser(user);
		}
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
	
	@RequestMapping("recipe/{recipe}")
	public String showRecipe(Principal principal, @PathVariable("recipe") String recipe, Model model) {
		if(recipeServ.getByName(recipe) == null)
		{
			Recipe tempRecipe = new Recipe();
			tempRecipe.setName(recipe);
			List<User> tempList= new ArrayList<>();
			tempRecipe.setFavoritedUsers(tempList);
			recipeServ.addRecipe(tempRecipe);
		}
		model.addAttribute("recipeId", recipe);
		model.addAttribute("numFavs", recipeServ.getByName(recipe).getFavoritedUsers().size());
		return "showrecipe";
	}
	
	@RequestMapping("testajax")
	public String pls() {
		return "test";
	}
	
	@RequestMapping("week/{day}")
	public String showDay(Principal principal, Model model, @PathVariable("day") String day) {
		String email = principal.getName();
		User user = whatsCookingServices.findByUsername(email);
		model.addAttribute("current", user);
		if(day.equals("Monday")) {
			model.addAttribute("recipes", user.getSelected().getMonRecipes());
		}
		else if(day.equals("Tuesday")) {
			model.addAttribute("recipes", user.getSelected().getTueRecipes());
		}
		else if(day.equals("Wednesday")) {
			model.addAttribute("recipes", user.getSelected().getWedRecipes());
		}
		else if(day.equals("Thursday")) {
			model.addAttribute("recipes", user.getSelected().getThurRecipes());
		}
		else if(day.equals("Friday")) {
			model.addAttribute("recipes", user.getSelected().getFriRecipes());
		}
		else if(day.equals("Saturday")) {
			model.addAttribute("recipes", user.getSelected().getSatRecipes());
		}
		else{
			model.addAttribute("recipes", user.getSelected().getSunRecipes());
		}
		return "day";
	}

	@RequestMapping("{day}/remove/{recipe}")
	public String removeFromPlan(Principal principal, @PathVariable("day") String day, @PathVariable("recipe") String recipe){
		User user = whatsCookingServices.findByUsername(principal.getName());
		if(day.equals("Monday"))
			user.getSelected().getMonRecipes().remove(recipeServ.getByName(recipe));
		else if(day.equals("Tuesday"))
			user.getSelected().getTueRecipes().remove(recipeServ.getByName(recipe));
		else if(day.equals("Wednesday"))
			user.getSelected().getWedRecipes().remove(recipeServ.getByName(recipe));
		else if(day.equals("Thursday"))
			user.getSelected().getThurRecipes().remove(recipeServ.getByName(recipe));
		else if(day.equals("Friday"))
			user.getSelected().getFriRecipes().remove(recipeServ.getByName(recipe));
		else if(day.equals("Saturday"))
			user.getSelected().getSatRecipes().remove(recipeServ.getByName(recipe));
		else if(day.equals("Sunday"))
			user.getSelected().getSunRecipes().remove(recipeServ.getByName(recipe));
		weekServ.updateWeek(user.getSelected());
		return "redirect:/week/"+day;
	}

	@RequestMapping("groceries/add/{recipe}")
	public String addToGroceries(Principal principal, @PathVariable("recipe") String recipe){
		User user = userServ.findByEmail(principal.getName());
		if(recipeServ.getByName(recipe) == null)
		{
			Recipe tempRecipe = new Recipe();
			tempRecipe.setName(recipe);
			recipeServ.addRecipe(tempRecipe);
			
		}
		if(!user.getShopping().contains(recipeServ.getByName(recipe))){
			user.getShopping().add(recipeServ.getByName(recipe));
			userServ.updateUser(user);
		}
		return "redirect:/home";
	}
	
	@RequestMapping("/home/profile")
	public String showProfile(Principal principal, Model model, @Valid @ModelAttribute("plan") Week weekplan) {
		String username = principal.getName();
		User user = whatsCookingServices.findByUsername(username);
		model.addAttribute("currentUser", user);
		model.addAttribute("current", user);
		model.addAttribute("user", user);
		model.addAttribute("diets", dietServ.getDiets());
		model.addAttribute("allergies", allergyServ.getAllergies());
		model.addAttribute("favoritess", user.getFavorites());
		model.addAttribute("shoppings", user.getShopping());
		model.addAttribute("plans", user.getWeeks());
		return "profile";
	}

	@PostMapping("/home/profile")
	public String editProfile(@Valid @ModelAttribute("user") User currUser, BindingResult result) {
		whatsCookingServices.updateProfile(currUser);
		return "redirect:/home/profile";
	}
	
	@RequestMapping("/home/profile/{p-id}/change-selected")
	public String changeSelectedPlan(Model model, @PathVariable("p-id") Long id, Principal principal) {
		String username = principal.getName();
		User user = whatsCookingServices.findByUsername(username);
		Week temp = weekServ.findWeek(id);
		user.getSelected().setUserSelected(null);
		user.setSelected(temp);
		temp.setUserSelected(user);
		whatsCookingServices.updateProfile(user);
		model.addAttribute("current", user);
		return "currweek";
	}

	@RequestMapping("selectedWeek")
	public String showWeek(Principal principal, Model model){
		User user = whatsCookingServices.findByUsername(principal.getName());
		model.addAttribute("current", user);
		return "currweek";
	}
	
	
	@PostMapping("/home/addPlan")
	public String addNewPlan(@Valid @ModelAttribute("plan") Week weekplan, BindingResult result, Principal principal) {
		String username = principal.getName();
		User user = whatsCookingServices.findByUsername(username);
		
		weekplan.setUser(user);
		weekServ.addWeek(weekplan);
		
		user.getWeeks().add(weekplan);
		whatsCookingServices.updateProfile(user);
		return "redirect:/home/profile";
	}
	
//	removes
	
	@PostMapping("/home/plans/{plan-id}/delete")
	public String removePlan(@PathVariable(value="plan-id") Long id) {
		weekServ.deleteWeek(id);
		return "redirect:/home/profile";
	}
	
	@RequestMapping("/home/groceries/{grocery-id}/delete")
	public String removeGrocery(@PathVariable(value="grocery-id") Long id, Principal principal, Model model) {
		String username = principal.getName();
		User user = whatsCookingServices.findByUsername(username);
		Recipe recipe = recipeServ.getRById(id);
		
		whatsCookingServices.removeRecipeFromGroceries(user, recipe);
		model.addAttribute("shoppings", user.getShopping());
		return "showgroc";
	}
	@RequestMapping("/home/favorites/{favorite-id}/delete")
	public String removeFavorite(@PathVariable(value="favorite-id") Long id, Principal principal, Model model) {
		String username = principal.getName();
		User user = whatsCookingServices.findByUsername(username);
		Recipe recipe = recipeServ.getRById(id);
		whatsCookingServices.removeRecipeFromFavorites(user, recipe);
		model.addAttribute("favoritess", user.getFavorites());
		return "showfavs";
	}
	
	@RequestMapping("/addmodalplan/{recipe}")
	public String modalAddPlan(@PathVariable("recipe") String recipe, Model model, Principal principal){
		User user = whatsCookingServices.findByUsername(principal.getName());
		model.addAttribute("current", user);
		// System.out.println(recipe);
		return "currweekaddplan";
	}
	
	
	
	
	
	
	
	
}
