class Character {
  late String name;
  late String image;
  late String description;
  late int comics;
  late int series;
  late int stories;
  late int events;
  late dynamic tres_primeras_series;

  Character(name, image, description, comics, series, stories, events,
      tres_primeras_series) {
    this.name = name;
    this.image = image;
    this.description = description;
    this.comics = comics;
    this.series = series;
    this.stories = stories;
    this.events = events;
    this.tres_primeras_series = tres_primeras_series;
  }
}
