import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart';
import 'package:workhours/common/services/app_permissions.dart';

class PdfApi {
  static Future<File> saveFileToCustomPath({
    required String name,
    required Document pdf,
  }) async {
    late File file;
    try {
      // Get the external storage directory
      await AppPermissions.askLocalStoragePermission().then((value) async {
        Directory externalDir = Directory("");
        if (Platform.isAndroid) {
          // Redirects it to download folder in android
          externalDir = Directory("/storage/emulated/0/Mnawbat4");
        } else {
          externalDir = await getApplicationDocumentsDirectory();
        }

        // Create the custom directory if it doesn't exist
        Directory customDirectory = Directory(externalDir.path);
        if (!await customDirectory.exists()) {
          await customDirectory.create(recursive: true);
        }

        // Create a file inside the custom directory
        file = File("${customDirectory.path}/mnawbat-${DateTime.now()}.pdf");

        // Write the data to the file
        await file.writeAsBytes(await pdf.save());

        print('File saved to custom path: ${file.path}');
        return file;
      });
      return file;
    } catch (e) {
      print('Error saving file: $e');
      throw "${e}";
    }
  }

  static Future<File> saveDocument({
    required String name,
    required Document pdf,
  }) async {
    late final file;

    final bytes = await pdf.save();

    final dir = await getApplicationDocumentsDirectory();
    file = File('${dir.path}/$name');
    print(file.path);

    await file.writeAsBytes(bytes);

    return file;
  }

  static Future openFile(File file) async {
    // final url = file.path;

    // await OpenFile.open(url);
  }
}
