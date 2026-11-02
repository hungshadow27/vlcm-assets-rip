package com.tgame.moudels.guiliuzhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.guiliuzhen.model.info.GuiLiuZhenVO;
   import com.tgame.moudels.guiliuzhen.view.GuiLiuZhen_Mediator;
   import com.tgame.moudels.guiliuzhen.view.GuiLiuZhen_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class GuiLiuZhen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "GuiLiuZhen_MsgReceivedProxy";
      
      private var _mainPanelMediator:GuiLiuZhen_Mediator;
      
      private var _targetMediator:GuiLiuZhen_TargetMediator;
      
      public function GuiLiuZhen_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mainPanelMediator() : GuiLiuZhen_Mediator
      {
         if(!this._mainPanelMediator)
         {
            this._mainPanelMediator = facade.retrieveMediator(GuiLiuZhen_Mediator.NAME) as GuiLiuZhen_Mediator;
         }
         return this._mainPanelMediator;
      }
      
      private function get targetPlaneMediator() : GuiLiuZhen_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(GuiLiuZhen_TargetMediator.NAME) as GuiLiuZhen_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([61602,61604,61606],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([61602,61604,61606],NAME);
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
      
      public function received_61602(param1:ByteArray) : void
      {
         ZLog.add("61602\t\t返回玩家归流阵详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:GuiLiuZhenVO = new GuiLiuZhenVO();
         _loc3_.miaoshu = param1.readUTF();
         _loc3_.nowLookingID = param1.readByte();
         _loc3_.nowLookingName = param1.readUTF();
         _loc3_.nowID = param1.readByte();
         _loc3_.act = param1.readInt();
         _loc3_.def = param1.readInt();
         _loc3_.hp = param1.readInt();
         _loc3_.mp = param1.readInt();
         _loc3_.tl = param1.readInt();
         _loc3_.skill1 = param1.readInt();
         _loc3_.isLearn1 = Boolean(param1.readByte() == 1);
         _loc3_.skill2 = param1.readInt();
         _loc3_.isLearn2 = Boolean(param1.readByte() == 1);
         _loc3_.dingJiShuXing = Boolean(param1.readByte() == 1);
         _loc3_.yincangShuXing = Boolean(param1.readByte() == 1);
         if(_loc2_ == -1)
         {
            this.mainPanelMediator.upDataPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.upDataPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_61604(param1:ByteArray) : void
      {
         ZLog.add("61604\t\t返回归流阵突破数据");
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mainPanelMediator.upDateTuPoPanel(_loc6_,_loc7_,_loc4_,_loc5_,_loc8_,_loc3_,_loc2_);
      }
      
      public function received_61606(param1:ByteArray) : void
      {
         ZLog.add("61606\t\t返回突破归流阵结果");
         var _loc2_:int = param1.readByte();
         this.mainPanelMediator.upDateTuPoResult(_loc2_);
      }
   }
}

