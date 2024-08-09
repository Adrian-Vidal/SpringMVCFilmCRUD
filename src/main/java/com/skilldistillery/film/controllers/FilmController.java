package com.skilldistillery.film.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.film.dao.FilmDAO;

public class FilmController {
	
	@Autowired
	private FilmDAO filmDao;
	
	@RequestMapping(path= {"index.do", "/"})
	public String index() {
		return "index";
	}
}
