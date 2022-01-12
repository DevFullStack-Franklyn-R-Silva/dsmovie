package com.franklyn.dsmovie.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.franklyn.dsmovie.entities.Score;
import com.franklyn.dsmovie.entities.ScorePK;

public interface ScoreRepository extends JpaRepository<Score, ScorePK>{
	
}
