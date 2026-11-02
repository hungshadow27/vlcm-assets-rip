package com.tgame.moudels.shuXingDaZaoKa.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.shuXingDaZaoKa.view.ShuXingDaZaoKa_ShuXingDaZaoKaMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ShuXingDaZaoKa_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "ShuXingDaZaoKa_MsgReceivedProxy";
      
      private var _shuXingDaZaoKaMediator:ShuXingDaZaoKa_ShuXingDaZaoKaMediator;
      
      public function ShuXingDaZaoKa_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([53022],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([53022],NAME);
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
      
      public function received_53022(param1:ByteArray) : void
      {
         ZLog.add("50902：属性打造卡合成返回");
         var _loc2_:int = param1.readByte();
         this.shuXingDaZaoKaMediator.getMsg(_loc2_);
      }
      
      private function get shuXingDaZaoKaMediator() : ShuXingDaZaoKa_ShuXingDaZaoKaMediator
      {
         if(!this._shuXingDaZaoKaMediator)
         {
            this._shuXingDaZaoKaMediator = facade.retrieveMediator(ShuXingDaZaoKa_ShuXingDaZaoKaMediator.NAME) as ShuXingDaZaoKa_ShuXingDaZaoKaMediator;
         }
         return this._shuXingDaZaoKaMediator;
      }
   }
}

