package com.tgame.moudels.wuxiakapai.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.wuxiakapai.view.Wuxiakapai_Mediator;
   import com.tgame.moudels.wuxiakapai.view.Wuxiakapai_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Wuxiakapai_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Wuxiakapai_MsgReceivedProxy";
      
      private var _mediator:Wuxiakapai_Mediator;
      
      private var _mediatorTarget:Wuxiakapai_TargetMediator;
      
      public function Wuxiakapai_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([74242,74244,74246],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([74242,74244,74246],NAME);
      }
      
      private function get mediator() : Wuxiakapai_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(Wuxiakapai_Mediator.NAME) as Wuxiakapai_Mediator;
         }
         return this._mediator;
      }
      
      private function get mediatorTarget() : Wuxiakapai_TargetMediator
      {
         if(!this._mediatorTarget)
         {
            this._mediatorTarget = facade.retrieveMediator(Wuxiakapai_TargetMediator.NAME) as Wuxiakapai_TargetMediator;
         }
         return this._mediatorTarget;
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
      
      public function received_74242(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         ZLog.add("74242：返回卡牌类型列表");
         var _loc2_:int = param1.readInt();
         var _loc3_:Array = [];
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc6_ = new Object();
            _loc6_.id = param1.readInt();
            _loc6_.name = param1.readUTF();
            _loc3_.push(_loc6_);
            _loc4_++;
         }
         var _loc5_:String = param1.readUTF();
         this.mediator.setLeft(_loc3_,_loc5_);
      }
      
      public function received_74244(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         ZLog.add("74244：返回卡牌类型列表");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:Array = [];
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = new Object();
            _loc6_.id = param1.readInt();
            _loc6_.name = param1.readUTF();
            _loc6_.state = param1.readByte();
            _loc6_.imgID = param1.readInt();
            _loc6_.lv = param1.readByte();
            _loc4_.push(_loc6_);
            _loc5_++;
         }
         this.mediator.setRight(_loc2_,_loc4_);
      }
      
      public function received_74246(param1:ByteArray) : void
      {
         ZLog.add("74246：返回卡牌详细信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readByte();
         var _loc6_:String = param1.readUTF();
         var _loc7_:String = param1.readUTF();
         var _loc8_:String = param1.readUTF();
         var _loc9_:String = param1.readUTF();
         var _loc10_:int = param1.readByte();
         var _loc11_:int = param1.readInt();
         var _loc12_:int = param1.readInt();
         this.mediator.setXiangxi(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc11_,_loc12_,_loc10_);
      }
   }
}

