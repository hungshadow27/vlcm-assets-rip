package com.tgame.moudels.shangdian.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.shangdian.view.Shangdian_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Shangdian_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Shangdian_MsgReceivedProxy";
      
      private var _mainChar_Mediator:Shangdian_Mediator;
      
      public function Shangdian_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get mainChar_Mediator() : Shangdian_Mediator
      {
         if(!this._mainChar_Mediator)
         {
            this._mainChar_Mediator = facade.retrieveMediator(Shangdian_Mediator.NAME) as Shangdian_Mediator;
         }
         return this._mainChar_Mediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([82182],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([82182],NAME);
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
      
      public function received_82182(param1:ByteArray) : void
      {
         var _loc6_:Object = null;
         ZLog.add("82182\t\t刷新面板消息");
         var _loc2_:Object = {};
         _loc2_.type = param1.readByte();
         _loc2_.leiji = param1.readInt();
         _loc2_.leijishangxian = param1.readInt();
         _loc2_.curPage = param1.readByte();
         _loc2_.maxPage = param1.readByte();
         var _loc3_:int = param1.readInt();
         var _loc4_:Array = new Array();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            _loc6_ = new Object();
            _loc6_.index = param1.readInt();
            _loc6_.goodsID = param1.readInt();
            _loc6_.goodsNum = param1.readInt();
            _loc6_.price = param1.readInt();
            _loc6_.hot = param1.readByte();
            _loc4_.push(_loc6_);
            _loc5_++;
         }
         _loc2_.arr = _loc4_;
         this.mainChar_Mediator.setYongJiuData(_loc2_);
      }
   }
}

