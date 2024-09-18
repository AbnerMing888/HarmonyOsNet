import { Net } from '@abner/net'
import { AbilityStage } from '@kit.AbilityKit'
import { CustomNetPlugin } from './CustomNetPlugin'


export default class App extends AbilityStage {
  onCreate() {
    Net.getInstance().init({
      baseUrl: "https://www.vipandroid.cn",
      plugin: [new CustomNetPlugin()],
      isReadCache: true,
      httpContext: this.context,
      resultTag: ["items"],
    })
    //Net.getInstance().addNetPlugins(new CustomNetPlugin())

  }
}