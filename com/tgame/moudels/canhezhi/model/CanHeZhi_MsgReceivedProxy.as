package com.tgame.moudels.canhezhi.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.canhezhi.model.info.CanHeZhiVo;
   import com.tgame.moudels.canhezhi.view.CanHeZhi_Mediator;
   import com.tgame.moudels.canhezhi.view.CanHeZhi_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class CanHeZhi_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "CanHeZhi_MsgReceivedProxy";
      
      private var _mianPanelMediator:CanHeZhi_Mediator;
      
      private var _targetMediator:CanHeZhi_TargetMediator;
      
      public function CanHeZhi_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get mianPanelMediator() : CanHeZhi_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(CanHeZhi_Mediator.NAME) as CanHeZhi_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      private function get targetPlaneMediator() : CanHeZhi_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(CanHeZhi_TargetMediator.NAME) as CanHeZhi_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([70452,70454,70456],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([70452,70454,70456],NAME);
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
      
      public function received_70452(param1:ByteArray) : void
      {
         ZLog.add("70452：返回玩家参合指详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:CanHeZhiVo = new CanHeZhiVo();
         _loc3_.nowID = param1.readInt();
         _loc3_.nowLookingID = param1.readInt();
         _loc3_.nowLookingName = param1.readUTF();
         _loc3_.miaoshu = param1.readUTF();
         _loc3_.act = param1.readInt();
         _loc3_.def = param1.readInt();
         _loc3_.hp = param1.readInt();
         _loc3_.baoji = param1.readInt();
         _loc3_.shanbi = param1.readInt();
         var _loc4_:int = param1.readInt();
         _loc3_.skillid = _loc4_;
         _loc3_.isLearn = Boolean(param1.readByte() == 1);
         if(_loc2_ == -1)
         {
            this.mianPanelMediator.setPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_70454(param1:ByteArray) : void
      {
         ZLog.add("70454：返回参合指突破信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mianPanelMediator.setTupoPanel(_loc2_,_loc5_,_loc6_,_loc7_,_loc3_,_loc4_,_loc8_);
      }
      
      public function received_70456(param1:ByteArray) : void
      {
         ZLog.add("70456: 返回突破参合指结果");
         var _loc2_:int = param1.readByte();
         this.mianPanelMediator.setTupoResult(_loc2_);
      }
   }
}

