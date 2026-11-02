package com.tgame.moudels.feilongtanyunshou.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class FeiLongTanYunShou_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "FeiLongTanYunShou_MsgSenderProxy";
      
      public function FeiLongTanYunShou_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_53951(param1:* = null) : void
      {
         ZLog.add("53951：飞龙探云手 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(53951,_loc2_);
      }
      
      public function send_53953(param1:* = null) : void
      {
         ZLog.add("53953：飞龙探云手 领悟面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(53953,_loc2_);
      }
      
      public function send_53955(param1:* = null) : void
      {
         ZLog.add("51955：飞龙探云手 申请领悟");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.id);
         _loc2_.writeByte(param1.isNow);
         NetWorkManager.sendMsg(53955,_loc2_);
      }
      
      public function send_53957(param1:* = null) : void
      {
         ZLog.add("53957：飞龙探云手 他人面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(53957,_loc2_);
      }
      
      public function send_53963(param1:* = null) : void
      {
         ZLog.add("53963：飞龙探云手 开启请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(53963,_loc2_);
      }
   }
}

