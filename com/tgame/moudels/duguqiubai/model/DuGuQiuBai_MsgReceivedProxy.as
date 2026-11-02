package com.tgame.moudels.duguqiubai.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.duguqiubai.model.info.DuGuQiuBaiVO;
   import com.tgame.moudels.duguqiubai.view.DuGuQiuBai_Mediator;
   import com.tgame.moudels.duguqiubai.view.DuGuQiuBai_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class DuGuQiuBai_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "DuGuQiuBai_MsgReceivedProxy";
      
      private var _mianPanelMediator:DuGuQiuBai_Mediator;
      
      private var _targetMediator:DuGuQiuBai_TargetMediator;
      
      public function DuGuQiuBai_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mianPanelMediator() : DuGuQiuBai_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(DuGuQiuBai_Mediator.NAME) as DuGuQiuBai_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      private function get targetPlaneMediator() : DuGuQiuBai_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(DuGuQiuBai_TargetMediator.NAME) as DuGuQiuBai_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73002,73004],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73002,73004],NAME);
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
      
      public function received_73002(param1:ByteArray) : void
      {
         ZLog.add("73002：返回玩家独孤求败详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:DuGuQiuBaiVO = new DuGuQiuBaiVO();
         _loc3_.nowID = param1.readInt();
         _loc3_.nowLookingID = param1.readInt();
         _loc3_.nowLookingName = param1.readUTF();
         _loc3_.miaoshu = param1.readUTF();
         _loc3_.act = param1.readDouble();
         _loc3_.def = param1.readDouble();
         _loc3_.hp = param1.readDouble();
         _loc3_.baoji = param1.readDouble();
         _loc3_.shanbi = param1.readDouble();
         _loc3_.wugong = param1.readInt();
         _loc3_.isLearn = Boolean(param1.readByte() == 1);
         _loc3_.nowZhufuzhi = param1.readInt();
         _loc3_.maxZhufuzhi = param1.readInt();
         _loc3_.goodid = param1.readInt();
         _loc3_.count = param1.readInt();
         _loc3_.huanzhuang = Boolean(param1.readByte() == 1);
         if(_loc2_ == -1)
         {
            this.mianPanelMediator.setPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_73004(param1:ByteArray) : void
      {
         ZLog.add("73004: 返回突破独孤求败结果");
         var _loc2_:int = param1.readByte();
         this.mianPanelMediator.setTupoResult(_loc2_);
      }
   }
}

