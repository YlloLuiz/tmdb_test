// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appTitle": MessageLookupByLibrary.simpleMessage("The TMDB Test Run!"),
        "errorText":
            MessageLookupByLibrary.simpleMessage("Failed to load movies )-:"),
        "favoriteMoviesPageTitle":
            MessageLookupByLibrary.simpleMessage("Your favorite movies :3"),
        "homeButton_0": MessageLookupByLibrary.simpleMessage("See all"),
        "homeNoFavoriteMovie": MessageLookupByLibrary.simpleMessage(
            "Seems like you don\'t have any favorite movie added )-:"),
        "homeTitle_0":
            MessageLookupByLibrary.simpleMessage("New movies from this week."),
        "homeTitle_1": MessageLookupByLibrary.simpleMessage("Favorite movies."),
        "inputLoginButton": MessageLookupByLibrary.simpleMessage("Login"),
        "inputLoginField": MessageLookupByLibrary.simpleMessage("Username"),
        "inputPasswordField": MessageLookupByLibrary.simpleMessage("Password"),
        "loadingText":
            MessageLookupByLibrary.simpleMessage("Loading movies :3"),
        "loginErrorMensage":
            MessageLookupByLibrary.simpleMessage("Invalid login credentials"),
        "movieDetails": MessageLookupByLibrary.simpleMessage("Movie Details"),
        "overview": MessageLookupByLibrary.simpleMessage("Overview"),
        "releaseDate": MessageLookupByLibrary.simpleMessage("Release Date")
      };
}
