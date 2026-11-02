package com.tgame.moudels.yn2014zhongqiu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.yn2014zhongqiu.view.YN2014Zhongqiu_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YN2014Zhongqiu_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YN2014Zhongqiu_MsgReceivedProxy";
      
      private var _mediator:YN2014Zhongqiu_Mediator;
      
      public function YN2014Zhongqiu_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([74602],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([74602],NAME);
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
      
      private function get mediator() : YN2014Zhongqiu_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(YN2014Zhongqiu_Mediator.NAME) as YN2014Zhongqiu_Mediator;
         }
         return this._mediator;
      }
      
      public function received_74602(param1:ByteArray) : void
      {
         ZLog.add("74602：返回世界杯排行榜信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:int = param1.readInt();
         this.mediator.setData(_loc2_,_loc3_,_loc4_,_loc5_);
      }
   }
}

