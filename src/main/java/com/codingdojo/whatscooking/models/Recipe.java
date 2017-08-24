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
public class Recipe {
	@Id
	@GeneratedValue
	private long id;
	
	private String name;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "userfavorites", 
        joinColumns = @JoinColumn(name = "recipe_id"), 
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
	private List<User> favoritedUsers;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "usergroceries", 
        joinColumns = @JoinColumn(name = "recipe_id"), 
        inverseJoinColumns = @JoinColumn(name = "user_id")
    )
	private List<User> shoppingUsers;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "monday", 
        joinColumns = @JoinColumn(name = "recipe_id"), 
        inverseJoinColumns = @JoinColumn(name = "week_id")
    )
	private List<User> monWeeks;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "tuesday", 
        joinColumns = @JoinColumn(name = "recipe_id"), 
        inverseJoinColumns = @JoinColumn(name = "week_id")
    )
	private List<User> tueWeeks;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "wednesday", 
        joinColumns = @JoinColumn(name = "recipe_id"), 
        inverseJoinColumns = @JoinColumn(name = "week_id")
    )
	private List<User> wedWeeks;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "thursday", 
        joinColumns = @JoinColumn(name = "recipe_id"), 
        inverseJoinColumns = @JoinColumn(name = "week_id")
    )
	private List<User> thurWeeks;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "friday", 
        joinColumns = @JoinColumn(name = "recipe_id"), 
        inverseJoinColumns = @JoinColumn(name = "week_id")
    )
	private List<User> friWeeks;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "saturday", 
        joinColumns = @JoinColumn(name = "recipe_id"), 
        inverseJoinColumns = @JoinColumn(name = "week_id")
    )
	private List<User> satUsers;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "sunday", 
        joinColumns = @JoinColumn(name = "recipe_id"), 
        inverseJoinColumns = @JoinColumn(name = "week_id")
    )
	private List<User> sunUsers;
	
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

	public List<User> getFavoritedUsers() {
		return favoritedUsers;
	}

	public void setFavoritedUsers(List<User> favoritedUsers) {
		this.favoritedUsers = favoritedUsers;
	}

	public List<User> getShoppingUsers() {
		return shoppingUsers;
	}

	public void setShoppingUsers(List<User> shoppingUsers) {
		this.shoppingUsers = shoppingUsers;
	}

	public List<User> getMonWeeks() {
		return monWeeks;
	}

	public void setMonWeeks(List<User> monWeeks) {
		this.monWeeks = monWeeks;
	}

	public List<User> getTueWeeks() {
		return tueWeeks;
	}

	public void setTueWeeks(List<User> tueWeeks) {
		this.tueWeeks = tueWeeks;
	}

	public List<User> getWedWeeks() {
		return wedWeeks;
	}

	public void setWedWeeks(List<User> wedWeeks) {
		this.wedWeeks = wedWeeks;
	}

	public List<User> getThurWeeks() {
		return thurWeeks;
	}

	public void setThurWeeks(List<User> thurWeeks) {
		this.thurWeeks = thurWeeks;
	}

	public List<User> getFriWeeks() {
		return friWeeks;
	}

	public void setFriWeeks(List<User> friWeeks) {
		this.friWeeks = friWeeks;
	}

	public List<User> getSatUsers() {
		return satUsers;
	}

	public void setSatUsers(List<User> satUsers) {
		this.satUsers = satUsers;
	}

	public List<User> getSunUsers() {
		return sunUsers;
	}

	public void setSunUsers(List<User> sunUsers) {
		this.sunUsers = sunUsers;
	}
	
	
	
	
}
