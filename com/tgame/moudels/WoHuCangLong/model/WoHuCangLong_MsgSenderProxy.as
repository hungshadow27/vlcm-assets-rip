package com.tgame.moudels.WoHuCangLong.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class WoHuCangLong_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "WoHuCangLong_MsgSenderProxy";
      
      public function WoHuCangLong_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_72751(param1:* = null) : void
      {
         ZLog.add("72751 \t请求卧虎藏龙面板");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(72751,_loc2_);
      }
      
      public function send_72753(param1:* = null) : void
      {
         ZLog.add("72753 \t请求升级武功");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(72753,_loc2_);
      }
      
      public function send_72755(param1:* = null) : void
      {
         ZLog.add("72755 \t卧虎藏龙请求报名");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(72755,_loc2_);
      }
      
      public function send_72761(param1:* = null) : void
      {
         ZLog.add("72761 \t请求头衔数据信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(72761,_loc2_);
      }
      
      public function send_72771(param1:* = null) : void
      {
         ZLog.add("72771 \t请求排行榜界面信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(72771,_loc2_);
      }
   }
}

