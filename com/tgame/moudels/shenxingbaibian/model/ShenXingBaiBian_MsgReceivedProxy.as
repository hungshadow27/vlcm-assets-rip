package com.tgame.moudels.shenxingbaibian.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.shenxingbaibian.model.info.ShenXingBaiBianVO;
   import com.tgame.moudels.shenxingbaibian.view.ShenXingBaiBian_Mediator;
   import com.tgame.moudels.shenxingbaibian.view.ShenXingBaiBian_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ShenXingBaiBian_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "ShenXingBaiBian_MsgReceivedProxy";
      
      private var _mianPanelMediator:ShenXingBaiBian_Mediator;
      
      private var _targetMediator:ShenXingBaiBian_TargetMediator;
      
      public function ShenXingBaiBian_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      public function get mianPanelMediator() : ShenXingBaiBian_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(ShenXingBaiBian_Mediator.NAME) as ShenXingBaiBian_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      private function get targetPlaneMediator() : ShenXingBaiBian_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(ShenXingBaiBian_TargetMediator.NAME) as ShenXingBaiBian_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([72322,72324,72326],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([72322,72324,72326],NAME);
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
      
      public function received_72322(param1:ByteArray) : void
      {
         ZLog.add("72322：返回玩家神行百变详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:ShenXingBaiBianVO = new ShenXingBaiBianVO();
         _loc3_.nowID = param1.readInt();
         _loc3_.nowLookingID = param1.readInt();
         _loc3_.nowLookingName = param1.readUTF();
         _loc3_.miaoshu = param1.readUTF();
         _loc3_.act = param1.readDouble();
         _loc3_.def = param1.readDouble();
         _loc3_.baoji = param1.readDouble();
         _loc3_.shanbi = param1.readDouble();
         _loc3_.hp = param1.readDouble();
         var _loc4_:int = param1.readInt();
         _loc3_.skillid = _loc4_;
         _loc3_.isLearn = Boolean(param1.readByte() == 1);
         _loc3_.isCheck5 = Boolean(param1.readByte() == 1);
         _loc3_.isCheck6 = Boolean(param1.readByte() == 1);
         if(_loc2_ == -1)
         {
            this.mianPanelMediator.setPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_72324(param1:ByteArray) : void
      {
         ZLog.add("72324：返回神行百变突破信息");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:String = param1.readUTF();
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         this.mianPanelMediator.setTupoPanel(_loc2_,_loc5_,_loc6_,_loc7_,_loc3_,_loc4_,_loc8_);
      }
      
      public function received_72326(param1:ByteArray) : void
      {
         ZLog.add("72326: 返回突破神行百变结果");
         var _loc2_:int = param1.readByte();
         this.mianPanelMediator.setTupoResult(_loc2_);
      }
   }
}

