import { NetError, NetErrorInterceptor } from '@abner/net';


class MyNetErrorInterceptor extends NetErrorInterceptor {
  httpError(error: NetError): void {

  }
}