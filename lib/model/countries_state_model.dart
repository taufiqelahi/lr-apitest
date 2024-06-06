import 'dart:convert';
import 'package:http/http.dart' as http;

class CountryInfo {
  final int? id;
  final String? iso2;
  final String? iso3;
  final double? lat;
  final double? long;
  final String? flag;

  CountryInfo({
    this.id,
    this.iso2,
    this.iso3,
    this.lat,
    this.long,
    this.flag,
  });

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    return CountryInfo(
      id: json['_id'],
      iso2: json['iso2'],
      iso3: json['iso3'],
      lat: json['lat']?.toDouble(),
      long: json['long']?.toDouble(),
      flag: json['flag'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'iso2': iso2,
      'iso3': iso3,
      'lat': lat,
      'long': long,
      'flag': flag,
    };
  }
}

class CountriesState {
  final int? updated;
  final String? country;
  final CountryInfo? countryInfo;
  final int? cases;
  final int? todayCases;
  final int? deaths;
  final int? todayDeaths;
  final int? recovered;
  final int? todayRecovered;
  final int? active;
  final int? critical;
  final double? casesPerOneMillion;
  final double? deathsPerOneMillion;
  final int? tests;
  final double? testsPerOneMillion;
  final int? population;
  final String? continent;
  final int? oneCasePerPeople;
  final int? oneDeathPerPeople;
  final int? oneTestPerPeople;
  final double? activePerOneMillion;
  final double? recoveredPerOneMillion;
  final double? criticalPerOneMillion;

  CountriesState({
    this.updated,
    this.country,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.continent,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.activePerOneMillion,
    this.recoveredPerOneMillion,
    this.criticalPerOneMillion,
  });

  factory CountriesState.fromJson(Map<String, dynamic> json) {
    return CountriesState(
      updated: json['updated'],
      country: json['country'],
      countryInfo: CountryInfo.fromJson(json['countryInfo']),
      cases: json['cases'],
      todayCases: json['todayCases'],
      deaths: json['deaths'],
      todayDeaths: json['todayDeaths'],
      recovered: json['recovered'],
      todayRecovered: json['todayRecovered'],
      active: json['active'],
      critical: json['critical'],
      casesPerOneMillion: json['casesPerOneMillion']?.toDouble(),
      deathsPerOneMillion: json['deathsPerOneMillion']?.toDouble(),
      tests: json['tests'],
      testsPerOneMillion: json['testsPerOneMillion']?.toDouble(),
      population: json['population'],
      continent: json['continent'],
      oneCasePerPeople: json['oneCasePerPeople'],
      oneDeathPerPeople: json['oneDeathPerPeople'],
      oneTestPerPeople: json['oneTestPerPeople'],
      activePerOneMillion: json['activePerOneMillion']?.toDouble(),
      recoveredPerOneMillion: json['recoveredPerOneMillion']?.toDouble(),
      criticalPerOneMillion: json['criticalPerOneMillion']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'updated': updated,
      'country': country,
      'countryInfo': countryInfo?.toJson(),
      'cases': cases,
      'todayCases': todayCases,
      'deaths': deaths,
      'todayDeaths': todayDeaths,
      'recovered': recovered,
      'todayRecovered': todayRecovered,
      'active': active,
      'critical': critical,
      'casesPerOneMillion': casesPerOneMillion,
      'deathsPerOneMillion': deathsPerOneMillion,
      'tests': tests,
      'testsPerOneMillion': testsPerOneMillion,
      'population': population,
      'continent': continent,
      'oneCasePerPeople': oneCasePerPeople,
      'oneDeathPerPeople': oneDeathPerPeople,
      'oneTestPerPeople': oneTestPerPeople,
      'activePerOneMillion': activePerOneMillion,
      'recoveredPerOneMillion': recoveredPerOneMillion,
      'criticalPerOneMillion': criticalPerOneMillion,
    };
  }

  @override
  String toString() {
    return 'CountriesState{country: $country, cases: $cases, deaths: $deaths, recovered: $recovered}';
  }
}
