package com.tgame.moudels.aojianzhuzao.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.aojianzhuzao.view.AoJianZhuZao_AoJianZhuZaoMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class AoJianZhuZao_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "AoJianZhuZao_MsgReceivedProxy";
      
      public function AoJianZhuZao_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([58102,58104],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([58102,58104],NAME);
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
      
      private function get aojianzhuzaoMediator() : AoJianZhuZao_AoJianZhuZaoMediator
      {
         return facade.retrieveMediator(AoJianZhuZao_AoJianZhuZaoMediator.NAME) as AoJianZhuZao_AoJianZhuZaoMediator;
      }
      
      public function received_58102(param1:ByteArray) : void
      {
         ZLog.add("58101:请求放入傲剑碎片成功!");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         this.aojianzhuzaoMediator.sucess_Fang(_loc2_,_loc3_);
      }
      
      public function received_58104(param1:ByteArray) : void
      {
         var _loc2_:int = param1.readByte();
         if(_loc2_ != 0)
         {
            if(_loc2_ == 1)
            {
               this.aojianzhuzaoMediator.sucess_zhuzao();
            }
         }
      }
   }
}

