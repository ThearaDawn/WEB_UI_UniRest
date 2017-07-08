package com.unirest.ui.service;

import com.unirest.ui.model.User;


public interface UserService {
	
	public User findUserByEmail(String userEmail);
	
}
