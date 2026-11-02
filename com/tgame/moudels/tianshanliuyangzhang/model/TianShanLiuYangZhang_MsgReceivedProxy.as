package com.tgame.moudels.tianshanliuyangzhang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.tianshanliuyangzhang.model.info.TianShanLiuYangZhangVo;
   import com.tgame.moudels.tianshanliuyangzhang.view.TianShanLiuYangZhang_Mediator;
   import com.tgame.moudels.tianshanliuyangzhang.view.TianShanLiuYangZhang_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class TianShanLiuYangZhang_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "TianShanLiuYangZhang_MsgReceivedProxy";
      
      private var _mianPanelMediator:TianShanLiuYangZhang_Mediator;
      
      private var _targetMediator:TianShanLiuYangZhang_TargetMediator;
      
      public function TianShanLiuYangZhang_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function get mianPanelMediator() : TianShanLiuYangZhang_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(TianShanLiuYangZhang_Mediator.NAME) as TianShanLiuYangZhang_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      private function get targetPlaneMediator() : TianShanLiuYangZhang_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(TianShanLiuYangZhang_TargetMediator.NAME) as TianShanLiuYangZhang_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73902,73904,73906],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73902,73904,73906],NAME);
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
      
      public function received_73902(param1:ByteArray) : void
      {
         ZLog.add("73902：返回玩家天山六阳掌详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:TianShanLiuYangZhangVo = new TianShanLiuYangZhangVo();
         _loc3_.nowID = param1.readInt();
         _loc3_.nowLookingID = param1.readInt();
         _loc3_.nowLookingName = param1.readUTF();
         _loc3_.miaoshu = param1.readUTF();
         _loc3_.act = param1.readDouble();
         _loc3_.def = param1.readDouble();
         _loc3_.hp = param1.readDouble();
         _loc3_.bj = param1.readDouble();
         _loc3_.sb = param1.readDouble();
         var _loc4_:int = param1.readInt();
         _loc3_.skillid = _loc4_;
         _loc3_.isLearn = Boolean(param1.readByte() == 1);
         _loc3_.menpai = param1.readByte();
         _loc3_.resId = param1.readInt();
         if(_loc2_ == -1)
         {
            this.mianPanelMediator.setPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_73904(param1:ByteArray) : void
      {
         ZLog.add("73904：返回生死符突破信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mianPanelMediator.setTupoPanel(_loc2_,_loc5_,_loc6_,_loc7_,_loc3_,_loc4_,_loc8_);
      }
      
      public function received_73906(param1:ByteArray) : void
      {
         ZLog.add("73906: 返回突破生死符结果");
         var _loc2_:int = param1.readByte();
         this.mianPanelMediator.setTupoResult(_loc2_);
      }
   }
}

