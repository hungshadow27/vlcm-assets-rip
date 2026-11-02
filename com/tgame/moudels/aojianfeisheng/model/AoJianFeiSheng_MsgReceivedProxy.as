package com.tgame.moudels.aojianfeisheng.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.aojianfeisheng.view.AoJianFeiSheng_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class AoJianFeiSheng_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "AoJianFeiSheng_MsgReceivedProxy";
      
      private var _mediator:AoJianFeiSheng_Mediator;
      
      public function AoJianFeiSheng_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([80982],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([80982],NAME);
      }
      
      private function get mediator() : AoJianFeiSheng_Mediator
      {
         if(!this._mediator)
         {
            this._mediator = facade.retrieveMediator(AoJianFeiSheng_Mediator.NAME) as AoJianFeiSheng_Mediator;
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
      
      public function received_80982(param1:ByteArray) : void
      {
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc9_:int = 0;
         var _loc10_:Object = null;
         var _loc11_:Object = null;
         ZLog.add("80982：返回傲剑飞升数据");
         var _loc2_:Array = new Array();
         var _loc3_:Array = new Array();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc7_ = param1.readInt();
            _loc8_ = new Array();
            _loc9_ = 0;
            while(_loc9_ < _loc7_)
            {
               _loc11_ = new Object();
               _loc11_.misohu = param1.readUTF();
               _loc11_.currPro = param1.readInt();
               _loc11_.totalPro = param1.readInt();
               _loc11_.shuoming = param1.readUTF();
               _loc8_.push(_loc11_);
               _loc9_++;
            }
            _loc2_.push(_loc8_);
            _loc10_ = new Object();
            _loc10_.goodsID = param1.readInt();
            _loc10_.goodsNum = param1.readInt();
            _loc10_.canRecieved = param1.readByte();
            _loc3_.push(_loc10_);
            _loc5_++;
         }
         var _loc6_:Object = new Object();
         _loc6_.tag1 = param1.readByte();
         _loc6_.tag2 = param1.readByte();
         this.mediator.setAoJianFeiShengData(_loc2_,_loc3_,_loc6_);
      }
   }
}

