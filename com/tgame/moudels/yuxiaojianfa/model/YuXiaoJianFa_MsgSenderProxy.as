package com.tgame.moudels.yuxiaojianfa.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YuXiaoJianFa_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "YuXiaoJianFa_MsgSenderProxy";
      
      public function YuXiaoJianFa_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_70301(param1:* = null) : void
      {
         ZLog.add("70301：请求玩家玉箫剑法阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(70301,_loc2_);
      }
      
      public function send_70303(param1:* = null) : void
      {
         ZLog.add("70303：请求玉箫剑法突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(70303,_loc2_);
      }
      
      public function send_70305(param1:* = null) : void
      {
         ZLog.add("70305：请求玩家玉箫剑法阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70305,_loc2_);
      }
   }
}

