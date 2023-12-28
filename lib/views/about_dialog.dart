import 'package:flutter/material.dart';

class CustomAboutDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Hayvan Resimleri'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Bu uygulama, Flutter framework kullanılarak geliştirilmiştir.'),
            Text('Görüntülenen resimler Pixabay API aracılığıyla sağlanmıştır.'),
            Text('Uygulamanın geliştiricisi: İsmail Hakkı Kemikli'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Kapat'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
