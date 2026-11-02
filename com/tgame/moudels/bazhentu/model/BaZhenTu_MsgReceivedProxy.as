package com.tgame.moudels.bazhentu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.bazhentu.model.info.BaZhenTuVO;
   import com.tgame.moudels.bazhentu.view.BaZhenTu_Mediator;
   import com.tgame.moudels.bazhentu.view.BaZhenTu_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BaZhenTu_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "BaZhenTu_MsgReceivedProxy";
      
      private var _mianPanelMediator:BaZhenTu_Mediator;
      
      private var _targetMediator:BaZhenTu_TargetMediator;
      
      public function BaZhenTu_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      public function get mianPanelMediator() : BaZhenTu_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(BaZhenTu_Mediator.NAME) as BaZhenTu_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      private function get targetPlaneMediator() : BaZhenTu_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(BaZhenTu_TargetMediator.NAME) as BaZhenTu_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73062,73064,73066],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73062,73064,73066],NAME);
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
      
      public function received_73062(param1:ByteArray) : void
      {
         ZLog.add("73062：返回玩家八阵图详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:BaZhenTuVO = new BaZhenTuVO();
         _loc3_.nowID = param1.readInt();
         _loc3_.nowLookingID = param1.readInt();
         _loc3_.nowLookingName = param1.readUTF();
         _loc3_.miaoshu = param1.readUTF();
         _loc3_.act = param1.readDouble();
         _loc3_.def = param1.readDouble();
         _loc3_.hp = param1.readDouble();
         _loc3_.baoji = param1.readDouble();
         _loc3_.shanbi = param1.readDouble();
         var _loc4_:int = param1.readInt();
         _loc3_.skillid = _loc4_;
         _loc3_.isLearn = Boolean(param1.readByte() == 1);
         _loc3_.check1 = Boolean(param1.readByte() == 1);
         _loc3_.check2 = Boolean(param1.readByte() == 1);
         _loc3_.checkCB = Boolean(param1.readByte() == 1);
         _loc3_.checkWq = Boolean(param1.readByte() == 1);
         _loc3_.checkDT = Boolean(param1.readByte() == 1);
         _loc3_.checkWq2 = Boolean(param1.readByte() == 1);
         _loc3_.checkCB2 = Boolean(param1.readByte() == 1);
         _loc3_.xiaohaoGoodsID = param1.readInt();
         if(_loc2_ == -1)
         {
            this.mianPanelMediator.setPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_73064(param1:ByteArray) : void
      {
         ZLog.add("73064：返回八阵图突破信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mianPanelMediator.setTupoPanel(_loc2_,_loc5_,_loc6_,_loc7_,_loc3_,_loc4_,_loc8_);
      }
      
      public function received_73066(param1:ByteArray) : void
      {
         ZLog.add("73066: 返回突破八阵图结果");
         var _loc2_:int = param1.readByte();
         this.mianPanelMediator.setTupoResult(_loc2_);
      }
   }
}

