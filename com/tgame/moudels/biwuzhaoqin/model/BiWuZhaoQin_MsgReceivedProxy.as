package com.tgame.moudels.biwuzhaoqin.model
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.SmallLoadingBar;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.moudels.biwuzhaoqin.view.BiWuZhaoQin_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BiWuZhaoQin_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "BiWuZhaoQin_MsgReceivedProxy";
      
      private var _biWuZhaoQin_Mediator:BiWuZhaoQin_Mediator;
      
      private var _msg_sender:BiWuZhaoQin_MsgSenderProxy;
      
      public function BiWuZhaoQin_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      public function get biWuZhaoQin_Mediator() : BiWuZhaoQin_Mediator
      {
         if(!this._biWuZhaoQin_Mediator)
         {
            this._biWuZhaoQin_Mediator = facade.retrieveMediator(BiWuZhaoQin_Mediator.NAME) as BiWuZhaoQin_Mediator;
         }
         return this._biWuZhaoQin_Mediator;
      }
      
      private function get msg_sender() : BiWuZhaoQin_MsgSenderProxy
      {
         if(!this._msg_sender)
         {
            this._msg_sender = facade.retrieveProxy(BiWuZhaoQin_MsgSenderProxy.NAME) as BiWuZhaoQin_MsgSenderProxy;
         }
         return this._msg_sender;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([61502,61506,61508,61510],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([61502,61506,61508,61510],NAME);
      }
      
      private function receivedMsgHandle(param1:Notification) : void
      {
         var _loc2_:* = param1.name;
         var _loc3_:ByteArray = param1.body as ByteArray;
         if(this.hasOwnProperty("received_" + _loc2_))
         {
            this["received_" + _loc2_](_loc3_);
         }
         else
         {
            ZLog.add("协议号 " + _loc2_ + "不存在");
         }
      }
      
      public function received_61502(param1:ByteArray) : void
      {
         ZLog.add("61502：比武招亲界面信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:String = _loc2_.readUTF();
         var _loc4_:int = _loc2_.readInt();
         this.biWuZhaoQin_Mediator.showBiWuZhaoQinPanel(_loc3_,_loc4_);
      }
      
      public function received_61506(param1:ByteArray) : void
      {
         ZLog.add("61506：返回抢绣球倒计时");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         SmallLoadingBar.showLoading(LanResManager.getLanCommonTextWords("绣球争抢中"),_loc3_ * 1000);
      }
      
      public function received_61508(param1:ByteArray) : void
      {
         var _loc4_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         if(_loc3_ == 1)
         {
            ZLog.add("61508：返回抢绣球成功");
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("绣球争抢成功"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("绣球争抢成功"),false);
         }
         else
         {
            _loc4_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("61508：返回抢绣球失败" + _loc2_);
            NoticeManager.notify(NoticeManager.FOOT,_loc4_);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc4_);
         }
         SmallLoadingBar.close();
      }
      
      public function received_61510(param1:ByteArray) : void
      {
         ZLog.add("61510：比武招亲实时信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:Object = {};
         _loc3_.xiuqiuX = _loc2_.readShort();
         _loc3_.xiuqiuY = _loc2_.readShort();
         _loc3_.chiyouzhe = _loc2_.readUTF();
         _loc3_.tingliuShijian = _loc2_.readByte();
         _loc3_.shengyuJieshuShijian = _loc2_.readByte();
         this.biWuZhaoQin_Mediator.receive_time(_loc3_);
      }
   }
}

