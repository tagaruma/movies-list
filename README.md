# Movies List

A simple app with a list of popular movies that uses [The Movie Database (TMDB) API](https://developers.themoviedb.org/3/getting-started/introduction) to fetch the list and movie details.

## Architecture

This app is an example of MVVM in iOS project.

For movies list a closure connects view model with UI (ViewController.)

However for movie details a different approach has been used, i.e. binding values.
