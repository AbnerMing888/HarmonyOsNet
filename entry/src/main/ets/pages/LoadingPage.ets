import { NetLoadingDialog } from '@abner/net';

/**
 * AUTHOR:AbnerMing
 * DATE:2024/7/23
 * INTRODUCE:全局dialog
 * */

@Entry
@Component
struct LoadingPage {
  build() {
    RelativeContainer() {
      NetLoadingDialog()
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
    }
    .height('100%')
    .width('100%')
    .backgroundColor(0x88000000)
  }
}