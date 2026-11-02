package com.tgame.moudels.bihaichaoshengqu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.bihaichaoshengqu.model.info.BiHaiChaoShengQuVo;
   import com.tgame.moudels.bihaichaoshengqu.view.BiHaiChaoShengQu_Mediator;
   import com.tgame.moudels.bihaichaoshengqu.view.BiHaiChaoShengQu_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BiHaiChaoShengQu_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "BiHaiChaoShengQu_MsgReceivedProxy";
      
      private var _mianPanelMediator:BiHaiChaoShengQu_Mediator;
      
      private var _targetMediator:BiHaiChaoShengQu_TargetMediator;
      
      public function BiHaiChaoShengQu_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get mianPanelMediator() : BiHaiChaoShengQu_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(BiHaiChaoShengQu_Mediator.NAME) as BiHaiChaoShengQu_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      private function get targetPlaneMediator() : BiHaiChaoShengQu_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(BiHaiChaoShengQu_TargetMediator.NAME) as BiHaiChaoShengQu_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([70152,70154,70156],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([70152,70154,70156],NAME);
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
      
      public function received_70152(param1:ByteArray) : void
      {
         ZLog.add("70152：返回玩家碧海潮生曲详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:BiHaiChaoShengQuVo = new BiHaiChaoShengQuVo();
         _loc3_.nowID = param1.readInt();
         _loc3_.nowLookingID = param1.readInt();
         _loc3_.nowLookingName = param1.readUTF();
         _loc3_.miaoshu = param1.readUTF();
         _loc3_.act = param1.readInt();
         _loc3_.def = param1.readInt();
         _loc3_.hp = param1.readInt();
         _loc3_.mp = param1.readInt();
         _loc3_.tili = param1.readInt();
         var _loc4_:int = param1.readInt();
         _loc3_.skillid = _loc4_;
         _loc3_.isLearn = Boolean(param1.readByte() == 1);
         _loc3_.isDouble = Boolean(param1.readByte() == 1);
         _loc3_.isSiLingZhen = Boolean(param1.readByte() == 1);
         _loc3_.isWuQi = Boolean(param1.readByte() == 1);
         _loc3_.huLuWa1 = param1.readInt();
         _loc3_.huLuWa2 = param1.readInt();
         _loc3_.huLuWa3 = param1.readInt();
         _loc3_.huLuWa4 = param1.readInt();
         _loc3_.huLuWa5 = param1.readInt();
         _loc3_.huLuWa6 = param1.readInt();
         _loc3_.huLuWa7 = param1.readInt();
         if(_loc2_ == -1)
         {
            this.mianPanelMediator.setPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_70154(param1:ByteArray) : void
      {
         ZLog.add("70154：返回碧海潮生曲突破信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mianPanelMediator.setTupoPanel(_loc2_,_loc5_,_loc6_,_loc7_,_loc3_,_loc4_,_loc8_);
      }
      
      public function received_70156(param1:ByteArray) : void
      {
         ZLog.add("70156: 返回突破碧海潮生曲结果");
         var _loc2_:int = param1.readByte();
         this.mianPanelMediator.setTupoResult(_loc2_);
      }
   }
}

