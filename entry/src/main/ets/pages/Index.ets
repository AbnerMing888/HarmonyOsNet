import { ApiResult, DownloadTaskState, Net, NetLoadingDialog, POST, ReturnDataType } from '@abner/net';
import { UploadTaskState } from '@abner/net/src/main/ets/model/UploadTaskState';
import EntryAbility from '../entryability/EntryAbility';

class ApiTest {
  status?: number = 0
  message?: string = ''
}

class ItemBean {
  title?: string
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text("测试")
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            this.doHttp()
          })
      }
      .width('100%')
    }
    .height('100%')
  }

  private doHttp() {
    Net.get("https://www.vipandroid.cn/cert/AbnerGetIndexBanner.php")
      .showDialogLoading()
      .returnData<ApiResult<ApiTest>>()
      .then(() => {
        console.log("==========success")
      })
      .catch(() => {
        console.log("==========fail")
      })
  }
}


