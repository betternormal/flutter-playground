# web_view

![스크린샷 2022-01-28 14 16 23](https://user-images.githubusercontent.com/64571546/151493828-5554260c-2472-4f25-a3a8-f13f306f2740.png)

flutter에서 웹페이지를 보여주거나 웹페이지의 기능을 사용해야할 때 사용한다.

- 웹페이지의 기능을 flutter로 구현하기 힘든경우
- 타사의 서비스를 사용하는데 플러터 패키지가 없는경우

### HTTP 허용

네이티브에서는 네트워크 보안정책으로 http프로토콜을 수신하지 않는다. 아래 설정으로 임의로 허용할 수 있다.

Naver와같은 대형포털도 데이터 송수신이 없거나 보안문제가 없는 페이지에서는 http를 사용하기 때문에 확인후 해당url에서의 http를 허용해주는 설정을 해야한다.

### Android

```text
/android/app/src/main/AndroidManifest.xml

<application
        android:name="io.flutter.app.FlutterApplication"
        android:label="flutterdemo"
        android:icon="@mipmap/ic_launcher"
        android:usesCleartextTraffic="true">     <--- 추가
```

### IOS

```text
/ios/Runner/Info.plist

<key>NSAppTransportSecurity</key>
<dict>
  <key>NSAllowsArbitraryLoads</key>
  <true/>
  <key>NSAllowsArbitraryLoadsInWebContent</key>
  <true/>
</dict>
```

### 웹뷰와 네이티브간 데이터 송수신

JavascriptChannel가 사용됨

```dart
// 웹뷰에서 네이티브로 데이터 전송
JavaScriptChannel.postMessage("Hello from JS");

// 네이티브에서 웹뷰데이터 수신
WebView(
    initialUrl: "http://192.168.0.104:8080/kchoiCustomUploadTest",
    onWebViewCreated: (WebViewController webviewController) {
        _controller = webviewController;
    },
    javascriptMode: JavascriptMode.unrestricted,
    javascriptChannels: Set.from([
        JavascriptChannel(
            name: 'JavaScriptChannel',
            onMessageReceived: (JavascriptMessage message) {
            print(message.message); // 여기서 데이터가 print된다
            })
    ]),
)
```

```dart
// 웹뷰에 네이티브에서 호출할 함수 선언
function fromFlutter(newTitle) {
		document.getElementById("title").innerHTML = newTitle;
}

// 네이티브에서 데이터를 담아 웹뷰 함수호출
onPressed: () {
    if (_controller != null) {
      _controller!.evaluateJavascript(
          'window.fromFlutter("this is title from Flutter")');
    }
  },
```
