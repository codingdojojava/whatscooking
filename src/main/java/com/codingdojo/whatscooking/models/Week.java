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
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Week {
	@Id
	@GeneratedValue
	private long id;
	
	@OneToOne(cascade=CascadeType.ALL, fetch=FetchType.LAZY)
	@JoinColumn(name="userSelected_id")
	private User userSelected;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "monday", 
        joinColumns = @JoinColumn(name = "week_id"), 
        inverseJoinColumns = @JoinColumn(name = "recipe_id")
    )
	private List<Recipe> monRecipes;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "tuesday", 
        joinColumns = @JoinColumn(name = "week_id"), 
        inverseJoinColumns = @JoinColumn(name = "recipe_id")
    )
	private List<Recipe> tueRecipes;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "wednesday", 
        joinColumns = @JoinColumn(name = "week_id"), 
        inverseJoinColumns = @JoinColumn(name = "recipe_id")
    )
	private List<Recipe> wedRecipes;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "thursday", 
        joinColumns = @JoinColumn(name = "week_id"), 
        inverseJoinColumns = @JoinColumn(name = "recipe_id")
    )
	private List<Recipe> thurRecipes;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "friday", 
        joinColumns = @JoinColumn(name = "week_id"), 
        inverseJoinColumns = @JoinColumn(name = "recipe_id")
    )
	private List<Recipe> friRecipes;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "saturday", 
        joinColumns = @JoinColumn(name = "week_id"), 
        inverseJoinColumns = @JoinColumn(name = "recipe_id")
    )
	private List<Recipe> satRecipes;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "sunday", 
        joinColumns = @JoinColumn(name = "week_id"), 
        inverseJoinColumns = @JoinColumn(name = "recipe_id")
    )
	private List<Recipe> sunRecipes;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Recipe> getMonRecipes() {
		return monRecipes;
	}

	public void setMonRecipes(List<Recipe> monRecipes) {
		this.monRecipes = monRecipes;
	}

	public List<Recipe> getTueRecipes() {
		return tueRecipes;
	}

	public void setTueRecipes(List<Recipe> tueRecipes) {
		this.tueRecipes = tueRecipes;
	}

	public List<Recipe> getWedRecipes() {
		return wedRecipes;
	}

	public void setWedRecipes(List<Recipe> wedRecipes) {
		this.wedRecipes = wedRecipes;
	}

	public List<Recipe> getThurRecipes() {
		return thurRecipes;
	}

	public void setThurRecipes(List<Recipe> thurRecipes) {
		this.thurRecipes = thurRecipes;
	}

	public List<Recipe> getFriRecipes() {
		return friRecipes;
	}

	public void setFriRecipes(List<Recipe> friRecipes) {
		this.friRecipes = friRecipes;
	}

	public List<Recipe> getSatRecipes() {
		return satRecipes;
	}

	public void setSatRecipes(List<Recipe> satRecipes) {
		this.satRecipes = satRecipes;
	}

	public List<Recipe> getSunRecipes() {
		return sunRecipes;
	}

	public void setSunRecipes(List<Recipe> sunRecipes) {
		this.sunRecipes = sunRecipes;
	}

	public User getUserSelected() {
		return userSelected;
	}

	public void setUserSelected(User userSelected) {
		this.userSelected = userSelected;
	}
	
	
}
