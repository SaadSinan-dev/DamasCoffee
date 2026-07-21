abstract final class ErrorMessages {
  const ErrorMessages._();

  static const String unexpected = 'Something went wrong. Please try again.';

  static const String server = 'Server error. Please try again later.';

  static const String network =
      'No internet connection. Please check your network and try again.';

  static const String timeout = 'Request timed out. Please try again.';

  static const String unauthorized =
      'You are not authorized to perform this action.';

  static const String forbidden =
      'You do not have permission to access this resource.';

  static const String notFound = 'Requested data was not found.';

  static const String emptyData = 'No data available.';

  static const String cache = 'Failed to load cached data.';
}
