package com.tgame.moudels.timebaozang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.timebaozang.view.TimeBaoZang_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TimeBaoZang_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "TimeBaoZang_MsgReceivedProxy";
      
      private var _TimeBaoZang_Mediator:TimeBaoZang_Mediator;
      
      public function TimeBaoZang_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get timeBaoZang_Mediator() : TimeBaoZang_Mediator
      {
         if(!this._TimeBaoZang_Mediator)
         {
            this._TimeBaoZang_Mediator = facade.retrieveMediator(TimeBaoZang_Mediator.NAME) as TimeBaoZang_Mediator;
         }
         return this._TimeBaoZang_Mediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([60912,60914],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([60912,60914],NAME);
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
            ZLog.add("协议号 " + _loc2_ + "不存在");
         }
      }
      
      public function received_60912(param1:ByteArray) : void
      {
         var _loc7_:Object = null;
         ZLog.add("60912：时间宝藏面板");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:Array = new Array();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc7_ = {};
            _loc7_.mallId = _loc2_.readInt();
            _loc7_.goodsId = _loc2_.readInt();
            _loc7_.goodsNum = _loc2_.readInt();
            _loc7_.spID = _loc2_.readInt();
            _loc7_.spNum = _loc2_.readInt();
            _loc4_.push(_loc7_);
            _loc5_++;
         }
         var _loc6_:int = _loc2_.readInt();
         this.timeBaoZang_Mediator.updateTimeBaoZangPanel(_loc4_,_loc6_);
      }
      
      public function received_60914(param1:ByteArray) : void
      {
         ZLog.add("60914：关闭时间宝藏面板");
         var _loc2_:ByteArray = param1;
         this.timeBaoZang_Mediator.onClosePanel();
      }
   }
}

