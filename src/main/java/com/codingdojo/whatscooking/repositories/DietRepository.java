package com.codingdojo.whatscooking.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.whatscooking.models.Diet;

@Repository
public interface DietRepository extends CrudRepository<Diet, Long>{
	Diet findByName(String name);
}
