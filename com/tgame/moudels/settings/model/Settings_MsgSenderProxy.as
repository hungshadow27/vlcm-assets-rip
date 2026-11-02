package com.tgame.moudels.settings.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Settings_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Settings_MsgSenderProxy";
      
      public function Settings_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_27001(param1:* = null) : void
      {
         ZLog.add("27001：发送系统设置信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(this.trans(param1[1]));
         NetWorkManager.sendMsg(27001,_loc2_);
      }
      
      public function send_28001(param1:* = null) : void
      {
         ZLog.add("28001：角色提交意见");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeUTF(param1[1]);
         _loc2_.writeUTF(param1[2]);
         NetWorkManager.sendMsg(28001,_loc2_);
      }
      
      private function trans(param1:Boolean) : int
      {
         if(param1)
         {
            return 1;
         }
         return 0;
      }
   }
}

