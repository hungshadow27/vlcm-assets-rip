package com.tgame.moudels.ynZhuadayu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.ynZhuadayu.view.YNzhuadayu_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNzhuadayu_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YNzhuadayu_MsgReceivedProxy";
      
      private var _mediator:YNzhuadayu_Mediator;
      
      public function YNzhuadayu_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([81232],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([81232],NAME);
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
      
      private function get mediator() : YNzhuadayu_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(YNzhuadayu_Mediator.NAME) as YNzhuadayu_Mediator;
         }
         return this._mediator;
      }
      
      public function received_81232(param1:ByteArray) : void
      {
         ZLog.add("81232：返回抓大鱼面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:Boolean = param1.readByte() == 1 ? true : false;
         var _loc5_:Boolean = param1.readByte() == 1 ? true : false;
         this.mediator.setData(_loc2_,_loc3_,_loc4_,_loc5_);
      }
   }
}

