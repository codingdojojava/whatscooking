package com.codingdojo.whatscooking.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.whatscooking.models.Allergy;

@Repository
public interface AllergyRepository extends CrudRepository<Allergy, Long>{
	Allergy findByName(String name);
}
