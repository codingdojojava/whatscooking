package com.codingdojo.whatscooking.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.codingdojo.whatscooking.models.Recipe;
import com.codingdojo.whatscooking.models.User;
import com.codingdojo.whatscooking.repositories.RoleRepo;
import com.codingdojo.whatscooking.repositories.UserRepo;


@Service
public class WhatsCookingServices {
    private UserRepo userRepository;
    private RoleRepo roleRepository;
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    
    public WhatsCookingServices(UserRepo userRepository, RoleRepo roleRepository, BCryptPasswordEncoder bCryptPasswordEncoder)     {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }
    
    
    // 1
    public void saveWithUserRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_USER"));
        userRepository.save(user);
    }
     
     // 2 
    public void saveUserWithAdminRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_ADMIN"));
        userRepository.save(user);
    }    
    
    // 3
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
    
    public void updateProfile(User user) {
    		userRepository.save(user);
    }
    
    public void removeRecipeFromGroceries(User user, Recipe recipe) {
		List<Recipe> groceries = user.getShopping();
		List<Recipe> toRemove = new ArrayList<Recipe>();
		for(Recipe grocery: groceries){
		    if(grocery.getId() == (recipe.getId())){
		        toRemove.add(grocery);
		    }
		}
		groceries.removeAll(toRemove);
		userRepository.save(user);
    }
    
    public void removeRecipeFromFavorites(User user, Recipe recipe) {
		List<Recipe> favorites = user.getFavorites();
		List<Recipe> toRemove = new ArrayList<Recipe>();
		for(Recipe favorite: favorites){
		    if(favorite.getId() == (recipe.getId())){
		        toRemove.add(favorite);
		    }
		}
		favorites.removeAll(toRemove);
		userRepository.save(user);
    }
    
}
