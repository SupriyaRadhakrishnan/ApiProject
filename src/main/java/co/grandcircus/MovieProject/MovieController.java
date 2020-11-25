package co.grandcircus.MovieProject;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.grandcircus.MovieProject.objects.Genre;
import co.grandcircus.MovieProject.objects.Movie;

@Controller
public class MovieController {
	
	@Autowired 
	MovieApiService movieapi;
	
	@Autowired
	GenreRepository grep;
	
	@Autowired
	MovieRepository mrep;

	@GetMapping("/")
	private String index (Model model) {

		List<Genre> genre = grep.findAll();
		System.out.println("I am here "+  genre);
		model.addAttribute("genre",genre);
		return "index";
	}
	
	@PostMapping("/search")
	public String search(double rating,int length,@RequestParam(required=false,defaultValue ="0")int genre,Model model)
	{
		
		MovieResponse movieList = movieapi.getMovieList(rating,length,genre);
		System.out.println("INSIDE SEARCH " + movieList);
		model.addAttribute("movielist", movieList.getResults());
		return  "display";
	}
	
	@GetMapping("/details/{id}")
	public String details(@PathVariable("id") long id,Model model)
	{
		Movie movie = movieapi.getMovie(id);
		System.out.println(movie.getTitle());
		model.addAttribute("movie",movie);
		return "details";
	}
	@GetMapping("/addtowatchlist/{id}")
	public String addtowatchlist(@PathVariable("id") long id,Model model)
	{
		Movie movie = movieapi.getMovie(id);
		System.out.println("movie inside addwatchlist");
		System.out.println(movie.getGenres());
		Genre[] genre = movie.getGenres();
		String genval ="";
		for(Genre g:genre)
		{
			genval +=g.getName() + ",";
					
		}		
		movie.setMovieid(((Long)id).intValue());
		movie.setGenre(genval);
		System.out.println(movie.getMovieid());
	    mrep.save(movie);
		return "redirect:/watchlist";
	}
	@GetMapping("/watchlist")
	public String watchlist(Model model)
	{
		List<Movie> movielist = mrep.findAll();
		model.addAttribute("movielist",movielist);
		return "watchlist";
	}
	
	
}
