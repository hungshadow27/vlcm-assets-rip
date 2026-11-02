package com.tgame.moudels.xiaoyaoyufeng.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class XiaoYaoYuFeng_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "XiaoYaoYuFeng_MsgSenderProxy";
      
      public function XiaoYaoYuFeng_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_70001(param1:* = null) : void
      {
         ZLog.add("70001：请求玩家逍遥御风详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(70001,_loc2_);
      }
      
      public function send_70003(param1:* = null) : void
      {
         ZLog.add("70003\t\t玩家请求逍遥御风突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(70003,_loc2_);
      }
      
      public function send_70005(param1:* = null) : void
      {
         ZLog.add("70005：请求突破逍遥御风");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70005,_loc2_);
      }
      
      public function send_70007(param1:* = null) : void
      {
         ZLog.add("70007：请求逍遥御风技能设置面板信息");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(70007,_loc2_);
      }
      
      public function send_70009(param1:* = null) : void
      {
         ZLog.add("70009：请求逍遥御风技能设置面板翻页");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1[0]));
         _loc2_.writeByte(int(param1[1]));
         NetWorkManager.sendMsg(70009,_loc2_);
      }
      
      public function send_70015(param1:* = null) : void
      {
         ZLog.add("70015：请求保存设置或关闭面板");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70015,_loc2_);
      }
      
      public function send_70011(param1:* = null) : void
      {
         ZLog.add("70011：请求逍遥御风技能设置面板技能拖拽");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1[0]));
         _loc2_.writeInt(int(param1[1]));
         _loc2_.writeInt(int(param1[2]));
         _loc2_.writeInt(int(param1[3]));
         NetWorkManager.sendMsg(70011,_loc2_);
      }
      
      public function send_70017(param1:* = null) : void
      {
         ZLog.add("70017：请求逍遥御风技能设置面板技能拖拽");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(70017,_loc2_);
      }
   }
}

