package com.tgame.moudels.huyijuexing.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class HuYiJueXing_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "HuYiJueXing_MsgSenderProxy";
      
      public function HuYiJueXing_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_71401(param1:* = null) : void
      {
         ZLog.add("71401：请求玩家虎翼觉醒阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(71401,_loc2_);
      }
      
      public function send_71403(param1:* = null) : void
      {
         ZLog.add("71403：请求虎翼觉醒突破信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(71403,_loc2_);
      }
      
      public function send_71405(param1:* = null) : void
      {
         ZLog.add("71405：请求玩家虎翼觉醒阵详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(71405,_loc2_);
      }
      
      public function send_71407(param1:* = null) : void
      {
         ZLog.add("71407：请求神兵觉醒镶嵌面板信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(71407,_loc2_);
      }
      
      public function send_71409(param1:* = null) : void
      {
         ZLog.add("71409：请求神兵觉醒镶嵌翻页");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1[0]));
         _loc2_.writeInt(int(param1[1]));
         _loc2_.writeByte(int(param1[2]));
         NetWorkManager.sendMsg(71409,_loc2_);
      }
      
      public function send_71411(param1:* = null) : void
      {
         ZLog.add("71411：请求神兵觉醒镶嵌技能拖拽");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1[0]));
         _loc2_.writeInt(int(param1[1]));
         _loc2_.writeInt(int(param1[2]));
         _loc2_.writeInt(int(param1[3]));
         _loc2_.writeInt(int(param1[4]));
         NetWorkManager.sendMsg(71411,_loc2_);
      }
   }
}

