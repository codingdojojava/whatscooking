package com.codingdojo.whatscooking.validators;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.codingdojo.whatscooking.models.User;


@Component
public class UserValidator implements Validator{
	@Override
	public boolean supports(Class<?> clazz) {
		return User.class.equals(clazz);
	}
	
	@Override
	public void validate(Object object, Errors errors) {
		User user = (User) object;
		
		Pattern p = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$", Pattern.CASE_INSENSITIVE);
		Matcher m = p.matcher(user.getUsername());
		if(!m.find()) {
			errors.rejectValue("username", "Match");
		}
		
		if(!user.getPasswordConfirmation().equals(user.getPassword())) {
			errors.rejectValue("passwordConfirmation", "Match");
		}
	}
}
