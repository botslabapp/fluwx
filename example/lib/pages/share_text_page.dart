import 'package:flutter/material.dart';
import 'package:fluwx/fluwx.dart';

class ShareTextPage extends StatefulWidget {
  @override
  _ShareTextPageState createState() => _ShareTextPageState();
}

class _ShareTextPageState extends State<ShareTextPage> {
  String _text = 'share text from fluwx';
  WeChatScene scene = WeChatScene.SESSION;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ShareText'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share, color: Colors.white),
            onPressed: _shareText,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: TextEditingController(text: 'share text from fluwx'),
              onChanged: (str) {
                _text = str;
              },
              decoration: InputDecoration(labelText: 'TextToShare'),
            ),
            Row(
              children: <Widget>[
                const Text('分享至'),
                Row(
                  children: <Widget>[
                    Radio<WeChatScene>(
                      value: WeChatScene.SESSION,
                      groupValue: scene,
                      onChanged: (v) {
                        if (v != null) handleRadioValueChanged(v);
                      },
                    ),
                    const Text('会话')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio<WeChatScene>(
                      value: WeChatScene.TIMELINE,
                      groupValue: scene,
                      onChanged: (v) {
                        if (v != null) handleRadioValueChanged(v);
                      },
                    ),
                    const Text('朋友圈')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Radio<WeChatScene>(
                      value: WeChatScene.FAVORITE,
                      groupValue: scene,
                      onChanged: (v) {
                        if (v != null) handleRadioValueChanged(v);
                      },
                    ),
                    const Text('收藏')
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _shareText() {
    shareToWeChat(WeChatShareTextModel(_text, scene: scene)).then((data) {
      print('-->$data');
    });
  }

  void handleRadioValueChanged(WeChatScene scene) {
    setState(() {
      this.scene = scene;
    });
  }
}
