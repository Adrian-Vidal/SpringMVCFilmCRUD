package com.skilldistillery.film.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

	@RequestMapping(path = "GetFilmById.do", params = "filmId", method = RequestMethod.GET)
	public ModelAndView getFilmById(@RequestParam("filmId") int filmId) {
		ModelAndView mv = new ModelAndView();
		Film film = filmDao.findFilmById(filmId);

		if (film == null) {
			mv.addObject("message", "Film not found with ID: " + filmId);
			mv.setViewName("WEB-INF/error.jsp");
		} else {
			List<Actor> actors = filmDao.findActorsByFilmId(filmId);

			mv.addObject("film", film);
			mv.addObject("actors", actors);
			mv.setViewName("WEB-INF/filmdetail.jsp");
		}
		return mv;

	}

	@RequestMapping(path = "AddFilm.do", method = RequestMethod.POST)
	public ModelAndView addFilm(@ModelAttribute("film") Film film) {

		ModelAndView mv = new ModelAndView();

		try {
			Film newFilm = filmDao.addNewFilm(film);
			mv.addObject("film", newFilm);
			mv.setViewName("WEB-INF/filmdetail.jsp");
		} catch (Exception e) {
			mv.addObject("message", "Failed to add the film");
			mv.setViewName("WEB-INF/error.jsp");
		}

		return mv;

	}

	@RequestMapping(path = "DeleteFilm.do", method = RequestMethod.POST)
	public ModelAndView deleteFilm(@RequestParam("filmId") int filmId) {

		ModelAndView mv = new ModelAndView();
		Film film = filmDao.findFilmById(filmId);

		if (film == null) {
			mv.addObject("message", "Film not found with ID: " + filmId);
			mv.setViewName("WEB-INF/error.jsp");
		} else {
			boolean deleted = filmDao.deleteFilmById(film);
			if (!deleted) {
				mv.addObject("message", "Failed to delete the film");
				mv.setViewName("WEB-INF/error.jsp");

			} else {
				mv.addObject("message", "Film deleted successfully");
				mv.setViewName("WEB-INF/success.jsp");
			}

		}

		return mv;

	}

	@RequestMapping(path = "updateFilm.do", method = RequestMethod.POST)
	public ModelAndView updateFilm(@ModelAttribute("film") Film film) {
		ModelAndView mv = new ModelAndView();

		try {
			Film updatedFilm = filmDao.updateFilm(film);
			if (updatedFilm != null) {
				mv.addObject("film", updatedFilm);
				mv.setViewName("WEB-INF/filmdetail.jsp");
			} else {
				mv.addObject("message", "Failed to update the film.");
				mv.setViewName("WEB-INF/error.jsp");
			}
		} catch (Exception e) {
			mv.addObject("message", "Error occurred while updating the film.");
			mv.setViewName("WEB-INF/error.jsp");
			e.printStackTrace();
		}

		return mv;
	}

	@RequestMapping(path = "updateFilmForm.do", method = RequestMethod.GET)
	public ModelAndView showUpdateFilmForm(@RequestParam("filmId") int id) {
		ModelAndView mv = new ModelAndView();
		Film film = filmDao.findFilmById(id);
		if (film != null) {
			System.out.println("Updating film: " + film);
			mv.addObject("film", film);
			mv.setViewName("WEB-INF/updatefilm.jsp");
		} else {
			mv.addObject("message", "Film not found");
			mv.setViewName("WEB-INF/error.jsp");
		}
		return mv;
	}

	@RequestMapping(path = "GetFilmByKeyword.do", params = "keyword", method = RequestMethod.GET)
	public ModelAndView getFilmByKeyword(@RequestParam("keyword") String keyword) {
		ModelAndView mv = new ModelAndView();
		List<Film> films = filmDao.findFilmByKeyword(keyword);
		if (films.isEmpty()) {
			mv.addObject("message", "No film found matchimg the keyword: " + keyword);
			mv.setViewName("WEB-INF/error.jsp");
		} else {
			mv.addObject("films", films);
			mv.setViewName("WEB-INF/searchresults.jsp");
		}

		return mv;

	}

}
