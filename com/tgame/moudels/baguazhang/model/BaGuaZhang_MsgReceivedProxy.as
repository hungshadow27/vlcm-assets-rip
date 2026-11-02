package com.tgame.moudels.baguazhang.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.baguazhang.view.BaGuaZhang_Mediator;
   import com.tgame.moudels.baguazhang.view.TargetPlayerBaGuaZhang_Mediator;
   import com.tgame.moudels.login.view.*;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class BaGuaZhang_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "BaGuaZhang_MsgReceivedProxy";
      
      private var _lianti_MaincharLiantiPanelMediator:BaGuaZhang_Mediator;
      
      private var _targetPlayerLianti_MaincharLiantiPanelMediator:TargetPlayerBaGuaZhang_Mediator;
      
      private var _msgSender:BaGuaZhang_MsgSendProxy;
      
      public function BaGuaZhang_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get lianti_MaincharLiantiPanelMediator() : BaGuaZhang_Mediator
      {
         if(!this._lianti_MaincharLiantiPanelMediator)
         {
            this._lianti_MaincharLiantiPanelMediator = facade.retrieveMediator(BaGuaZhang_Mediator.NAME) as BaGuaZhang_Mediator;
         }
         return this._lianti_MaincharLiantiPanelMediator;
      }
      
      private function get targetPlayerLianti_MaincharLiantiPanelMediator() : TargetPlayerBaGuaZhang_Mediator
      {
         if(!this._targetPlayerLianti_MaincharLiantiPanelMediator)
         {
            this._targetPlayerLianti_MaincharLiantiPanelMediator = facade.retrieveMediator(TargetPlayerBaGuaZhang_Mediator.NAME) as TargetPlayerBaGuaZhang_Mediator;
         }
         return this._targetPlayerLianti_MaincharLiantiPanelMediator;
      }
      
      private function get msgSender() : BaGuaZhang_MsgSendProxy
      {
         if(!this._msgSender)
         {
            this._msgSender = facade.retrieveProxy(BaGuaZhang_MsgSendProxy.NAME) as BaGuaZhang_MsgSendProxy;
         }
         return this._msgSender;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([53902,53904,53906,53908,53910],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([53902,53904,53906,53908,53910],NAME);
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
            ZLog.add("协议号" + _loc2_ + "不存在");
         }
      }
      
      public function received_53902(param1:ByteArray) : void
      {
         ZLog.add("53902： 返回指定角色当前炼体级别");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:Array = [_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),0];
         var _loc6_:Boolean = _loc2_.readByte() == 1;
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         var _loc11_:Boolean = param1.readByte() == 1;
         var _loc12_:int = param1.readInt();
         var _loc13_:Boolean = Boolean(param1.readByte() == 1);
         var _loc14_:Boolean = Boolean(param1.readByte() == 1);
         var _loc15_:Boolean = Boolean(param1.readByte() == 1);
         if(_loc3_ == GameInstance.mainChar.id)
         {
            this.lianti_MaincharLiantiPanelMediator.updateLiantiUI(_loc4_,_loc5_,_loc6_);
            this.lianti_MaincharLiantiPanelMediator.initializeMainUI(_loc4_,_loc7_,_loc8_,_loc9_,_loc10_);
            this.lianti_MaincharLiantiPanelMediator.updateSXFB(_loc11_,_loc12_,500);
            this.lianti_MaincharLiantiPanelMediator.setXueshou(_loc13_);
            this.lianti_MaincharLiantiPanelMediator.setBaGuaDanTian(_loc14_,_loc15_);
         }
         else if(_loc3_ == GameInstance.lookPlayerID)
         {
            GameInstance.lookPlayerData.attributeInfo.currentBaGuaZhangID = _loc4_;
            this.targetPlayerLianti_MaincharLiantiPanelMediator.received_BaGuaZhangInfo(_loc4_,_loc5_,_loc6_);
            this.targetPlayerLianti_MaincharLiantiPanelMediator.initializeMainUI(_loc4_,_loc7_,_loc8_,_loc9_,_loc10_);
            this.targetPlayerLianti_MaincharLiantiPanelMediator.updateSXFB(_loc11_,_loc12_,500);
            this.targetPlayerLianti_MaincharLiantiPanelMediator.setXueshou(_loc13_);
            this.targetPlayerLianti_MaincharLiantiPanelMediator.setBaGuaDanTian(_loc14_,_loc15_);
         }
      }
      
      public function received_53904(param1:ByteArray) : void
      {
         ZLog.add("53904： 返回主角提升炼体境界面板");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = 0;
         if(_loc4_ > 0)
         {
            _loc5_ = _loc2_.readInt();
         }
         this.lianti_MaincharLiantiPanelMediator.updateTishengLiantiUI(_loc3_,_loc4_,_loc5_);
      }
      
      public function received_53906(param1:ByteArray) : void
      {
         var _loc5_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            ZLog.add("53906： 主角提升炼体结果,成功");
            this.lianti_MaincharLiantiPanelMediator.updateTishengSucc(_loc3_);
         }
         else
         {
            _loc5_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("53906： 主角提升炼体结果," + _loc5_);
            this.lianti_MaincharLiantiPanelMediator.updateTishengFail(_loc3_,_loc5_,_loc4_);
         }
      }
      
      public function received_53908(param1:ByteArray) : void
      {
         ZLog.add("53008： 返回食用山鹿绒等炼体属性发生变化（客户端需要刷新面板）");
         this.lianti_MaincharLiantiPanelMediator.f5();
      }
      
      public function received_53910(param1:ByteArray) : void
      {
         ZLog.add("53910： 返回激活肉身隐藏属性响应");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.lianti_MaincharLiantiPanelMediator.f5();
         }
      }
   }
}

