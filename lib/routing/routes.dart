abstract final class Routes {
  static const home = '/';
  static const community = '/community';
  static const warung = '/warung';
  static const profile = '/profile';
  static const login = '/login';
  static const admin = '/admin';
  static const adminRt = '/admin/rt';
  static const adminRw = '/admin/rw';
  static const adminBlock = '/admin/block';
  static const adminHome = '/admin/home';
  static const adminResident = '/admin/resident';
  static const search = '/$searchRelative';
  static const searchRelative = 'search';
  static const results = '/$resultsRelative';
  static const resultsRelative = 'results';
  static const activities = '/$activitiesRelative';
  static const activitiesRelative = 'activities';
  static const booking = '/$bookingRelative';
  static const bookingRelative = 'booking';
  static String bookingWithId(int id) => '$booking/$id';
}
