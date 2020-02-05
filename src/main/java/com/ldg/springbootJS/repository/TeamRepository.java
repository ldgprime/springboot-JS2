package com.ldg.springbootJS.repository;

import java.util.List;

import com.ldg.springbootJS.model.Team;

public interface TeamRepository {
	
	List<Team> findTeam();
}
