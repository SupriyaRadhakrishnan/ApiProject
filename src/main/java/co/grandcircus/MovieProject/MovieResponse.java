package co.grandcircus.MovieProject;

import java.util.List;

import co.grandcircus.MovieProject.objects.Movie;

public class MovieResponse {
	
	private List<Movie> results;

	public List<Movie> getResults() {
		return results;
	}

	public void setResults(List<Movie> results) {
		this.results = results;
	}

	public MovieResponse(List<Movie> results) {
		super();
		this.results = results;
	}
	
	public MovieResponse() {
	}
	
}
