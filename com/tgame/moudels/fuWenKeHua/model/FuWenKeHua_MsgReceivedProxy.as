package com.tgame.moudels.fuWenKeHua.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.fuWenKeHua.view.FuWenKeHua_Mediator;
   import com.tgame.moudels.fuWenKeHua.view.FuWenKeHua_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class FuWenKeHua_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "FuWenKeHua_MsgReceivedProxy";
      
      private var _mainPanelMediator:FuWenKeHua_Mediator;
      
      private var _targetMediator:FuWenKeHua_TargetMediator;
      
      public function FuWenKeHua_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mainPanelMediator() : FuWenKeHua_Mediator
      {
         if(!this._mainPanelMediator)
         {
            this._mainPanelMediator = facade.retrieveMediator(FuWenKeHua_Mediator.NAME) as FuWenKeHua_Mediator;
         }
         return this._mainPanelMediator;
      }
      
      private function get targetPlaneMediator() : FuWenKeHua_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(FuWenKeHua_TargetMediator.NAME) as FuWenKeHua_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([78422,78424],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([78422,78424],NAME);
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
      
      public function received_78422(param1:ByteArray) : void
      {
         var _loc11_:Object = null;
         ZLog.add("78422\t\t返回符文刻画信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:Array = [];
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc11_ = new Object();
            _loc11_.index = param1.readByte();
            _loc11_.id = param1.readInt();
            _loc11_.grade = param1.readByte();
            _loc6_.push(_loc11_);
            _loc7_++;
         }
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         if(_loc2_ == -1)
         {
            this.mainPanelMediator.upDataPanel(_loc3_,_loc4_,_loc6_,_loc8_,_loc9_,_loc10_);
         }
         else
         {
            this.targetPlaneMediator.upDataPanel(_loc2_,_loc3_,_loc4_,_loc6_,_loc8_,_loc9_,_loc10_);
         }
      }
      
      public function received_78424(param1:ByteArray) : void
      {
         ZLog.add("78424\t\t符文详细信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readByte();
         var _loc5_:String = param1.readUTF();
         var _loc6_:String = param1.readUTF();
         var _loc7_:int = param1.readInt();
         var _loc8_:Boolean = param1.readByte() == 1;
         var _loc9_:Boolean = param1.readByte() == 1;
         var _loc10_:int = param1.readInt();
         var _loc11_:int = param1.readInt();
         if(_loc2_ == -1)
         {
            this.mainPanelMediator.setFuWenData(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_);
         }
         else
         {
            this.targetPlaneMediator.setFuWenData(_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_);
         }
      }
   }
}

