package com.tgame.moudels.ynZhimengshangcheng.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class YNzhimengshangcheng_MsgSendProxy extends Proxy
   {
      
      public static const NAME:String = "YNzhimengshangcheng_MsgSendProxy";
      
      public function YNzhimengshangcheng_MsgSendProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      public function send_81131(param1:* = null) : void
      {
         ZLog.add("81131：请求之梦钱庄面板信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81131,_loc2_);
      }
      
      public function send_81133(param1:* = null) : void
      {
         ZLog.add("81133：请求之梦钱庄兑换");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(81133,_loc2_);
      }
      
      public function send_81135(param1:* = null) : void
      {
         ZLog.add("81135：请求王者之帮在线领取装备面板信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81135,_loc2_);
      }
      
      public function send_81137(param1:* = null) : void
      {
         ZLog.add("81137：请求领取王者之帮装备");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81137,_loc2_);
      }
   }
}

