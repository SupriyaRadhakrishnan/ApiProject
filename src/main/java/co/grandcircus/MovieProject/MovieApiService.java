package co.grandcircus.MovieProject;


import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import co.grandcircus.MovieProject.objects.Movie;

@Service
public class MovieApiService {

	public Movie getMovie(long id) {
	RestTemplate restTemplate = new RestTemplate();
	String url = "https://api.themoviedb.org/3/movie/{id}?api_key=d64119a86692d8a4660991801e7bbf75";
	return restTemplate.getForObject(url, Movie.class,id);
	}
	
	public MovieResponse getMovieList(double rating,int length,int genre,int count) {
		RestTemplate restTemplate = new RestTemplate();
		
		String url = "https://api.themoviedb.org/3/discover/movie?api_key=d64119a86692d8a4660991801e7bbf75&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page={count}&vote_average.gte={rating}&with_runtime.gte={length}";
		if(genre>0)
		{
		url += "&with_genres={genre}";
		}
		return restTemplate.getForObject(url, MovieResponse.class,count,rating,length,genre);
	}
	
	public MovieResponse getMovieListByName(String moviename,int count) {
		RestTemplate restTemplate = new RestTemplate();
		String url = "https://api.themoviedb.org/3/search/movie?api_key=d64119a86692d8a4660991801e7bbf75&language=en-US&query=" + moviename + "&page={count}&include_adult=false";
		
		return restTemplate.getForObject(url, MovieResponse.class,count);
	}
	
	public MovieResponse getTopMoviesList() {
		RestTemplate restTemplate = new RestTemplate();
		String url = "https://api.themoviedb.org/3/movie/top_rated?api_key=d64119a86692d8a4660991801e7bbf75&language=en-US&page=1";
		
		return restTemplate.getForObject(url, MovieResponse.class);
		
	}

}

