package com.tgame.moudels.newPlayerGuide.model
{
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class NewPlayerGuide_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "NewPlayerGuide_msgSendProxy";
      
      public function NewPlayerGuide_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         NewPlayerGuideStaticFun.sendMsg50563 = this.send_50563;
         NewPlayerGuideStaticFun.sendMsg50565 = this.send_50565;
      }
      
      public function send_50563(param1:* = null) : void
      {
         ZLog.add("50653：保存一个新手引导的完成状态");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.type);
         _loc2_.writeByte(param1.isComplete ? 1 : 0);
         _loc2_.writeByte(param1.id);
         _loc2_.writeByte(param1.count);
         NetWorkManager.sendMsg(50653,_loc2_);
      }
      
      public function send_50565(param1:* = null) : void
      {
         ZLog.add("50565：领取帝王黄气");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(50565,_loc2_);
      }
   }
}

