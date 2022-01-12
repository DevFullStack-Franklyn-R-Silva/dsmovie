package com.franklyn.dsmovie.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.franklyn.dsmovie.entities.User;

public interface UserRepository extends JpaRepository<User, Long>{
	
	User findByEmail(String email);
}
