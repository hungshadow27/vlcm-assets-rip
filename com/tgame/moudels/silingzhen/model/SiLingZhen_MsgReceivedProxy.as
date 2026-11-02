package com.tgame.moudels.silingzhen.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.character.info.TeamInfo;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.login.view.*;
   import com.tgame.moudels.silingzhen.view.SiLingZhen_Mediator;
   import com.tgame.moudels.silingzhen.view.SiLingZhen_TargetMediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class SiLingZhen_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "SiLingZhen_MsgReceivedProxy";
      
      private var _msgSenderProxy:SiLingZhen_MsgSenderProxy;
      
      private var _siLingZhenMediator:SiLingZhen_Mediator;
      
      private var _targetSiLingZhenMediator:SiLingZhen_TargetMediator;
      
      public function SiLingZhen_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      private function get msgSenderProxy() : SiLingZhen_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(SiLingZhen_MsgSenderProxy.NAME) as SiLingZhen_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function get siLingZhenMediator() : SiLingZhen_Mediator
      {
         if(!this._siLingZhenMediator)
         {
            this._siLingZhenMediator = facade.retrieveMediator(SiLingZhen_Mediator.NAME) as SiLingZhen_Mediator;
         }
         return this._siLingZhenMediator;
      }
      
      private function get targetSiLingZhenMediator() : SiLingZhen_TargetMediator
      {
         if(!this._targetSiLingZhenMediator)
         {
            this._targetSiLingZhenMediator = facade.retrieveMediator(SiLingZhen_TargetMediator.NAME) as SiLingZhen_TargetMediator;
         }
         return this._targetSiLingZhenMediator;
      }
      
      private function get myTeam() : TeamInfo
      {
         return GameInstance.mainCharData.teamInfo;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([53400,53402],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([53400,53402],NAME);
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
      
      public function received_53400(param1:ByteArray) : void
      {
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readInt();
         if(_loc3_ != -1 && _loc3_ != GameInstance.lookPlayerID)
         {
            return;
         }
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:int = _loc2_.readByte();
         if(_loc3_ == -1)
         {
            this.siLingZhenMediator._arrCurrent = new Array();
            this.siLingZhenMediator._arrCurrent = [[0,0,0],[0,0,0],[0,0,0],[0,0,0]];
         }
         else
         {
            this.targetSiLingZhenMediator._arrCurrent = new Array();
            this.targetSiLingZhenMediator._arrCurrent = [[0,0,0],[0,0,0],[0,0,0],[0,0,0]];
         }
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_)
         {
            _loc11_ = _loc2_.readByte();
            _loc12_ = _loc2_.readInt();
            _loc13_ = _loc2_.readInt();
            if(_loc3_ == -1)
            {
               this.siLingZhenMediator._arrCurrent[_loc11_ - 1] = [_loc12_,_loc13_,_loc13_];
            }
            else
            {
               this.targetSiLingZhenMediator._arrCurrent[_loc11_ - 1] = [_loc12_,_loc13_,_loc13_];
            }
            _loc6_++;
         }
         var _loc7_:int = _loc2_.readByte();
         if(_loc7_ == 1)
         {
            _loc14_ = _loc2_.readInt();
            _loc15_ = _loc2_.readInt();
            _loc16_ = _loc2_.readInt();
         }
         var _loc8_:int = _loc2_.readByte();
         var _loc9_:Boolean = Boolean(_loc2_.readByte() == 1);
         var _loc10_:Boolean = Boolean(_loc2_.readByte() == 1);
         if(_loc7_ == 1)
         {
            if(_loc3_ == -1)
            {
               this.siLingZhenMediator.updateSiLingZhenPanel(_loc4_,_loc14_,_loc15_,_loc16_,_loc8_,_loc9_,_loc10_);
            }
            else
            {
               this.targetSiLingZhenMediator.updateSiLingZhenPanel(_loc4_,_loc14_,_loc15_,_loc16_,_loc8_,_loc9_,_loc10_);
            }
         }
         else if(_loc3_ == -1)
         {
            this.siLingZhenMediator.updateSiLingZhenPanel(_loc4_,0,0,0,_loc8_,_loc9_,_loc10_);
         }
         else
         {
            this.targetSiLingZhenMediator.updateSiLingZhenPanel(_loc4_,0,0,0,_loc8_,_loc9_,_loc10_);
         }
      }
      
      public function received_53402(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         var _loc3_:Boolean = Boolean(_loc2_.readByte());
         var _loc4_:int = _loc2_.readByte();
         var _loc5_:int = _loc2_.readInt();
         var _loc6_:int = _loc2_.readInt();
         var _loc7_:int = _loc2_.readByte();
         if(_loc3_)
         {
            this.siLingZhenMediator._arrCurrent[_loc4_ - 1] = [_loc5_,_loc6_,_loc6_];
            this.siLingZhenMediator.stopTimer();
         }
         else
         {
            this.siLingZhenMediator._arrCurrent[_loc4_ - 1] = [_loc5_,_loc6_,this.siLingZhenMediator._arrCurrent[_loc4_ - 1][1]];
         }
         if(_loc5_ >= 1)
         {
            this.siLingZhenMediator.showUpgradePanel(_loc4_,_loc3_);
         }
      }
   }
}

