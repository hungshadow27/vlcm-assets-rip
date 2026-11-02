package com.tgame.moudels.settings.model
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.moudels.settings.view.Settings_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Settings_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Settings_MsgReceivedProxy";
      
      public function Settings_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([27002,28002],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([27002,28002],NAME);
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
      
      public function received_27002(param1:ByteArray) : void
      {
         ZLog.add("27002：系统设置保存成功");
      }
      
      public function received_28002(param1:ByteArray) : void
      {
         ZLog.add("28002：返回建议提交成功");
         var _loc2_:Settings_Mediator = facade.retrieveMediator(Settings_Mediator.NAME) as Settings_Mediator;
         _loc2_.unLockBugPanel();
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您的建议已成功提交，非常感谢您对《傲剑》的支持"),false);
      }
   }
}

