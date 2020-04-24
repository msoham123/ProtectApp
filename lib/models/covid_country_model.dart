class CountryModel {
  String countryName;
  String flagImg;
  int totalCases;
  int todayCases;
  int totalDeaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int casesPerOneMillion;
  int deathsPerOneMillion;
  int tests;
  int testsPerOneMillion;

  CountryModel({
    this.countryName,
    this.flagImg,
    this.totalCases,
    this.todayCases,
    this.totalDeaths,
    this.todayDeaths,
    this.recovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
  });
}
