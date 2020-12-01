package co.grandcircus.MovieProject;

import java.util.List;

import co.grandcircus.MovieProject.objects.Movie;

public class MovieResponse {
	
	private List<Movie> results;
	private int  total_pages;

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

	public int getTotal_pages() {
		return total_pages;
	}

	public void setTotal_pages(int total_pages) {
		this.total_pages = total_pages;
	}
	
}
