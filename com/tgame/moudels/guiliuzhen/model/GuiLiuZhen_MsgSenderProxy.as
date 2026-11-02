package com.tgame.moudels.guiliuzhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class GuiLiuZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "GuiLiuZhen_MsgSenderProxy";
      
      public function GuiLiuZhen_MsgSenderProxy()
      {
         super(NAME);
      }
      
      public function send_61601(param1:* = null) : void
      {
         ZLog.add("61601\t\t请求玩家归流阵移详细数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(61601,_loc2_);
      }
      
      public function send_61603(param1:* = null) : void
      {
         ZLog.add("61603\t\t玩家请求归流阵突破数据");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(61603,_loc2_);
      }
      
      public function send_61605(param1:* = null) : void
      {
         ZLog.add("61605\t\t请求突破归流阵");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(61605,_loc2_);
      }
   }
}

