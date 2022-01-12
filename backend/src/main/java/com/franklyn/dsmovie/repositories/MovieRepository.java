package com.franklyn.dsmovie.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.franklyn.dsmovie.entities.Movie;

public interface MovieRepository extends JpaRepository<Movie, Long>{
	
}
