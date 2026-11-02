package com.tgame.moudels.beiDouQiXingZhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BeiDouQiXingZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "BeiDouQiXingZhen_MsgSenderProxy";
      
      public function BeiDouQiXingZhen_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_60301(param1:* = null) : void
      {
         ZLog.add("60301：请求北斗七星阵 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(60301,_loc2_);
      }
      
      public function send_60307(param1:* = null) : void
      {
         ZLog.add("60307：玩家请求北斗七星阵突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(60307,_loc2_);
      }
      
      public function send_60309(param1:* = null) : void
      {
         ZLog.add("60309：请求突破北斗七星阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(60309,_loc2_);
      }
      
      public function send_60303(param1:* = null) : void
      {
         ZLog.add("60303：请求可拖入技能");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(60303,_loc2_);
      }
      
      public function send_60305(param1:* = null) : void
      {
         ZLog.add("60305：请求拖入技能");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(60305,_loc2_);
      }
   }
}

