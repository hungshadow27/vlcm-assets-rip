package com.tgame.moudels.huangjinshu.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.huangjinshu.view.HuangJinShuee_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class HuangJinShu_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "HuangJinShu_MsgReceivedProxy";
      
      private var _wishingTreeMediator:HuangJinShuee_Mediator;
      
      public function HuangJinShu_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      private function get wishingTreeMediator() : HuangJinShuee_Mediator
      {
         if(!this._wishingTreeMediator)
         {
            this._wishingTreeMediator = facade.retrieveMediator(HuangJinShuee_Mediator.NAME) as HuangJinShuee_Mediator;
         }
         return this._wishingTreeMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([73052,73054],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([73052,73054],NAME);
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
      
      public function received_73052(param1:ByteArray) : void
      {
         ZLog.add("73052：返回许愿树面板信息");
         var _loc2_:int = param1.readInt();
         var _loc3_:Boolean = Boolean(param1.readByte());
         this.wishingTreeMediator.setinit(_loc2_,_loc3_);
      }
      
      public function received_73054(param1:ByteArray) : void
      {
         ZLog.add("73054：返回浇水成功");
         var _loc2_:Boolean = param1.readByte() == 1 ? true : false;
         if(_loc2_)
         {
            this.wishingTreeMediator.LoadingBar();
         }
      }
   }
}

