package com.ldg.springbootJS.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ldg.springbootJS.dto.ResponseDetailDto;
import com.ldg.springbootJS.model.Player;
import com.ldg.springbootJS.model.Team;
import com.ldg.springbootJS.repository.PlayerRepository;
import com.ldg.springbootJS.repository.TeamRepository;

@Configuration
@RequestMapping("/list")
public class ListController {
	
	@Autowired
	private TeamRepository teamRepository;
	
	@Autowired
	private PlayerRepository playerRepository;	

	
	@GetMapping({"/",""})
	public String list() {
		return "list";
	}
	
	@GetMapping("/api/findteam")
	public ResponseEntity<?> findteam() {
		 List<Team> teams = teamRepository.findTeam();
		return new ResponseEntity<List<Team>>(teams,HttpStatus.OK);
	}
	
	@GetMapping("/api/findplayer")
	public ResponseEntity<?> findplayer(@RequestParam("num") String num) {
		 List<Player> players = playerRepository.findPlayer(num);
		return new ResponseEntity<List<Player>>(players,HttpStatus.OK);
	}
	
	@GetMapping("/api/detailplayer")
	public ResponseEntity<?> detailplayer(@RequestParam("num") String num) {		
		ResponseDetailDto rddto = playerRepository.findDetail(num);
		return new ResponseEntity<ResponseDetailDto>(rddto ,HttpStatus.OK);
	}

}
