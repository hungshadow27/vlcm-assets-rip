package com.tgame.moudels.ganjiangmoyezhuzao.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.ganjiangmoyezhuzao.view.GanJiangMoYeZhuZao_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class GanJiangMoYeZhuZao_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "GanJiangMoYeZhuZao_MsgReceivedProxy";
      
      public function GanJiangMoYeZhuZao_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([61012],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([61012],NAME);
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
      
      private function get ganjiangmoyezhuzaoMediator() : GanJiangMoYeZhuZao_Mediator
      {
         return facade.retrieveMediator(GanJiangMoYeZhuZao_Mediator.NAME) as GanJiangMoYeZhuZao_Mediator;
      }
      
      public function received_61012(param1:ByteArray) : void
      {
         ZLog.add("61012\t\t铸造行为回包");
         var _loc2_:int = param1.readByte();
         this.ganjiangmoyezhuzaoMediator.sucess_zhuzao(_loc2_);
      }
   }
}

