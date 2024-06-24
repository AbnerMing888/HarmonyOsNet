import { Net } from '@abner/net'
import { AbilityStage } from '@kit.AbilityKit'

export default class App extends AbilityStage {
  onCreate() {
    Net.getInstance().init({
      baseUrl: "https://www.vipandroid.cn",
      codeTag: {
        "code": 0
      },
      resultTag:["items"]
    })
    //Net.getInstance().addNetPlugins(new CustomNetPlugin())
  }
}