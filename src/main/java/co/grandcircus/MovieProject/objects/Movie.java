package co.grandcircus.MovieProject.objects;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="movie")
public class Movie {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private String title;
	private String overview;
	private double vote_average;
	private Genre[] genres;
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
	public Movie(long id, String title, String overview, double vote_average, Genre[] genres,
			String release_date, int runtime) {
		super();
		this.id = id;
		this.title = title;
		this.overview = overview;
		this.vote_average = vote_average;
		this.genres = genres;
		this.release_date = release_date;
		this.runtime = runtime;
	}
	public Genre[] getGenres() {
		return genres;
	}
	public void setGenres(Genre[] genres) {
		this.genres = genres;
	}
	
}
