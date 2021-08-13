// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `The TMDB Test Run!`
  String get appTitle {
    return Intl.message(
      'The TMDB Test Run!',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }

  /// `Your favorite movies :3`
  String get favoriteMoviesPageTitle {
    return Intl.message(
      'Your favorite movies :3',
      name: 'favoriteMoviesPageTitle',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get inputLoginField {
    return Intl.message(
      'Username',
      name: 'inputLoginField',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get inputPasswordField {
    return Intl.message(
      'Password',
      name: 'inputPasswordField',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get inputLoginButton {
    return Intl.message(
      'Login',
      name: 'inputLoginButton',
      desc: '',
      args: [],
    );
  }

  /// `Invalid login credentials`
  String get loginErrorMensage {
    return Intl.message(
      'Invalid login credentials',
      name: 'loginErrorMensage',
      desc: '',
      args: [],
    );
  }

  /// `Loading movies :3`
  String get loadingText {
    return Intl.message(
      'Loading movies :3',
      name: 'loadingText',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load movies )-:`
  String get errorText {
    return Intl.message(
      'Failed to load movies )-:',
      name: 'errorText',
      desc: '',
      args: [],
    );
  }

  /// `New movies from this week.`
  String get homeTitle_0 {
    return Intl.message(
      'New movies from this week.',
      name: 'homeTitle_0',
      desc: '',
      args: [],
    );
  }

  /// `Favorite movies.`
  String get homeTitle_1 {
    return Intl.message(
      'Favorite movies.',
      name: 'homeTitle_1',
      desc: '',
      args: [],
    );
  }

  /// `Seems like you don't have any favorite movie added )-:`
  String get homeNoFavoriteMovie {
    return Intl.message(
      'Seems like you don\'t have any favorite movie added )-:',
      name: 'homeNoFavoriteMovie',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get homeButton_0 {
    return Intl.message(
      'See all',
      name: 'homeButton_0',
      desc: '',
      args: [],
    );
  }

  /// `Release Date`
  String get releaseDate {
    return Intl.message(
      'Release Date',
      name: 'releaseDate',
      desc: '',
      args: [],
    );
  }

  /// `Movie Details`
  String get movieDetails {
    return Intl.message(
      'Movie Details',
      name: 'movieDetails',
      desc: '',
      args: [],
    );
  }

  /// `Overview`
  String get overview {
    return Intl.message(
      'Overview',
      name: 'overview',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'pt'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
