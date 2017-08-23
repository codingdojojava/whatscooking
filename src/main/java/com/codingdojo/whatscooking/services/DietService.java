package com.codingdojo.whatscooking.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.codingdojo.whatscooking.models.Diet;
import com.codingdojo.whatscooking.repositories.DietRepository;

@Service
public class DietService {
	private DietRepository dietRepo;
	
	public DietService(DietRepository dietRepo) {
		this.dietRepo=dietRepo;
	}
	
	public Diet getByName(String name) {
		return dietRepo.findByName(name);
	}
	
	public List<Diet> getDiets(){
		return (List<Diet>) dietRepo.findAll();
	}

}
