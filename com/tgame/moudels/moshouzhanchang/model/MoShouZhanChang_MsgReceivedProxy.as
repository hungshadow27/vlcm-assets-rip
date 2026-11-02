package com.tgame.moudels.moshouzhanchang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.moshouzhanchang.view.MoShouZhanChang_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MoShouZhanChang_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "MoShouZhanChang_MsgReceivedProxy";
      
      private var _moshouzhanchang_Mediator:MoShouZhanChang_Mediator;
      
      public function MoShouZhanChang_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([81382,81562,83116,83166],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([81382,81562,83116,83166],NAME);
      }
      
      private function get moshouzhanchang_Mediator() : MoShouZhanChang_Mediator
      {
         if(!this._moshouzhanchang_Mediator)
         {
            this._moshouzhanchang_Mediator = facade.retrieveMediator(MoShouZhanChang_Mediator.NAME) as MoShouZhanChang_Mediator;
         }
         return this._moshouzhanchang_Mediator;
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
      
      public function received_81382(param1:ByteArray) : void
      {
         ZLog.add("81382\t\t跨服争夺战 信息回馈");
         var _loc2_:int = param1.readInt();
         var _loc3_:Boolean = Boolean(param1.readByte());
         var _loc4_:int = param1.readInt();
         var _loc5_:Boolean = Boolean(param1.readByte());
         var _loc6_:Boolean = Boolean(param1.readByte());
         this.moshouzhanchang_Mediator.setPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_);
      }
      
      public function received_83116(param1:ByteArray) : void
      {
         ZLog.add("83116\t\t锻炼返回");
         var _loc2_:int = param1.readInt();
         this.moshouzhanchang_Mediator.setDuanLianData(_loc2_);
      }
      
      public function received_83166(param1:ByteArray) : void
      {
         ZLog.add("83166\t\t点击神诞树返回");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = param1.readInt();
         this.moshouzhanchang_Mediator.setShengDanDaZhanData(_loc2_,_loc3_);
      }
   }
}

