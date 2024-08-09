package com.skilldistillery.film.controllers;

import org.springframework.web.bind.annotation.RequestMapping;

public class FilmController {
	
	@RequestMapping(path= {"index.do", "/"})
	public String index() {
		return "index";
	}
}
