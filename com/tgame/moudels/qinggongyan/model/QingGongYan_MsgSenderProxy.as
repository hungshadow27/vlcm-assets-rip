package com.tgame.moudels.qinggongyan.model
{
   import com.tgame.manager.NetWorkManager;
   import com.zcp.common.log.ZLog;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class QingGongYan_MsgSenderProxy extends Proxy
   {
      
      public static const NAME:String = "QingGongYan_MsgSenderProxy";
      
      public function QingGongYan_MsgSenderProxy()
      {
         super(NAME,null);
      }
      
      public function send_55501(param1:* = null) : void
      {
         ZLog.add("55501：请求庆功宴餐桌信息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1.tableID));
         NetWorkManager.sendMsg(55501,_loc2_);
      }
      
      public function send_55503(param1:* = null) : void
      {
         ZLog.add("55503：食用庆功宴餐桌消息");
         var _loc2_:ByteArray = new ByteArray();
         _loc2_.writeInt(int(param1.tableID));
         NetWorkManager.sendMsg(55503,_loc2_);
      }
   }
}

