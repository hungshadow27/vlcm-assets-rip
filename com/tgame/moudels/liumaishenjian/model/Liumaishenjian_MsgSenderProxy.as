package com.tgame.moudels.liumaishenjian.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Liumaishenjian_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Liumaishenjian_MsgSenderProxy";
      
      public function Liumaishenjian_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_54401(param1:* = null) : void
      {
         ZLog.add("54401：六脉神剑 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(54401,_loc2_);
      }
      
      public function send_54403(param1:* = null) : void
      {
         ZLog.add("54403：六脉神剑 切换查询数据 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1[0]));
         _loc2_.writeByte(int(param1[1]));
         NetWorkManager.sendMsg(54403,_loc2_);
      }
      
      public function send_54405(param1:* = null) : void
      {
         ZLog.add("54405：六脉神剑 领悟面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1[0]));
         _loc2_.writeByte(int(param1[1]));
         NetWorkManager.sendMsg(54405,_loc2_);
      }
      
      public function send_54407(param1:* = null) : void
      {
         ZLog.add("54407：六脉神剑 申请领悟");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1.jianId);
         _loc2_.writeByte(param1.chongId);
         NetWorkManager.sendMsg(54407,_loc2_);
      }
      
      public function send_54409(param1:* = null) : void
      {
         ZLog.add("54409：六脉神剑 查看他人面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1[0]));
         _loc2_.writeByte(int(param1[1]));
         NetWorkManager.sendMsg(54409,_loc2_);
      }
   }
}

