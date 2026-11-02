package com.tgame.moudels.ynZongzihuodong.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.ynZongzihuodong.view.YNzongzi_ZhiZuo_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNzongzi_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "YNzongzi_MsgReceivedProxy";
      
      public function YNzongzi_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([78804],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([78804],NAME);
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
      
      private function get YNzongziZhiZuoMediator() : YNzongzi_ZhiZuo_Mediator
      {
         return facade.retrieveMediator(YNzongzi_ZhiZuo_Mediator.NAME) as YNzongzi_ZhiZuo_Mediator;
      }
      
      public function received_78804(param1:ByteArray) : void
      {
         ZLog.add("78804：越南 特殊活动返回");
         var _loc2_:int = param1.readByte();
         this.YNzongziZhiZuoMediator.setTime(10,_loc2_);
      }
   }
}

