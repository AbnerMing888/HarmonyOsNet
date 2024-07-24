import { ApiResult, CacheType, Net, NetLoadingDialog, NetworkUtils } from '@abner/net';
import { ItemBean } from './ItemsBean';
import { HashMap } from '@kit.ArkTS';

class ApiTest<T> {
  private code?: number = 0
  private msg?: string = ''
  private data?: T | null = null
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  private mCustomDialogController = new CustomDialogController({
    builder: NetLoadingDialog({
      loadingText: '请等待...'
    }),
    autoCancel: false,
    customStyle: true,
    alignment: DialogAlignment.Center
  })

  build() {
    Row() {
      Column() {
        Text(this.message)
        Text("点击")
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {

            Net.get("https://www.vipandroid.cn/cert/AbnerGetIndexBanner.php")//.setCustomDialogController(this.mCustomDialogController)
              .showDialogLoading()
              .request<ItemBean[]>((data) => {
                console.log("=========" + data.length)
              }, (error) => {
                console.log("====" + JSON.stringify(error))
              })

            // Net.get("cert/AbnerGetIndexBanner.ph")
            //   .requestString((data)=>{
            //     console.log("=====" + data)
            //   })
            // this.doHttp()
            // Net.post("cert/AbnerGetIndexCenter.php")
            //   .requestString((data) => {
            //     console.log("=====" + data)
            //   })
          })
      }
      .width('100%')
    }
    .height('100%')
  }

  private async doHttp() {
    let result =
      await Net.get("https://www.vipandroid.cn/cert/AbnerGetIndexCenter.php")// .returnData<ItemsBean>(ReturnDataType.OBJECT)
        .setParams({ "index_type": -1, "size": 1 })
        .returnData<ItemBean[]>()

    console.log("=======" + JSON.stringify(result))
  }
}


class TestBean {
  code?: number
  message?: string
  data?: string
}

