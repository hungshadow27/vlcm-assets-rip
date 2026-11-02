package com.tgame.moudels.qinlonggong.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.qinlonggong.model.info.QinLongGongVo;
   import com.tgame.moudels.qinlonggong.view.QinLongGong_Mediator;
   import com.tgame.moudels.qinlonggong.view.QinLongGong_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class QinLongGong_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "QinLongGong_MsgReceivedProxy";
      
      private var _mianPanelMediator:QinLongGong_Mediator;
      
      private var _targetMediator:QinLongGong_TargetMediator;
      
      public function QinLongGong_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get mianPanelMediator() : QinLongGong_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(QinLongGong_Mediator.NAME) as QinLongGong_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      private function get targetPlaneMediator() : QinLongGong_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(QinLongGong_TargetMediator.NAME) as QinLongGong_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([61842,61844,61846],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([61842,61844,61846],NAME);
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
      
      public function received_61842(param1:ByteArray) : void
      {
         ZLog.add("61842：返回玩家擒龙功详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:QinLongGongVo = new QinLongGongVo();
         _loc3_.nowID = param1.readInt();
         _loc3_.nowLookingID = param1.readInt();
         _loc3_.nowLookingName = param1.readUTF();
         _loc3_.act = param1.readInt();
         _loc3_.def = param1.readInt();
         _loc3_.shanbi = param1.readInt();
         _loc3_.baoji = param1.readInt();
         _loc3_.miaoshu = param1.readUTF();
         var _loc4_:int = param1.readInt();
         _loc3_.skillid = _loc4_;
         _loc3_.isLearn = Boolean(param1.readByte() == 1);
         var _loc5_:int = param1.readInt();
         _loc3_.YCskillid = _loc5_;
         _loc3_.YCisLearn = Boolean(param1.readByte() == 1);
         _loc3_.isDingjiShuxing = Boolean(param1.readByte() == 1);
         if(_loc2_ == -1)
         {
            this.mianPanelMediator.setPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_61844(param1:ByteArray) : void
      {
         ZLog.add("61844：返回擒龙功突破信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mianPanelMediator.setTupoPanel(_loc2_,_loc5_,_loc6_,_loc7_,_loc3_,_loc4_,_loc8_);
      }
      
      public function received_61846(param1:ByteArray) : void
      {
         ZLog.add("61846: 返回突破擒龙功结果");
         var _loc2_:int = param1.readByte();
         this.mianPanelMediator.setTupoResult(_loc2_);
      }
   }
}

