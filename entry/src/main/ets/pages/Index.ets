import { DownloadTaskState, GET, Net, NetLoadingDialog, POST } from '@abner/net';
import EntryAbility from '../entryability/EntryAbility';
import promptAction from '@ohos.promptAction';

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
            this.doHttp()
            // Net.get("cert/AbnerGetIndexBanner.php")
            //   .showDialogLoading()
            //   .request<ItemBean[]>((data) => {
            //     console.log("=====" + data.length)
            //   }, (error) => {
            //     console.log("=====" + JSON.stringify(error))
            //   })

            // let json = "{\"code\":0,\"message\":\"你好\"}"
            // let testBean = JSON.parse(json) as TestBean
            // let bean = plainToClass(TestBean, testBean)
            // console.log("===========" + bean.data)
            // bean.log()

            // console.log("==:" + JSON.stringify(testBean))
            // Net.get("https://www.vipandroid.cn/cert/AbnerGetIndexBanner.php")//.setCustomDialogController(this.mCustomDialogController)
            //   .showDialogLoading()
            //   .setConversion(new ItemBean())
            //   .request<ItemBean[]>((data) => {
            //     data[0].test()
            //   }, (error) => {
            //     console.log("====" + JSON.stringify(error))
            //   })

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
    // let result =
    //   await Net.get("https://www.vipandroid.cn/cert/AbnerGetIndexCenter.php")// .returnData<ItemsBean>(ReturnDataType.OBJECT)
    //     .setParams({ "index_type": -1, "size": 1 })
    //     .returnData<ItemBean[]>()

    let string = await this.test()
    console.log("============" + string)
  }

  @POST("cert/AbnerGetIndexBanner.php",{ params: { "params": "nihao" }, isReturnJson: true, isShowLoading: true })
  test(): Promise<string> | undefined {
    return undefined
  }



  down() {
    Net.downLoadFile("http://10.47.26.83:8088/json/14_151_2_8_1719217390000.mp4")
      .setContext(EntryAbility.cx!)
      .setFilePath(EntryAbility.path!)
      .setProgress((receivedSize, totalSize) => {
        //监听下载进度
        console.error("===========Progress:" + receivedSize + "===" + totalSize)
      })
      .request((data) => {
        console.error("===========result:" + JSON.stringify(data))
        if (data == DownloadTaskState.COMPLETE) {
          //下载完成
        }
      }, (err) => {
        console.error("===========" + JSON.stringify(err))
      })
  }
}


class TestBean {
  code?: number
  message?: string
  data?: string = "NIHAO"

  log() {
    console.log("================000")
  }
}

