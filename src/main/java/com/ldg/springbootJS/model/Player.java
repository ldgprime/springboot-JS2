package com.ldg.springbootJS.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Player {
	private int id;
	private String playername;
	private int teamId;	
	
	@Builder	
	public Player(String playername, int teamId) {
		this.playername = playername;
		this.teamId = teamId;
	}

	
	
}
