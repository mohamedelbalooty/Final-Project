import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as p;
import 'package:toast/toast.dart';


class ImageStorageService {
  Future<String> uploadImage(newImagePath, context) async {
    try{
      var firebaseStorage = FirebaseStorage(
          storageBucket: 'gs://flutter-project-f9a07.appspot.com');
      var reference = firebaseStorage.ref().child(p.basename(newImagePath.path));
      var uploadTask = reference.putFile(newImagePath);
      var taskSnapshot = await uploadTask.onComplete;
      var downLoadURL = await taskSnapshot.ref.getDownloadURL();
      var url = downLoadURL.toString();
      return url;
    }catch(exception){
      Toast.show('عفواً! لقد حدث خطأ ما اثناء الارسال', context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }
}
