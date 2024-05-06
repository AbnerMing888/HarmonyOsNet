import { Net } from '@abner/net';
import { ItemBean } from './ItemsBean';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            Net.get("https://www.vipandroid.cn/cert/AbnerGetIndexCenter.php")
              .setParams({ "index_type": -1, "size": 1 })
              .requestString((data) => {
                console.log("====" + data)
              }, (error) => {
                console.log("====" + JSON.stringify(error))
              })
            // Net.get("https://www.vipandroid.cn/cert/AbnerGetIndexBanner.php")
            //   .requestObject<ItemsBean>((data) => {
            //     console.log("========" + data.items?.length)
            //   },(error)=>{
            //     console.log("====" + JSON.stringify(error))
            //   })
            // Net.get("https://www.vipandroid.cn/cert/AbnerGetIndexBanner.php")
            //   .request<ItemBean[]>((data) => {
            //     console.log("=========" + data.length)
            //   },(error)=>{
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
    let result =
      await Net.get("https://www.vipandroid.cn/cert/AbnerGetIndexCenter.php")// .returnData<ItemsBean>(ReturnDataType.OBJECT)
        .setParams({ "index_type": -1, "size": 1 })
        .returnData<ItemBean[]>()

    console.log("=======" + JSON.stringify(result))
  }
}

