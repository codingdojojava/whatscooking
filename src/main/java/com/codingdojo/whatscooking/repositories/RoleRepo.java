package com.codingdojo.whatscooking.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.whatscooking.models.Role;

public interface RoleRepo extends CrudRepository<Role, Long>{
	List<Role> findByName(String name);
}
