package com.tgame.moudels.ganjiangmoye.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class GanJiangMoYe_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "GanJiangMoYe_MsgSenderProxy";
      
      public function GanJiangMoYe_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_61013(param1:* = -1) : void
      {
         ZLog.add("61013：发出 请求干将莫邪");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(61013,_loc2_);
      }
      
      public function send_61015(param1:* = null) : void
      {
         ZLog.add("61015：发出 请求幻化干将莫邪");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(61015,_loc2_);
      }
      
      public function send_61017(param1:* = null) : void
      {
         ZLog.add("61017：发出 确认锻造干将莫邪");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(61017,_loc2_);
      }
   }
}

