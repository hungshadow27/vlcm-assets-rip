package com.tgame.moudels.bangpairongyutarget.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.bangpairongyutarget.view.BangPaiRongYuTarget_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BangPaiRongYuTarget_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "BangPaiRongYuTarget_MsgReceivedProxy";
      
      private var _mainPanelMediator:BangPaiRongYuTarget_Mediator;
      
      public function BangPaiRongYuTarget_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      public function get mainPanelMediator() : BangPaiRongYuTarget_Mediator
      {
         if(!this._mainPanelMediator)
         {
            this._mainPanelMediator = facade.retrieveMediator(BangPaiRongYuTarget_Mediator.NAME) as BangPaiRongYuTarget_Mediator;
         }
         return this._mainPanelMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([71024],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([71024],NAME);
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
      
      public function received_71024(param1:ByteArray) : void
      {
         ZLog.add("71024：返回其他帮派城池占领信息");
         var _loc2_:ByteArray = param1;
         var _loc3_:Object = new Object();
         _loc3_.biaoshi = _loc2_.readByte();
         _loc3_.name = _loc2_.readUTF();
         _loc3_.dengji = _loc2_.readInt();
         if(_loc3_.dengji != 0)
         {
            _loc3_.act = _loc2_.readInt();
            _loc3_.def = _loc2_.readInt();
            _loc3_.shanbi = _loc2_.readInt();
            _loc3_.neili = _loc2_.readInt();
            _loc3_.shengming = _loc2_.readInt();
            _loc3_.baoji = _loc2_.readInt();
         }
         this.mainPanelMediator.chengchixinxi(_loc3_);
      }
   }
}

