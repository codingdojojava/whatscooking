package com.codingdojo.whatscooking.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.codingdojo.whatscooking.models.Allergy;
import com.codingdojo.whatscooking.repositories.AllergyRepository;

@Service
public class AllergyService {
	private AllergyRepository allergyRepo;
	
	public AllergyService(AllergyRepository allergyRepo) {
		this.allergyRepo = allergyRepo;
	}
	
	public Allergy getByName(String name) {
		return allergyRepo.findByName(name);
	}
	
	public List<Allergy> getAllergies(){
		return (List<Allergy>) allergyRepo.findAll();
	}
}
