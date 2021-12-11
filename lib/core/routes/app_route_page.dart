import 'package:get/route_manager.dart';
import 'package:note_app/view/addnote/add_note_view.dart';
import 'package:note_app/view/notepagedetail/note_page_detail_view.dart';
import '../../view/mainnotepageview/main_note_page_view.dart';
import 'app_route_name.dart';

class AppRoutePages {
  static final pages = [
    GetPage(
      name: AppRoutesName.initial,
      page: () => MainNotePageView(),
    ),
    GetPage(
      name: AppRoutesName.notePageDateil,
      page: () => NotePageDetailView(),
    ),
    GetPage(
      name: AppRoutesName.addNoteView,
      page: () => AddNoteView(),
    )
  ];
}
