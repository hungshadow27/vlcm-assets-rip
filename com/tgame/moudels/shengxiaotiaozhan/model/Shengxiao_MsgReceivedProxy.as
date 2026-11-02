package com.tgame.moudels.shengxiaotiaozhan.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.shengxiaotiaozhan.view.Shengxiao_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Shengxiao_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Shengxiao_MsgReceivedProxy";
      
      private var _mediator:Shengxiao_Mediator;
      
      public function Shengxiao_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mediator() : Shengxiao_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(Shengxiao_Mediator.NAME) as Shengxiao_Mediator;
         }
         return this._mediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73872,73874,73876,73882,73886,73888,73892],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73872,73874,73876,73882,73886,73888,73892],NAME);
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
      
      public function received_73872(param1:ByteArray) : void
      {
         var _loc7_:Object = null;
         ZLog.add("73872: 返回十二生肖面板");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:Array = [];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_)
         {
            _loc7_ = new Object();
            _loc7_.lv = param1.readByte();
            _loc7_.state = param1.readByte();
            _loc5_.push(_loc7_);
            _loc6_++;
         }
         this.mediator.setData(_loc2_,_loc3_,_loc5_);
      }
      
      public function received_73874(param1:ByteArray) : void
      {
         var _loc5_:int = 0;
         var _loc14_:Object = null;
         ZLog.add("73874: 返回每层内级数信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readByte();
         var _loc4_:Array = [];
         while(_loc5_ < _loc3_)
         {
            _loc14_ = new Object();
            _loc14_.no = param1.readByte();
            _loc14_.name = param1.readUTF();
            _loc14_.time = param1.readInt();
            _loc4_.push(_loc14_);
            _loc5_++;
         }
         var _loc6_:int = param1.readByte();
         var _loc7_:int = param1.readByte();
         var _loc8_:int = param1.readByte();
         var _loc9_:int = param1.readByte();
         var _loc10_:int = param1.readInt();
         var _loc11_:int = param1.readInt();
         var _loc12_:int = param1.readByte();
         var _loc13_:int = param1.readByte();
         this.mediator.setlv(_loc2_,_loc4_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_);
      }
      
      public function received_73876(param1:ByteArray) : void
      {
         ZLog.add("73876:返回挑战提示");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         this.mediator.setTipPanel(_loc2_,_loc3_);
      }
      
      public function received_73882(param1:ByteArray) : void
      {
         ZLog.add("73882:返回进入副本内右侧提示信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         this.mediator.setRightSpr(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_);
      }
      
      public function received_73886(param1:ByteArray) : void
      {
         ZLog.add("73886:返回挑战成功面板信息");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         this.mediator.setSuccessPanel(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_73888(param1:ByteArray) : void
      {
         ZLog.add("73888:返回死亡复活信息");
         var _loc2_:int = param1.readInt();
         this.mediator.setRelivePanel(_loc2_);
      }
      
      public function received_73892(param1:ByteArray) : void
      {
         ZLog.add("73892:副本结束挑战失败");
         this.mediator.setFailPanel();
      }
   }
}

