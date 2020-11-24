package co.grandcircus.MovieProject;

import java.util.Arrays;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import co.grandcircus.MovieProject.objects.Movie;

@Service
public class MovieApiService {

	public Movie getMovie() {
	RestTemplate restTemplate = new RestTemplate();
	String url = "https://api.themoviedb.org/3/movie/550?api_key=d64119a86692d8a4660991801e7bbf75";
	return restTemplate.getForObject(url, Movie.class);
	}
	
	public MovieResponse getMovieList() {
		RestTemplate restTemplate = new RestTemplate();
		String url = "https://api.themoviedb.org/3/discover/movie?api_key=d64119a86692d8a4660991801e7bbf75&language=en-US&page=2";
		return restTemplate.getForObject(url, MovieResponse.class);
	}
	
}
