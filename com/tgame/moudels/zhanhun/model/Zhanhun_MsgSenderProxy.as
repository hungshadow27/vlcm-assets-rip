package com.tgame.moudels.zhanhun.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Zhanhun_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Zhanhun_MsgSenderProxy";
      
      public function Zhanhun_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_55831(param1:*) : void
      {
         ZLog.add("55831：发出 请求战魂");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(55831,_loc2_);
      }
      
      public function send_55833(param1:*) : void
      {
         ZLog.add("55833：发出 包裹拖入战魂确定");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         _loc2_.writeShort(param1[2]);
         NetWorkManager.sendMsg(55833,_loc2_);
      }
      
      public function send_55835(param1:*) : void
      {
         ZLog.add("55835：发出 战魂位置移动");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         _loc2_.writeByte(param1[2]);
         NetWorkManager.sendMsg(55835,_loc2_);
      }
      
      public function send_55837(param1:*) : void
      {
         ZLog.add("55837：发出 单击战魂卸下");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         _loc2_.writeShort(param1[2]);
         NetWorkManager.sendMsg(55837,_loc2_);
      }
   }
}

