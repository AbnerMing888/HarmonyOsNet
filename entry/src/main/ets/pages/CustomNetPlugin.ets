/**
 * AUTHOR:AbnerMing
 * DATE:2023/10/24
 * INTRODUCE:网络库插件 处理接口加密，动态获取header
 * */
import { BaseNetPlugin, Net, NetError, NetRequest } from '@abner/net';
import http from '@ohos.net.http';

export class CustomNetPlugin extends BaseNetPlugin {
  willSendRequest(request: NetRequest): void {

  }

  didReceive(result: http.HttpResponse): void {

  }

  error(request: NetRequest, response: http.HttpResponse, error: NetError): void {
  }

  prepareRequest(request: NetRequest): Promise<NetRequest> {
    return new Promise((resolve: Function) => {
      resolve(request)
    });
  }


  processResult(request: NetRequest, result: http.HttpResponse): Promise<http.HttpResponse> {

    return new Promise((resolve: Function) => {
      resolve(result)
    });
  }
}
