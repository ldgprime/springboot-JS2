package com.ldg.springbootJS.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Team {
	private int id;
	private String name;
	private int year;	
	
	@Builder
	public Team(String name, int year) {
		this.name = name;
		this.year = year;
	}

	
	
}

