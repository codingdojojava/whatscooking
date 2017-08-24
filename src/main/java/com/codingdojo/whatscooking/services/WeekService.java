package com.codingdojo.whatscooking.services;

import org.springframework.stereotype.Service;

import com.codingdojo.whatscooking.models.Week;
import com.codingdojo.whatscooking.repositories.WeekRepository;

@Service
public class WeekService {
	private WeekRepository weekRepo;
	public WeekService(WeekRepository weekRepo) {
		this.weekRepo=weekRepo;
	}
	
	public void addWeek(Week week) {
		weekRepo.save(week);
	}
	
	public void updateWeek(Week week) {
		weekRepo.save(week);
	}
	
	public Week findWeek(Long id) {
		return weekRepo.findOne(id);
	}
}
