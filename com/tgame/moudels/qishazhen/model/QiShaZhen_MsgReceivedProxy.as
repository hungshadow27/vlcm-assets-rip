package com.tgame.moudels.qishazhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.qishazhen.model.info.QiShaZhenVo;
   import com.tgame.moudels.qishazhen.view.QiShaZhen_Mediator;
   import com.tgame.moudels.qishazhen.view.QiShaZhen_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class QiShaZhen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "QiShaZhen_MsgReceivedProxy";
      
      private var _mianPanelMediator:QiShaZhen_Mediator;
      
      private var _targetMediator:QiShaZhen_TargetMediator;
      
      public function QiShaZhen_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get mianPanelMediator() : QiShaZhen_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(QiShaZhen_Mediator.NAME) as QiShaZhen_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      private function get targetPlaneMediator() : QiShaZhen_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(QiShaZhen_TargetMediator.NAME) as QiShaZhen_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([74802,74804,74806],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([74802,74804,74806],NAME);
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
      
      public function received_74802(param1:ByteArray) : void
      {
         var _loc2_:int = 0;
         var _loc3_:QiShaZhenVo = null;
         ZLog.add("74802：返回玩家七杀阵详细数据");
         _loc2_ = param1.readInt();
         _loc3_ = new QiShaZhenVo();
         _loc3_.nowID = param1.readInt();
         _loc3_.nowLookingID = param1.readInt();
         _loc3_.nowLookingName = param1.readUTF();
         _loc3_.miaoshu = param1.readUTF();
         _loc3_.act = param1.readDouble();
         _loc3_.def = param1.readDouble();
         _loc3_.hp = param1.readDouble();
         _loc3_.baoji = param1.readDouble();
         _loc3_.shanbi = param1.readDouble();
         _loc3_.skillId = param1.readInt();
         _loc3_.isLearn = Boolean(param1.readByte() == 1);
         _loc3_.isWuQi = Boolean(param1.readByte() == 1);
         _loc3_.isTeXiao = Boolean(param1.readByte() == 1);
         _loc3_.isZuoQi = Boolean(param1.readByte() == 1);
         _loc3_.isShenQi1 = Boolean(param1.readByte() == 1);
         _loc3_.isShenQi2 = Boolean(param1.readByte() == 1);
         _loc3_.isShenQi3 = Boolean(param1.readByte() == 1);
         _loc3_.isShenQi4 = Boolean(param1.readByte() == 1);
         _loc3_.isShenQi5 = Boolean(param1.readByte() == 1);
         _loc3_.isShenQi6 = Boolean(param1.readByte() == 1);
         _loc3_.isShenQi7 = Boolean(param1.readByte() == 1);
         _loc3_.isShenQi8 = Boolean(param1.readByte() == 1);
         _loc3_.isShenQi9 = Boolean(param1.readByte() == 1);
         _loc3_.isShenQi10 = Boolean(param1.readByte() == 1);
         _loc3_.isShenQi11 = Boolean(param1.readByte() == 1);
         if(_loc2_ == -1)
         {
            this.mianPanelMediator.setPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_74804(param1:ByteArray) : void
      {
         ZLog.add("74804：返回七杀阵突破信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mianPanelMediator.setTupoPanel(_loc2_,_loc5_,_loc6_,_loc7_,_loc3_,_loc4_,_loc8_);
      }
      
      public function received_74806(param1:ByteArray) : void
      {
         ZLog.add("74806: 返回突破七杀阵结果");
         var _loc2_:int = param1.readByte();
         this.mianPanelMediator.setTupoResult(_loc2_);
      }
   }
}

