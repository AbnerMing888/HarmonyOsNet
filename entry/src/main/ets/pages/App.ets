import { Net } from '@abner/net'
import { AbilityStage } from '@kit.AbilityKit'
import { CustomNetPlugin } from './CustomNetPlugin'


export default class App extends AbilityStage {
  onCreate() {
    Net.getInstance().init({
      baseUrl: "http://10.47.18.86:8888",
      plugin: [new CustomNetPlugin()],
      isReadCache: true,
      httpContext: this.context
    })
    //Net.getInstance().addNetPlugins(new CustomNetPlugin())

  }
}