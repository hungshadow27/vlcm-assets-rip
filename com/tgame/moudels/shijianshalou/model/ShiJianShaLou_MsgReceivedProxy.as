package com.tgame.moudels.shijianshalou.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.shijianshalou.view.ShiJianShaLou_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ShiJianShaLou_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "ShiJianShaLou_MsgReceivedProxy";
      
      private var _shijianshalou_Mediator:ShiJianShaLou_Mediator;
      
      public function ShiJianShaLou_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([82214],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([82214],NAME);
      }
      
      private function get shijianshalou_Mediator() : ShiJianShaLou_Mediator
      {
         if(!this._shijianshalou_Mediator)
         {
            this._shijianshalou_Mediator = facade.retrieveMediator(ShiJianShaLou_Mediator.NAME) as ShiJianShaLou_Mediator;
         }
         return this._shijianshalou_Mediator;
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
      
      public function received_82214(param1:ByteArray) : void
      {
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:Boolean = false;
         var _loc13_:int = 0;
         ZLog.add("82214\t\t返回时间沙漏信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:String = param1.readUTF();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         if(_loc6_ != 0)
         {
            _loc7_ = param1.readInt();
            _loc8_ = param1.readInt();
            _loc9_ = param1.readInt();
            _loc10_ = param1.readInt();
            _loc11_ = param1.readInt();
            _loc12_ = Boolean(param1.readByte());
            _loc13_ = param1.readInt();
         }
         else
         {
            _loc7_ = 1;
            _loc8_ = 1;
            _loc9_ = 1;
            _loc10_ = 1;
            _loc11_ = 1;
            _loc12_ = false;
            _loc13_ = 0;
         }
         this.shijianshalou_Mediator.setPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_);
      }
   }
}

