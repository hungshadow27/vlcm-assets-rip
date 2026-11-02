package com.tgame.moudels.ynShijiebei.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.ynShijiebei.view.YNshijiebei_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNshijiebei_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YNshijiebei_MsgReceivedProxy";
      
      private var _mediator:YNshijiebei_Mediator;
      
      public function YNshijiebei_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73792,79444],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73792,79444],NAME);
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
      
      private function get mediator() : YNshijiebei_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(YNshijiebei_Mediator.NAME) as YNshijiebei_Mediator;
         }
         return this._mediator;
      }
      
      public function received_73792(param1:ByteArray) : void
      {
         var _loc8_:Object = null;
         ZLog.add("73792：返回世界杯排行榜信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc8_ = new Object();
            _loc8_.index = _loc6_ + 1 + (_loc2_ - 1) * 10;
            _loc8_.name = param1.readUTF();
            _loc8_.count = param1.readInt();
            _loc8_.type = 1;
            _loc5_.push(_loc8_);
            _loc6_++;
         }
         var _loc7_:Boolean = param1.readByte() == 1 ? true : false;
         this.mediator.setData(_loc2_,_loc3_,_loc5_,_loc7_);
      }
      
      public function received_79444(param1:ByteArray) : void
      {
         var _loc9_:Object = null;
         ZLog.add("79444：返回世界杯排行榜信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:Array = [];
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc9_ = new Object();
            _loc9_.index = _loc7_ + 1 + (_loc4_ - 1) * 10;
            _loc9_.name = param1.readUTF();
            _loc9_.count = param1.readInt();
            _loc9_.type = 1;
            _loc6_.push(_loc9_);
            _loc7_++;
         }
         var _loc8_:String = param1.readUTF();
         this.mediator.setYDHData(_loc2_,_loc4_,_loc3_,_loc6_,_loc8_);
      }
   }
}

