package com.codingdojo.whatscooking.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.whatscooking.models.Week;

@Repository
public interface WeekRepository extends CrudRepository<Week, Long>{

}
