package co.grandcircus.MovieProject;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import co.grandcircus.MovieProject.objects.Movie;

@Controller
public class MovieController {
	
	@Autowired 
	MovieApiService movieapi;

	@GetMapping("/")
	private String index (Model model) {
		Movie movie = movieapi.getMovie();
		model.addAttribute("movie", movie);
		System.out.println(movie.getTitle());
		
		MovieResponse movieList = movieapi.getMovieList();
		model.addAttribute("movielist", movieList.getResults());
		
		return "index";
	}
}
