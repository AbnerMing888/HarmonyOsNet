import { Net } from '@abner/net'
import { AbilityStage } from '@kit.AbilityKit'
import { CustomNetPlugin } from './CustomNetPlugin'


export default class App extends AbilityStage {
  onCreate() {
    Net.getInstance().init({
      baseUrl: "https://www.wanandroid.com",
      plugin: [new CustomNetPlugin()],
      isReadCache: true,
      cacheBundleName:"com.abner.net",
      httpContext: this.context,
      isMemoryKVStore: false,
      cacheDir: this.context.cacheDir + "/abner"
    })
  }
}