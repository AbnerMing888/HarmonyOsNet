import {
  ApiResult,
  CacheType,
  CacheUtils,
  DownloadTaskState,
  GET,
  Net,
  NetLoadingDialog,
  POST,
  ReturnDataType
} from '@abner/net';
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
  @State message: string = '测试请求';

  build() {
    Row() {
      Column() {
        Button("测试")
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

    Net.get("http://restapi.amap.com/v3/geocode/regeo?key=52c144feef578d26b9e94c81f135fc57&location=113.22721131887067,41.15134279924659&extensions=all&roadlevel=0&homeorcorp=0")
      .setNetworkIntercept(false)
      .setErrorIntercept(false)
      .setCacheType(CacheType.FIRST_REMOTE)
      .requestString((data: string) => {
        console.log("====" + data)
      }, (err) => {
        console.log("====错误" + err.getMessage())
      })

  }
}


