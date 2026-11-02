package com.tgame.moudels.lianti.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.lianti.view.Lianti_MaincharLiantiPanelMediator;
   import com.tgame.moudels.lianti.view.Lianti_TargetLiantiPanelMediator;
   import com.tgame.moudels.login.view.*;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Lianti_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Lianti_MsgReceivedProxy";
      
      private var _lianti_MaincharLiantiPanelMediator:Lianti_MaincharLiantiPanelMediator;
      
      private var _lianti_TargetCharLiantiPanelMediator:Lianti_TargetLiantiPanelMediator;
      
      private var _msgSender:Lianti_MsgSenderProxy;
      
      public function Lianti_MsgReceivedProxy()
      {
         super();
      }
      
      private function get lianti_MaincharLiantiPanelMediator() : Lianti_MaincharLiantiPanelMediator
      {
         if(!this._lianti_MaincharLiantiPanelMediator)
         {
            this._lianti_MaincharLiantiPanelMediator = facade.retrieveMediator(Lianti_MaincharLiantiPanelMediator.NAME) as Lianti_MaincharLiantiPanelMediator;
         }
         return this._lianti_MaincharLiantiPanelMediator;
      }
      
      private function get lianti_TargetCharLiantiPanelMediator() : Lianti_TargetLiantiPanelMediator
      {
         if(!this._lianti_TargetCharLiantiPanelMediator)
         {
            this._lianti_TargetCharLiantiPanelMediator = facade.retrieveMediator(Lianti_TargetLiantiPanelMediator.NAME) as Lianti_TargetLiantiPanelMediator;
         }
         return this._lianti_TargetCharLiantiPanelMediator;
      }
      
      private function get msgSender() : Lianti_MsgSenderProxy
      {
         if(!this._msgSender)
         {
            this._msgSender = facade.retrieveProxy(Lianti_MsgSenderProxy.NAME) as Lianti_MsgSenderProxy;
         }
         return this._msgSender;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([53002,53004,53006,53008,53010,53016],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([53002,53004,53006,53008,53010,53016],NAME);
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
      
      public function received_53002(param1:ByteArray) : void
      {
         ZLog.add("53002： 返回指定角色当前炼体级别");
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:Array = [_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt(),_loc2_.readInt()];
         var _loc6_:Boolean = _loc2_.readByte() == 1;
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         var _loc11_:Boolean = _loc2_.readByte() == 1;
         var _loc12_:Object = new Object();
         var _loc13_:Array = [];
         _loc12_.isJihuoMohua = _loc2_.readByte() == 1;
         _loc12_.gjMhNum = _loc2_.readInt();
         _loc12_.gj = _loc2_.readInt();
         _loc12_.fyMhNum = _loc2_.readInt();
         _loc12_.fy = _loc2_.readInt();
         _loc13_.push(_loc12_);
         var _loc14_:Boolean = _loc2_.readByte() == 1;
         if(_loc3_ == GameInstance.mainChar.id)
         {
            this.lianti_MaincharLiantiPanelMediator.updateLiantiUI(_loc4_,_loc5_,_loc6_,_loc11_,_loc13_);
            this.lianti_MaincharLiantiPanelMediator.initializeMainUI(_loc4_,_loc7_,_loc8_,_loc9_,_loc10_);
            this.lianti_MaincharLiantiPanelMediator.zuoqi(_loc14_);
         }
         else if(_loc3_ == GameInstance.lookPlayerID)
         {
            GameInstance.lookPlayerData.attributeInfo.currentLiantiID = _loc4_;
            this.lianti_TargetCharLiantiPanelMediator.updateLiantiUI(_loc4_,_loc5_,_loc6_,_loc11_,_loc13_);
            this.lianti_TargetCharLiantiPanelMediator.initializeMainUI(_loc4_,_loc7_,_loc8_,_loc9_,_loc10_);
            this.lianti_TargetCharLiantiPanelMediator.zuoqi(_loc14_);
         }
      }
      
      public function received_53004(param1:ByteArray) : void
      {
         ZLog.add("53004： 返回主角提升炼体境界面板");
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
      
      public function received_53006(param1:ByteArray) : void
      {
         var _loc5_:String = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readByte();
         if(_loc4_ == 1)
         {
            ZLog.add("53006： 主角提升炼体结果,成功");
            this.lianti_MaincharLiantiPanelMediator.updateTishengSucc(_loc3_);
         }
         else
         {
            _loc5_ = NetWorkManager.readGILMsg(_loc2_);
            ZLog.add("53006： 主角提升炼体结果," + _loc5_);
            this.lianti_MaincharLiantiPanelMediator.updateTishengFail(_loc4_,_loc3_,_loc5_);
         }
      }
      
      public function received_53008(param1:ByteArray) : void
      {
         ZLog.add("53008： 返回食用山鹿绒等炼体属性发生变化（客户端需要刷新面板）");
         this.lianti_MaincharLiantiPanelMediator.f5();
      }
      
      public function received_53010(param1:ByteArray) : void
      {
         ZLog.add("53010： 返回激活肉身隐藏属性响应");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.lianti_MaincharLiantiPanelMediator.f5();
         }
      }
      
      public function received_53016(param1:ByteArray) : void
      {
         ZLog.add("53016： 返回激活肉身大金龙属性响应");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.lianti_MaincharLiantiPanelMediator.f5();
         }
      }
   }
}

