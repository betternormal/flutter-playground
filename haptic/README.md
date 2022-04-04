# Flutter Haptic

**햅틱**은 사용자에게 힘, 진동, 모션을 적용함으로써 터치의 느낌을 구현하는 기술이다. 즉, 컴퓨터의 기능 가운데 사용자의 입력 장치인 키보드, 마우스, 조이스틱, 터치스크린에서 힘과 운동감을 촉각을 통해 느끼게 한다.

햅틱 피드백을 통해 사용자의 `관심`을 얻거나, 작은 버튼을 누를때 `확신`을 줄 수 있다

Flutter에서는 각각 네이티브의 기본적인 기능을 호출하기 때문에 정교한 수정은 불가하다. 아래 가능한 종류의 햅틱이다

- heavyImpact
- lightImpact
- mediumImpact
- selectionClick
- vibrate

```jsx
import 'package:flutter/services.dart';

onPressed: () async {
                HapticFeedback.mediumImpact();
                await controller.toggleStatus();
              },
```

## Ref

[https://api.flutter.dev/flutter/services/HapticFeedback-class.html](https://api.flutter.dev/flutter/services/HapticFeedback-class.html)