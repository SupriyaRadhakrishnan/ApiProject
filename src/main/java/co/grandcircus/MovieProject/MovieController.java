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

	private double mrating =0;
	private int mlength =0;
	private int mgenre;
	private String mmoviename="";
	
	@GetMapping("/")
	private String index (Model model) {
		
		mrating = 0;
		mlength = 0;
		mgenre = 0;
		List<Genre> genre = grep.findAll();
		System.out.println("I am here "+  genre);
		model.addAttribute("genre",genre);
		MovieResponse movieList = movieapi.getTopMoviesList();
		model.addAttribute("movielist", movieList.getResults());
		return "index";
	}
	
	@PostMapping("/search")
	public String search(double rating,int length,@RequestParam(required=false,defaultValue ="0")int genre,Model model)
	{
		mrating = rating;
		mlength = length;
		mgenre = genre;
		int beginindex =1;
		MovieResponse movieList = movieapi.getMovieList(rating,length,genre,1);
		System.out.println("INSIDE SEARCH " + movieList);
		model.addAttribute("movielist", movieList.getResults());
		model.addAttribute("totalpages", movieList.getTotal_pages());
		model.addAttribute("beginindex",beginindex);
		return  "display";
	}
	
	@GetMapping("/search/{beginindex}/{count}")
	public String search(@PathVariable("beginindex")  int beginindex,@PathVariable("count")  int count,Model model)
	{
		MovieResponse movieList = movieapi.getMovieList(mrating,mlength,mgenre,count);
		System.out.println("INSIDE SEARCH " + movieList);
		model.addAttribute("movielist", movieList.getResults());
		model.addAttribute("totalpages", movieList.getTotal_pages());
		model.addAttribute("beginindex",beginindex);
		System.out.println("beginindex " + beginindex);
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
	@GetMapping("/watchlistdetails/{id}")
	public String watchlistdetails(@PathVariable("id") long id,Model model)
	{
		Movie movie = movieapi.getMovie(id);
		System.out.println(movie.getTitle());
		model.addAttribute("movie",movie);
		return "watchlistdetails";
	}
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") long id,Model model)
	{	
		mrep.deleteById(id);
		return "redirect:/watchlist";
	}
	
	@PostMapping("/searchbymoviename")
	public String searchbymoviename (@RequestParam String moviename, Model model) {
		mmoviename = moviename;
		MovieResponse movieList = movieapi.getMovieListByName(moviename,1);
		System.out.println("INSIDE SEARCH " + movieList);
		model.addAttribute("beginindex",1);
		model.addAttribute("totalpages", movieList.getTotal_pages());
		model.addAttribute("movielist", movieList.getResults());
		model.addAttribute("byname","byname");
		return  "display";
	}
	
	@GetMapping("/searchbymoviename/{beginindex}/{count}")
	public String searchbymoviename1(@PathVariable("beginindex")  int beginindex,@PathVariable("count")  int count,Model model) {
		System.out.println("Hello");
		MovieResponse movieList = movieapi.getMovieListByName(mmoviename,count);
		System.out.println("INSIDE SEARCH " + movieList);
		model.addAttribute("movielist", movieList.getResults());
		model.addAttribute("totalpages", movieList.getTotal_pages());
		model.addAttribute("beginindex",beginindex);
		model.addAttribute("byname","byname");
		System.out.println("movieList " + movieList.getResults());
		return  "display";
	}
}