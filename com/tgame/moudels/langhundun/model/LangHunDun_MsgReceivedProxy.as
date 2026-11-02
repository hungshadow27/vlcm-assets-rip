package com.tgame.moudels.langhundun.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.langhundun.model.info.LangHunDunVO;
   import com.tgame.moudels.langhundun.view.LangHunDun_Mediator;
   import com.tgame.moudels.langhundun.view.LangHunDun_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class LangHunDun_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "LangHunDun_MsgReceivedProxy";
      
      private var _mianPanelMediator:LangHunDun_Mediator;
      
      private var _targetMediator:LangHunDun_TargetMediator;
      
      public function LangHunDun_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(param1,param2);
      }
      
      public function get mianPanelMediator() : LangHunDun_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(LangHunDun_Mediator.NAME) as LangHunDun_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      private function get targetPlaneMediator() : LangHunDun_TargetMediator
      {
         if(!this._targetMediator)
         {
            this._targetMediator = facade.retrieveMediator(LangHunDun_TargetMediator.NAME) as LangHunDun_TargetMediator;
         }
         return this._targetMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([72492,72494,72496],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([72492,72494,72496],NAME);
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
      
      public function received_72492(param1:ByteArray) : void
      {
         ZLog.add("72492：返回玩家狼魂盾详细数据");
         var _loc2_:int = param1.readInt();
         var _loc3_:LangHunDunVO = new LangHunDunVO();
         _loc3_.nowID = param1.readInt();
         _loc3_.act = param1.readDouble();
         _loc3_.hp = param1.readDouble();
         _loc3_.shanbi = param1.readDouble();
         _loc3_.def = param1.readDouble();
         _loc3_.baoji = param1.readDouble();
         _loc3_.nowZhufuzhi = param1.readInt();
         _loc3_.maxZhufuzhi = param1.readInt();
         _loc3_.ishuoyan = Boolean(param1.readByte() == 1);
         var _loc4_:int = param1.readInt();
         _loc3_.skillid = _loc4_;
         _loc3_.chuanyi = Boolean(param1.readByte() == 1);
         _loc3_.isDantian = Boolean(param1.readByte() == 1);
         _loc3_.isTianZhao = Boolean(param1.readByte() == 1);
         if(_loc2_ == -1)
         {
            this.mianPanelMediator.setPanel(_loc3_);
         }
         else
         {
            this.targetPlaneMediator.setPanel(_loc2_,_loc3_);
         }
      }
      
      public function received_72494(param1:ByteArray) : void
      {
         ZLog.add("72494: 返回突破狼魂盾结果");
         var _loc2_:int = param1.readByte();
         this.mianPanelMediator.setTupoResult(_loc2_);
      }
   }
}

