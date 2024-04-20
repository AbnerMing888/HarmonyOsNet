import { Net } from '@abner/net';

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
            Net.get("http://10.47.26.83:8088/json/json.txt")
              .request<boolean>((data) => {
                console.log("====" + data)
              })
            // Net.get("https://www.vipandroid.cn/cert/AbnerGetIndexBanner.php")
            //   .requestObject<ItemsBean>((data) => {
            //     console.log("========" + data.message)
            //   })
            // Net.get("https://www.vipandroid.cn/cert/AbnerGetIndexBanner.php")
            //   .request<Array<ItemsBean2>>((data) => {
            //     console.log("========="+data.length)
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

  async doHttp() {
    // let data = await Net.get("https://www.vipandroid.cn/cert/AbnerGetIndexBanner.php")
    //   .setConversion(new ItemsBean())
    //   .returnData<ItemsBean>(ReturnDataType.OBJECT)
    //
    //
    // Net.get("https://www.vipandroid.cn/cert/AbnerGetIndexBanner.php")

  }
}