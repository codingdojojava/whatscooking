package com.codingdojo.whatscooking.services;

import org.springframework.stereotype.Service;

import com.codingdojo.whatscooking.models.Recipe;
import com.codingdojo.whatscooking.repositories.RecipeRepository;

@Service
public class RecipeService {
	private RecipeRepository recipeRepo;
	public RecipeService(RecipeRepository recipeRepo) {
		this.recipeRepo=recipeRepo;
	}
	
	public Recipe getByName(String name) {
		return recipeRepo.findByName(name);
	}
	
	public void addRecipe(Recipe recipe) {
		recipeRepo.save(recipe);
	}

}
