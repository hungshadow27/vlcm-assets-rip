package com.tgame.moudels.longwenkehua.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class LongWenKeHua_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "LongWenKeHua_MsgSenderProxy";
      
      public function LongWenKeHua_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      public function send_72451(param1:* = null) : void
      {
         ZLog.add("72451：请求装备龙纹刻画进度");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         NetWorkManager.sendMsg(72451,_loc2_);
      }
      
      public function send_72453(param1:* = null) : void
      {
         ZLog.add("72453：请求清除龙纹");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(72453,_loc2_);
      }
      
      public function send_72454(param1:* = null) : void
      {
         ZLog.add("72455：请求龙纹刻画");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         _loc2_.writeByte(param1[2]);
         if(param1[2] == 1)
         {
            _loc2_.writeByte(param1[3]);
         }
         NetWorkManager.sendMsg(72455,_loc2_);
      }
   }
}

