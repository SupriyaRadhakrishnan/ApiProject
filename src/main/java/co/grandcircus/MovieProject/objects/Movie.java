package co.grandcircus.MovieProject.objects;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonInclude;


@Entity
@Table(name="movie")
public class Movie {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private int movieid;
	private String title;
	private String overview;
	private double vote_average;
	@Transient
	private Genre[] genres;
	private String genre;
	@Transient
	private String poster_path;
	private String release_date;
	private int runtime;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String original_title) {
		this.title = original_title;
	}
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}
	public double getVote_average() {
		return vote_average;
	}
	public void setVote_average(double vote_average) {
		this.vote_average = vote_average;
	}
	
	public String getRelease_date() {
		return release_date;
	}
	public void setRelease_date(String release_date) {
		this.release_date = release_date;
	}
	public int getRuntime() {
		return runtime;
	}
	public void setRuntime(int runtime) {
		this.runtime = runtime;
	}
	
	public Movie()
	{
		
	}

	public Movie(long id, int movieid, String title, String overview, double vote_average, Genre[] genres, String genre,
			String release_date, int runtime) {
		super();
		this.id = id;
		this.movieid = movieid;
		this.title = title;
		this.overview = overview;
		this.vote_average = vote_average;
		this.genres = genres;
		this.genre = genre;
		this.release_date = release_date;
		this.runtime = runtime;
	}
	public Genre[] getGenres() {
		return genres;
	}	
	public void setGenres(Genre[] genres) {
		this.genres = genres;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public int getMovieid() {
		return movieid;
	}
	public void setMovieid(int movieid) {
		this.movieid = movieid;
	}
	public String getPoster_path() {
		return poster_path;
	}
	public void setPoster_path(String poster_path) {
		this.poster_path = poster_path;
	}
	
}
