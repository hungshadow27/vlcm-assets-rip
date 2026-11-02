package com.tgame.moudels.moxuezhanchang.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.moxuezhanchang.view.MoXueZhanChangTips_Mediator;
   import com.tgame.moudels.moxuezhanchang.view.MoXueZhanChang_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MoXueZhanChang_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "MoXueZhanChang_MsgReceivedProxy";
      
      private var _moxuezhanchangTipMediator:MoXueZhanChangTips_Mediator;
      
      private var _moxuezhanchangMediator:MoXueZhanChang_Mediator;
      
      public function MoXueZhanChang_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      private function get moxuezhanchangTipMediator() : MoXueZhanChangTips_Mediator
      {
         if(!this._moxuezhanchangTipMediator)
         {
            this._moxuezhanchangTipMediator = facade.retrieveMediator(MoXueZhanChangTips_Mediator.NAME) as MoXueZhanChangTips_Mediator;
         }
         return this._moxuezhanchangTipMediator;
      }
      
      private function get moxuezhanchangMediator() : MoXueZhanChang_Mediator
      {
         if(!this._moxuezhanchangMediator)
         {
            this._moxuezhanchangMediator = facade.retrieveMediator(MoXueZhanChang_Mediator.NAME) as MoXueZhanChang_Mediator;
         }
         return this._moxuezhanchangMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([71964,71966],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([71964,71966],NAME);
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
            ZLog.add("协议号" + _loc2_ + "不存在");
         }
      }
      
      public function received_71964(param1:ByteArray) : void
      {
         ZLog.add("71964：返回 战场内 tips");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(_loc2_ == 1)
         {
            _loc3_ = param1.readInt();
            _loc3_ /= 1000;
            _loc4_ = param1.readInt();
            _loc5_ = param1.readByte();
         }
         this.moxuezhanchangTipMediator.setLeftTopTips(_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      public function received_71966(param1:ByteArray) : void
      {
         ZLog.add("71966：返回 开启11秒倒计时");
         var _loc2_:int = param1.readInt();
         this.moxuezhanchangTipMediator.readyEnter(_loc2_);
      }
   }
}

