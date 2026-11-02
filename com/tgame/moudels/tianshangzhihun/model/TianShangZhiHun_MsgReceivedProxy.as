package com.tgame.moudels.tianshangzhihun.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.tianshangzhihun.view.TianShangZhiHun_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TianShangZhiHun_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "TianShangZhiHun_MsgReceivedProxy";
      
      private var _tianshangzhihunMediator:TianShangZhiHun_Mediator;
      
      public function TianShangZhiHun_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      private function get tianshangzhihunMediator() : TianShangZhiHun_Mediator
      {
         if(!this._tianshangzhihunMediator)
         {
            this._tianshangzhihunMediator = facade.retrieveMediator(TianShangZhiHun_Mediator.NAME) as TianShangZhiHun_Mediator;
         }
         return this._tianshangzhihunMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([71812],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([71812],NAME);
      }
      
      private function receivedMsgHandle(param1:Notification) : void
      {
         var _loc2_:* = param1.name;
         var _loc3_:ByteArray = param1.body as ByteArray;
         if(this.hasOwnProperty("received_" + _loc2_))
         {
            this["received_" + _loc2_](_loc3_);
         }
         else
         {
            ZLog.add("协议号" + _loc2_ + "不存在");
         }
      }
      
      public function received_71812(param1:ByteArray) : void
      {
         ZLog.add("71812：返回结果");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.tianshangzhihunMediator.getItem();
         }
      }
   }
}

