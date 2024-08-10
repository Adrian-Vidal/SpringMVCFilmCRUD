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

	@RequestMapping(path = "GetFilmById.do", params = "filmId", method = RequestMethod.GET)
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

			// *********Need to create filmDetails.jsp to display the result
			mv.setViewName("WEB-INF/filmDetails.jsp");
		}
		return mv;

	}

	@RequestMapping(path = "AddFilm.do", method = RequestMethod.POST)
	public ModelAndView addFilm(Film film) {

		ModelAndView mv = new ModelAndView();

		try {
			filmDao.addNewFilm(film);
			mv.addObject("film", film);
		} catch (Exception e) {
			mv.addObject("message", "Failed to add the film");
			mv.setViewName("WEB-INF/error.jsp");
		}
		Film newFilm = filmDao.addNewFilm(film);
		mv.addObject("film", newFilm);

		// *********Need to create filmDetails.jsp to display the result
		mv.setViewName("WEB-INF/filmDetails.jsp");
		return mv;

	}

	@RequestMapping(path = "DeleteFilm.do", method = RequestMethod.POST)
	public ModelAndView deleteFilm(int filmId) {

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
	public ModelAndView updateFilm(Film film) {
		ModelAndView mv = new ModelAndView();
		Film updatedFilm = filmDao.findFilmById(film.getId());
		if (updatedFilm == null) {
			mv.addObject("message", "Film not found with ID: " + film.getId());
			mv.setViewName("WEB-INF/error.jsp");
		} else {
			updatedFilm.setTitle(film.getTitle());
			updatedFilm.setDescription(film.getDescription());
			updatedFilm.setReleaseYear(film.getReleaseYear());
			updatedFilm.setLanguageId(film.getLanguageId());
			updatedFilm.setRentalDuration(film.getRentalDuration());
			updatedFilm.setRentalRate(film.getRentalRate());
			updatedFilm.setLength(film.getLength());
			updatedFilm.setReplacementCost(film.getReplacementCost());
			updatedFilm.setRating(film.getRating());
			updatedFilm.setSpecialFeatures(film.getSpecialFeatures());

			try {
				filmDao.addNewFilm(updatedFilm);
				mv.addObject("film", updatedFilm);
				mv.setViewName("WEB-INF/filmDetail.jsp");
			} catch (Exception e) {
				mv.addObject("message", "Failed to update the film.");
				mv.setViewName("WEB-INF/error.jsp");
			}
		}
		return mv;
	}

	@RequestMapping(path = "GetFilmByKeyword.do", params = "filmId", method = RequestMethod.GET)
	public ModelAndView getFilmByKeyword(String keyWord) {
		ModelAndView mv = new ModelAndView();
		List<Film> films = filmDao.findFilmByKeyword(keyWord);
		if (films.isEmpty()) {
			mv.addObject("message", "No film found matchimg the keyword: " + keyWord);
			mv.setViewName("WEB-INF/error.jsp");
		} else {
			mv.addObject("films", films);

			// *********Need to create filmLists.jsp to display the result
			mv.setViewName("WEB-INF/filmList.jsp");
		}

		return mv;

	}

}
