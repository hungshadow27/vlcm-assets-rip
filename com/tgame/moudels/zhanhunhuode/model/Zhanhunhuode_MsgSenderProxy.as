package com.tgame.moudels.zhanhunhuode.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Zhanhunhuode_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Zhanhunhuode_MsgSenderProxy";
      
      public function Zhanhunhuode_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_55801(param1:* = null) : void
      {
         ZLog.add("55801：请求战魂获取界面战魂列表");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(55801,_loc2_);
      }
      
      public function send_55803(param1:* = null) : void
      {
         ZLog.add("55803：拾取战魂");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(55803,_loc2_);
      }
      
      public function send_55805(param1:* = null) : void
      {
         ZLog.add("55805：拾取战魂");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(55805,_loc2_);
      }
      
      public function send_55807(param1:* = null) : void
      {
         ZLog.add("55807：点击NPC，获取战魂");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1[0]);
         _loc2_.writeByte(param1[1]);
         NetWorkManager.sendMsg(55807,_loc2_);
      }
      
      public function send_55809(param1:* = null) : void
      {
         ZLog.add("55809：一键战魂");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(param1);
         NetWorkManager.sendMsg(55809,_loc2_);
      }
      
      public function send_55811(param1:* = null) : void
      {
         ZLog.add("55811:战魂积分兑换");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(55811,_loc2_);
      }
      
      public function send_55841(param1:* = null) : void
      {
         ZLog.add("55841:乾坤一掷");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(55841,_loc2_);
      }
      
      public function send_55843(param1:* = null) : void
      {
         ZLog.add("55843：请求战魂获取界面战魂列表");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         if(param1[0] == 0)
         {
            _loc2_.writeInt(param1[1]);
         }
         NetWorkManager.sendMsg(55843,_loc2_);
      }
      
      public function send_55845(param1:* = null) : void
      {
         ZLog.add("55845：请求兑换战魂宝石");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1[0]);
         _loc2_.writeInt(param1[1]);
         NetWorkManager.sendMsg(55845,_loc2_);
      }
      
      public function send_55847(param1:* = null) : void
      {
         ZLog.add("55847：请求兑换战魂");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(param1);
         NetWorkManager.sendMsg(55847,_loc2_);
      }
      
      public function send_55907(param1:* = null) : void
      {
         ZLog.add("55907:越南橙色战魂");
         var _loc2_:ByteArray = new ByteArray();
         NetWorkManager.sendMsg(55907,_loc2_);
      }
   }
}

