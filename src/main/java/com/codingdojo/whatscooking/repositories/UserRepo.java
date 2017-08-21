package com.codingdojo.whatscooking.repositories;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.whatscooking.models.User;

public interface UserRepo extends CrudRepository<User, Long>{
	User findByUsername(String username);
}
