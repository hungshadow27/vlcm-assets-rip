package com.tgame.moudels.huashanlunjian.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.huashanlunjian.view.Huashanlunjian_Mediator;
   import com.tgame.moudels.huashanlunjian.view.Huashanlunjian_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Huashanlunjian_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Huashanlunjian_MsgReceivedProxy";
      
      private var _mainPanelMediator:Huashanlunjian_Mediator;
      
      private var _targetMediator:Huashanlunjian_TargetPanelMediator;
      
      public function Huashanlunjian_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mainPanelMediator() : Huashanlunjian_Mediator
      {
         if(!this._mainPanelMediator)
         {
            this._mainPanelMediator = facade.retrieveMediator(Huashanlunjian_Mediator.NAME) as Huashanlunjian_Mediator;
         }
         return this._mainPanelMediator;
      }
      
      private function get targetPlaneMediator() : Huashanlunjian_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(Huashanlunjian_TargetPanelMediator.NAME) as Huashanlunjian_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([74422,74424,74426],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([74422,74424,74426],NAME);
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
      
      public function received_74422(param1:ByteArray) : void
      {
         ZLog.add("74422: 返回华山论剑面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readByte();
         var _loc4_:int = param1.readByte();
         var _loc5_:String = param1.readUTF();
         var _loc6_:String = param1.readUTF();
         var _loc7_:String = param1.readUTF();
         var _loc8_:Object = new Object();
         _loc8_.act = param1.readDouble();
         _loc8_.actMax = param1.readDouble();
         _loc8_.def = param1.readDouble();
         _loc8_.defMax = param1.readDouble();
         _loc8_.hp = param1.readDouble();
         _loc8_.hpMax = param1.readDouble();
         _loc8_.lv = param1.readDouble();
         _loc8_.lvMax = param1.readDouble();
         _loc8_.xiaohaoGoodsID = param1.readInt();
         if(_loc2_ == -1)
         {
            this.mainPanelMediator.setInit(_loc8_,_loc4_,_loc3_,_loc7_,_loc6_,_loc5_);
         }
         else
         {
            this.targetPlaneMediator.setInit(_loc8_,_loc4_,_loc3_,_loc7_,_loc6_,_loc5_);
         }
      }
      
      public function received_74424(param1:ByteArray) : void
      {
         ZLog.add("74424: 返回领悟面板信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mainPanelMediator.upDateLV(_loc3_,_loc4_,_loc6_,_loc7_,_loc8_,_loc5_,_loc2_);
      }
      
      public function received_74426(param1:ByteArray) : void
      {
         ZLog.add("74426: 返回领悟结果");
         var _loc2_:int = param1.readByte();
         this.mainPanelMediator.upDateLVComplete(_loc2_);
      }
   }
}

