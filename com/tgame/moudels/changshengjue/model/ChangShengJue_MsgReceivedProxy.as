package com.tgame.moudels.changshengjue.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.changshengjue.model.info.ChangShengJueVO;
   import com.tgame.moudels.changshengjue.view.ChangShengJue_Mediator;
   import com.tgame.moudels.changshengjue.view.ChangShengJue_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ChangShengJue_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "ChangShengJue_MsgReceivedProxy";
      
      private var _mianPanelMediator:ChangShengJue_Mediator;
      
      private var _targetMediator:ChangShengJue_TargetMediator;
      
      public function ChangShengJue_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mianPanelMediator() : ChangShengJue_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(ChangShengJue_Mediator.NAME) as ChangShengJue_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      private function get targetPlaneMediator() : ChangShengJue_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(ChangShengJue_TargetMediator.NAME) as ChangShengJue_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73152,73154,73156],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73152,73154,73156],NAME);
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
      
      public function received_73152(param1:ByteArray) : void
      {
         ZLog.add("73152：返回玩家长生诀详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:ChangShengJueVO = new ChangShengJueVO();
         _loc3_.nowID = param1.readInt();
         _loc3_.nowLookingID = param1.readInt();
         _loc3_.nowLookingName = param1.readUTF();
         _loc3_.miaoshu = param1.readUTF();
         _loc3_.act = param1.readDouble();
         _loc3_.def = param1.readDouble();
         _loc3_.hp = param1.readDouble();
         _loc3_.neili = param1.readDouble();
         _loc3_.tili = param1.readDouble();
         var _loc4_:int = param1.readInt();
         _loc3_.skillid = _loc4_;
         _loc3_.isLearn = Boolean(param1.readByte() == 1);
         _loc3_.lianti = param1.readInt();
         _loc3_.isDanTian1 = Boolean(param1.readByte() == 1);
         _loc3_.isDanTian2 = Boolean(param1.readByte() == 1);
         if(_loc2_ == -1)
         {
            this.mianPanelMediator.setPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_73154(param1:ByteArray) : void
      {
         ZLog.add("73154：返回长生诀突破信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mianPanelMediator.setTupoPanel(_loc2_,_loc5_,_loc6_,_loc7_,_loc3_,_loc4_,_loc8_);
      }
      
      public function received_73156(param1:ByteArray) : void
      {
         ZLog.add("73156: 返回突破长生诀结果");
         var _loc2_:int = param1.readByte();
         this.mianPanelMediator.setTupoResult(_loc2_);
      }
   }
}

