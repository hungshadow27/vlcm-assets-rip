package com.tgame.moudels.xianmowudaji.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.xianmowudaji.view.XianMoWuDaJi_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XianMoWuDaJi_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "XianMoWuDaJi_MsgReceivedProxy";
      
      private var _mediator:XianMoWuDaJi_Mediator;
      
      public function XianMoWuDaJi_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([80952],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([80952],NAME);
      }
      
      private function get mediator() : XianMoWuDaJi_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(XianMoWuDaJi_Mediator.NAME) as XianMoWuDaJi_Mediator;
         }
         return this._mediator;
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
      
      public function received_80952(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc9_:Object = null;
         ZLog.add("80952：仙魔五大技");
         var _loc2_:int = param1.readInt();
         var _loc3_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc9_ = new Object();
            _loc9_.type = param1.readByte();
            _loc9_.lv = param1.readInt();
            _loc3_.push(_loc9_);
            _loc4_++;
         }
         var _loc5_:int = param1.readInt();
         var _loc6_:Array = [];
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc9_ = new Object();
            _loc9_.type = param1.readByte();
            _loc9_.id = param1.readInt();
            _loc9_.lv = param1.readInt();
            _loc6_.push(_loc9_);
            _loc4_++;
         }
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mediator.setPanel(_loc3_,_loc6_,_loc7_,_loc8_);
      }
   }
}

