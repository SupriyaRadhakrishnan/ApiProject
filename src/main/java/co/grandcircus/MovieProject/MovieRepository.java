package co.grandcircus.MovieProject;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.MovieProject.objects.Movie;

public interface MovieRepository extends JpaRepository<Movie, Long>{

}
