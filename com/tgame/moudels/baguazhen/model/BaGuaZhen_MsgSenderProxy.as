package com.tgame.moudels.baguazhen.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BaGuaZhen_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "BaGuaZhen_MsgSenderProxy";
      
      public function BaGuaZhen_MsgSenderProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function send_81831(param1:* = null) : void
      {
         ZLog.add("81831\t\t请求八卦阵");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(81831,_loc2_);
      }
      
      public function send_81833(param1:* = null) : void
      {
         ZLog.add("81833\t\t请求激活");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(81833,_loc2_);
      }
      
      public function send_81835(param1:* = null) : void
      {
         ZLog.add("81835\t\t八卦阵选中");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(81835,_loc2_);
      }
   }
}

