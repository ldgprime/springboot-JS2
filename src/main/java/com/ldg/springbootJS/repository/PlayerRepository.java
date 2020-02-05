package com.ldg.springbootJS.repository;

import java.util.List;

import com.ldg.springbootJS.dto.ResponseDetailDto;
import com.ldg.springbootJS.model.Player;


public interface PlayerRepository {

	List<Player> findPlayer(String num);
	
	ResponseDetailDto findDetail(String num);
}
