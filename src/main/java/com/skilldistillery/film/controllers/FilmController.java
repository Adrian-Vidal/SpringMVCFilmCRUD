package com.skilldistillery.film.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.film.dao.FilmDAO;
import com.skilldistillery.film.entities.Actor;
import com.skilldistillery.film.entities.Film;

@Controller
public class FilmController {

	@Autowired
	private FilmDAO filmDao;

	@RequestMapping(path = { "index.do", "/" })
	public String index() {
		return "WEB-INF/index.jsp";
	}
	
	@RequestMapping(path = "GetFilmById.do", params="filmId", method = RequestMethod.GET)
	public ModelAndView getFilmById(int filmId) {
		ModelAndView mv = new ModelAndView();
		Film film = filmDao.findFilmById(filmId);
		
		if (film == null) {
			mv.addObject("message", "Film mot found with ID: " + filmId);
			mv.setViewName("WEB-INF/error.jsp");
		} else {
			List<Actor> actors = filmDao.findActorsByFilmId(filmId);

		mv.addObject("film", film);
		mv.addObject("actors", actors);
		
		//*********Need to create filmDetails.jsp to display the result
		mv.setViewName("WEB-INF/filmDetails.jsp");}
		return mv;
		
	}
	
	@RequestMapping(path = "AddFilm.do", params="film", method = RequestMethod.POST)
	public ModelAndView addFilm(Film film) {
		ModelAndView mv = new ModelAndView();
		Film newFilm = filmDao.addNewFilm(film);
		mv.addObject("film", newFilm);
		
		//*********Need to create filmDetails.jsp to display the result
		mv.setViewName("WEB-INF/filmDetails.jsp");
		return mv;
		
	}
	
	
	
	@RequestMapping(path = "GetFilmByKeyword.do", params="filmId", method = RequestMethod.GET)
	public ModelAndView getFilmByKeyword(String keyWord) {
		ModelAndView mv = new ModelAndView();
		List<Film> films = filmDao.findFilmByKeyword(keyWord);
		mv.addObject("films", films);
		
		//*********Need to create filmLists.jsp to display the result
		mv.setViewName("WEB-INF/filmList.jsp");
		return mv;
		
	}
	
	
	
	

}
