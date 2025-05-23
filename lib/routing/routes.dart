abstract final class Routes {
  static const home = '/';
  static const community = '/community';
  static const warung = '/warung';
  static const profile = '/profile';
  static const login = '/login';
  static const admin = '/admin';
  static const String houseList = '/houses';
  static const String houseDetail = '/houses/detail';
  static const String houseCreate = '/houses/create';
  static const String houseEdit = '/houses/edit';
  static const adminAnnouncment = '/admin/announcement';
  static const adminAnnouncmentCreate = '/admin/announcement/create';
  static const adminAnnouncmentUpdate = '/admin/announcement/update';
  static const adminRondaGroup = '/admin/ronda-group';
  static const adminRondaGroupCreate = '/admin/ronda-group/create';
  static const adminRondaGroupUpdate = '/admin/ronda-group/update';
  static const adminRondaSchedule = '/admin/schedule';
  static const adminRondaScheduleCreate = '/admin/schedule/create';
  static const adminRondaScheduleUpdate = '/admin/schedule/update';
  static const adminHosuingArea = '/admin/housing-area';
  static const adminHosuingAreaCreate = '/admin/housing-area/create';
  static const adminHosuingAreaUpdate = '/admin/housing-area/update';
  static const adminRt = '/admin/rt';
  static const adminRw = '/admin/rw';
  static const adminRwCreate = '/admin/rw/create';
  static const adminRwUpdate = '/admin/rw/update';
  static const adminBlock = '/admin/block';
  static const adminBlockCreate = '/admin/block/create';
  static const adminBlockUpdate = '/admin/block/update';
  static const adminHome = '/admin/home';
  static const adminResident = '/admin/resident';
  static const adminResidentCreate = '/admin/resident/create';
  static const adminResidentEdit = '/admin/resident/edit';
  static const search = '/$searchRelative';
  static const announcement = '/announcement';
  static const announcementCreate = '/announcement/create';
  static const announcementDetail = '/announcement/detail';
  static const item = '/item';
  static const itemCreate = '/item/create';
  static const itemUpdate = '/item/update';
  static const iplRate = '/ipl_rate';
  static const iplRateDetail = '/ipl_rate/detail';
  static const iplRateCreate = '/ipl_rate/create';
  static const iplRateUpdate = '/ipl_rate/update';
  static const iplBill = '/ipl_bill';
  static const searchRelative = 'search';
  static const notifications = '/notifications';
  static const results = '/$resultsRelative';
  static const resultsRelative = 'results';
  static const activities = '/$activitiesRelative';
  static const activitiesRelative = 'activities';
  static const booking = '/$bookingRelative';
  static const bookingRelative = 'booking';
  static String bookingWithId(int id) => '$booking/$id';
}
