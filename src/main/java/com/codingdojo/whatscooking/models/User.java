package com.codingdojo.whatscooking.models;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Size;



@Entity
@Table(name="users")
public class User {
	
	@Id
	@GeneratedValue
	private Long id;
	
	private String username;
	
	@Size(min=3)
	private String firstname;
	
	@Size(min=3)
	private String lastname;
	
	@OneToOne(mappedBy="userSelected", fetch=FetchType.LAZY)
	private Week selected;
	
	@OneToMany(cascade=CascadeType.ALL, mappedBy="user", fetch=FetchType.LAZY)
	private List<Week> weeks;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "userfavorites", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "recipe_id")
    )
	private List<Recipe> favorites;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "userallergies", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "allergy_id")
    )
	private List<Allergy> allergies;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "usergroceries", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "recipe_id")
    )
	private List<Recipe> shopping;
	
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.LAZY)
    @JoinTable(
        name = "diets", 
        joinColumns = @JoinColumn(name = "user_id"), 
        inverseJoinColumns = @JoinColumn(name = "diet_id")
    )
	private List<Diet> diets;
	
	@Size(min=5)
	private String password;
	@Transient
	private String passwordConfirmation;
	private Date createdAt;
	private Date updatedAt;
	@ManyToMany(cascade=CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(
			name="users_roles",
			joinColumns = @JoinColumn(name="user_id"),
			inverseJoinColumns = @JoinColumn(name="role_id"))
	private List<Role> roles;
	
	public User() {
		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}

	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}
	
	@PrePersist
	protected void onCreate() {
		this.setCreatedAt(new Date());
	}
	
	@PreUpdate
	protected void onUpdate() {
		this.setUpdatedAt(new Date());
	}

	public List<Week> getWeeks() {
		return weeks;
	}

	public void setWeeks(List<Week> weeks) {
		this.weeks = weeks;
	}

	public List<Recipe> getFavorites() {
		return favorites;
	}

	public void setFavorites(List<Recipe> favorites) {
		this.favorites = favorites;
	}

	public List<Recipe> getShopping() {
		return shopping;
	}

	public void setShopping(List<Recipe> shopping) {
		this.shopping = shopping;
	}

	public List<Diet> getDiets() {
		return diets;
	}

	public void setDiets(List<Diet> diets) {
		this.diets = diets;
	}

	public List<Allergy> getAllergies() {
		return allergies;
	}

	public void setAllergies(List<Allergy> allergies) {
		this.allergies = allergies;
	}

	public Week getSelected() {
		return selected;
	}

	public void setSelected(Week selected) {
		this.selected = selected;
	}
	
	
}
