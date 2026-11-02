package com.tgame.moudels.duomingshisanjian.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.duomingshisanjian.model.info.DuoMingShiSanJianVo;
   import com.tgame.moudels.duomingshisanjian.view.DuoMingShiSanJian_Mediator;
   import com.tgame.moudels.duomingshisanjian.view.DuoMingShiSanJian_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class DuoMingShiSanJian_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "DuoMingShiSanJian_MsgReceivedProxy";
      
      private var _mianPanelMediator:DuoMingShiSanJian_Mediator;
      
      private var _targetMediator:DuoMingShiSanJian_TargetMediator;
      
      public function DuoMingShiSanJian_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get mianPanelMediator() : DuoMingShiSanJian_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(DuoMingShiSanJian_Mediator.NAME) as DuoMingShiSanJian_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      private function get targetPlaneMediator() : DuoMingShiSanJian_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(DuoMingShiSanJian_TargetMediator.NAME) as DuoMingShiSanJian_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([74222,74224,74226],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([74222,74224,74226],NAME);
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
      
      public function received_74222(param1:ByteArray) : void
      {
         ZLog.add("74222：返回玩家夺命十三剑详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:DuoMingShiSanJianVo = new DuoMingShiSanJianVo();
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
         if(_loc2_ == -1)
         {
            this.mianPanelMediator.setPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_74224(param1:ByteArray) : void
      {
         ZLog.add("74224：返回夺命十三剑突破信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mianPanelMediator.setTupoPanel(_loc2_,_loc5_,_loc6_,_loc7_,_loc3_,_loc4_,_loc8_);
      }
      
      public function received_74226(param1:ByteArray) : void
      {
         ZLog.add("74226: 返回突破夺命十三剑结果");
         var _loc2_:int = param1.readByte();
         this.mianPanelMediator.setTupoResult(_loc2_);
      }
   }
}

