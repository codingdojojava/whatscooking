package com.codingdojo.whatscooking.services;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.codingdojo.whatscooking.models.User;
import com.codingdojo.whatscooking.repositories.RoleRepo;
import com.codingdojo.whatscooking.repositories.UserRepo;


@Service
public class WhatsCookingServices {
    private UserRepo userRepository;
    private RoleRepo roleRepository;
    private BCryptPasswordEncoder bCryptPasswordEncoder;
    
    public WhatsCookingServices(UserRepo userRepository, RoleRepo roleRepository, BCryptPasswordEncoder bCryptPasswordEncoder)     {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }
    
    
    // 1
    public void saveWithUserRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_USER"));
        userRepository.save(user);
    }
     
     // 2 
    public void saveUserWithAdminRole(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(roleRepository.findByName("ROLE_ADMIN"));
        userRepository.save(user);
    }    
    
    // 3
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}
