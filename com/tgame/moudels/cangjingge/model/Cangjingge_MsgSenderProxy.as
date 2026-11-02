package com.tgame.moudels.cangjingge.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.cangjingge.view.Cangjingge_PanelMediator;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Cangjingge_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "Cangjingge_MsgSenderProxy";
      
      public function Cangjingge_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_52041(param1:* = null) : void
      {
         ZLog.add("52041：藏经阁境界 主面板 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         if(Cangjingge_PanelMediator.jingjie_name.length == 0)
         {
            _loc2_.writeByte(int(0));
         }
         else
         {
            _loc2_.writeByte(int(1));
         }
         NetWorkManager.sendMsg(52041,_loc2_);
      }
      
      public function send_52043(param1:* = null) : void
      {
         ZLog.add("52043：藏经阁境界 突破境界 请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(52043,_loc2_);
      }
      
      public function send_52045(param1:* = null) : void
      {
         ZLog.add("52045：藏经阁境界 申请领悟");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeByte(int(param1));
         NetWorkManager.sendMsg(52045,_loc2_);
      }
      
      public function send_52047(param1:* = null) : void
      {
         ZLog.add("52047：藏经阁境界 其他玩家 信息请求");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1));
         NetWorkManager.sendMsg(52047,_loc2_);
      }
   }
}

