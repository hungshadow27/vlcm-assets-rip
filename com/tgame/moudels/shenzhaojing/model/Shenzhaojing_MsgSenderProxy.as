package com.tgame.moudels.shenzhaojing.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Shenzhaojing_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Shenzhaojing_MsgSenderProxy";
      
      public function Shenzhaojing_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_57201(param1:* = null) : void
      {
         ZLog.add("57201：神照经 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(57201,_loc2_);
      }
      
      public function send_57203(param1:* = null) : void
      {
         ZLog.add("57203：神照经 提升速度面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1[0]));
         _loc2_.writeInt(int(param1[1]));
         NetWorkManager.sendMsg(57203,_loc2_);
      }
      
      public function send_57205(param1:* = null) : void
      {
         ZLog.add("57205：神照经 开始提升速度 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1[0]));
         _loc2_.writeInt(int(param1[1]));
         NetWorkManager.sendMsg(57205,_loc2_);
      }
      
      public function send_57207(param1:* = null) : void
      {
         ZLog.add("57207：神照经 使用全部道具提升速度 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1[0]));
         _loc2_.writeInt(int(param1[1]));
         NetWorkManager.sendMsg(57207,_loc2_);
      }
      
      public function send_57209(param1:* = null) : void
      {
         ZLog.add("57209：神照经 等级突破面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(57209,_loc2_);
      }
      
      public function send_57211(param1:* = null) : void
      {
         ZLog.add("57211：神照经 等级突破面板开始突破 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(57211,_loc2_);
      }
      
      public function send_57213(param1:* = null) : void
      {
         ZLog.add("57213：六脉神剑 切换查询数据 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1[0]));
         _loc2_.writeInt(int(param1[1]));
         NetWorkManager.sendMsg(57213,_loc2_);
      }
      
      public function send_57215(param1:* = null) : void
      {
         ZLog.add("57215：神照经 他人主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(57215,_loc2_);
      }
   }
}

