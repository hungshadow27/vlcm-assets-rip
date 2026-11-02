package com.tgame.moudels.douZhuanXingYi.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.douZhuanXingYi.model.info.DouZhuanXingYiVO;
   import com.tgame.moudels.douZhuanXingYi.view.DouZhuanXingYi_Mediator;
   import com.tgame.moudels.douZhuanXingYi.view.DouZhuanXingYi_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class DouZhuanXingYi_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "DouZhuanXingYi_MsgReceivedProxy";
      
      private var _mainPanelMediator:DouZhuanXingYi_Mediator;
      
      private var _targetMediator:DouZhuanXingYi_TargetMediator;
      
      public function DouZhuanXingYi_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mainPanelMediator() : DouZhuanXingYi_Mediator
      {
         if(!this._mainPanelMediator)
         {
            this._mainPanelMediator = facade.retrieveMediator(DouZhuanXingYi_Mediator.NAME) as DouZhuanXingYi_Mediator;
         }
         return this._mainPanelMediator;
      }
      
      private function get targetPlaneMediator() : DouZhuanXingYi_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(DouZhuanXingYi_TargetMediator.NAME) as DouZhuanXingYi_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([61302,61304,61306],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([61302,61304,61306],NAME);
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
      
      public function received_61302(param1:ByteArray) : void
      {
         ZLog.add("61302：返回玩家斗转星移详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:DouZhuanXingYiVO = new DouZhuanXingYiVO();
         _loc3_.miaoshu = param1.readUTF();
         _loc3_.nowLookingID = param1.readByte();
         _loc3_.nowLookingName = param1.readUTF();
         _loc3_.nowID = param1.readByte();
         _loc3_.act = param1.readInt();
         _loc3_.def = param1.readInt();
         _loc3_.hp = param1.readInt();
         _loc3_.bj = param1.readInt();
         _loc3_.sb = param1.readInt();
         var _loc4_:int = param1.readInt();
         _loc3_.skillid = _loc4_;
         _loc3_.isLearn = Boolean(param1.readByte() == 1);
         _loc3_.isDouble = param1.readByte() == 1;
         _loc3_.isDingjiJihuo = Boolean(param1.readByte() == 1);
         _loc3_.isZuoQi = Boolean(param1.readByte() == 1);
         if(_loc2_ == -1)
         {
            this.mainPanelMediator.upDataPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.upDataPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_61304(param1:ByteArray) : void
      {
         ZLog.add("61304\t\t返回斗转星移突破数据");
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mainPanelMediator.upDateDouZhuanXingYiLV(_loc6_,_loc7_,_loc4_,_loc5_,_loc8_,_loc3_,_loc2_);
      }
      
      public function received_61306(param1:ByteArray) : void
      {
         ZLog.add("61306\t\t返回突破斗转星移结果");
         var _loc2_:int = param1.readByte();
         this.mainPanelMediator.upDateDouZhuanXingYiLVComplete(_loc2_);
      }
   }
}

