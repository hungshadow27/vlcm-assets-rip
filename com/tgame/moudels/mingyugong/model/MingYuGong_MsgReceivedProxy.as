package com.tgame.moudels.mingyugong.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.mingyugong.view.MingYuGong_Mediator;
   import com.tgame.moudels.mingyugong.view.MingYuGong_TargetPanelMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MingYuGong_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "MingYuGong_MsgReceivedProxy";
      
      private var _MainMediator:MingYuGong_Mediator;
      
      private var _targetMediator:MingYuGong_TargetPanelMediator;
      
      public function MingYuGong_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get MainMediator() : MingYuGong_Mediator
      {
         if(!this._MainMediator)
         {
            this._MainMediator = facade.retrieveMediator(MingYuGong_Mediator.NAME) as MingYuGong_Mediator;
         }
         return this._MainMediator;
      }
      
      private function get targetPlaneMediator() : MingYuGong_TargetPanelMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(MingYuGong_TargetPanelMediator.NAME) as MingYuGong_TargetPanelMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([78602,78604,78606],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([78602,78604,78606],NAME);
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
      
      public function received_78602(param1:ByteArray) : void
      {
         ZLog.add("78602：明玉功面板信息接收");
         var _loc2_:int = param1.readInt();
         var _loc3_:Object = new Object();
         _loc3_.nowID = param1.readInt();
         _loc3_.lookID = param1.readInt();
         _loc3_.lookName = param1.readUTF();
         _loc3_.desc = param1.readUTF();
         _loc3_.act = param1.readDouble();
         _loc3_.def = param1.readDouble();
         _loc3_.hp = param1.readDouble();
         _loc3_.mp = param1.readDouble();
         _loc3_.cp = param1.readDouble();
         _loc3_.skillID1 = param1.readInt();
         _loc3_.skillstate1 = param1.readByte();
         _loc3_.skillID2 = param1.readInt();
         _loc3_.skillstate2 = param1.readByte();
         _loc3_.isShow = param1.readByte();
         _loc3_.resID = param1.readInt();
         _loc3_.playerParty = param1.readByte();
         if(_loc2_ == -1)
         {
            this.MainMediator.upDataMingYuGongPanel(_loc3_,_loc3_.resID,_loc3_.playerParty);
         }
         else if(_loc2_ == GameInstance.lookPlayerID)
         {
            this.targetPlaneMediator.upDataMingYuGongPanel(_loc3_,_loc3_.resID,_loc3_.playerParty);
         }
      }
      
      public function received_78604(param1:ByteArray) : void
      {
         ZLog.add("78604：明玉功领悟查询结果");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.MainMediator.upDataLingWuPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_);
      }
      
      public function received_78606(param1:ByteArray) : void
      {
         ZLog.add("78606：明玉功申请领悟结果");
         var _loc2_:int = param1.readByte();
         this.MainMediator.upDataMingYuGongLVComplete(_loc2_);
      }
   }
}

