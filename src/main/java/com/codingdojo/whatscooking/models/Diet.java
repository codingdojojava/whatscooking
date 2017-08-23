package com.codingdojo.whatscooking.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Diet {
	@Id
	@GeneratedValue
	private long id;
	private String name;
	private String searchName;
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "diets", 
        joinColumns = @JoinColumn(name = "diet_id"), 
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
	private List<User> dietUsers;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<User> getDietUsers() {
		return dietUsers;
	}
	public void setDietUsers(List<User> dietUsers) {
		this.dietUsers = dietUsers;
	}
	public String getSearchName() {
		return searchName;
	}
	public void setSearchName(String searchName) {
		this.searchName = searchName;
	}
	
	
}
