package com.codingdojo.whatscooking.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.whatscooking.models.Recipe;

@Repository
public interface RecipeRepository extends CrudRepository<Recipe, Long>{
	Recipe findByName(String name);
}
