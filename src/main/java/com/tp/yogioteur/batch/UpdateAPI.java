package com.tp.yogioteur.batch;

import org.springframework.scheduling.annotation.Scheduled;

public class UpdateAPI {
	
	@Scheduled(cron = "0 0/1 * * * *") //새벽 3시 동작("0 0 3 * * *"), 1분마다("0 0/1 * * * *")
	public void execute() {
		
		
		
	}
}
