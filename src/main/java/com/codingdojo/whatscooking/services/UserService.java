package com.codingdojo.whatscooking.services;

import org.springframework.stereotype.Service;

import com.codingdojo.whatscooking.models.User;
import com.codingdojo.whatscooking.repositories.UserRepo;

@Service
public class UserService {
	private UserRepo userRepo;
	public UserService(UserRepo userRepo) {
		this.userRepo=userRepo;
	}
	
	public User findByEmail(String email) {
		return userRepo.findByUsername(email);
	}
	
	public void updateUser(User user) {
		userRepo.save(user);
	}
}
