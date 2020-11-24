package co.grandcircus.MovieProject;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.MovieProject.objects.Genre;


public interface GenreRepository extends JpaRepository<Genre, Long>{

}
