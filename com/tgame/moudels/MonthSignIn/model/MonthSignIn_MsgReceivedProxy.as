package com.tgame.moudels.MonthSignIn.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.MonthSignIn.view.MonthSignIn_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class MonthSignIn_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "MonthSignIn_MsgReceivedProxy";
      
      private var _monthsigninMediator:MonthSignIn_Mediator;
      
      public function MonthSignIn_MsgReceivedProxy()
      {
         super(NAME);
      }
      
      private function get monthsigninMediator() : MonthSignIn_Mediator
      {
         if(!this._monthsigninMediator)
         {
            this._monthsigninMediator = facade.retrieveMediator(MonthSignIn_Mediator.NAME) as MonthSignIn_Mediator;
         }
         return this._monthsigninMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([60422,60424,60426,60428],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([60422,60424,60426,60428],NAME);
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
      
      public function received_60422(param1:ByteArray) : void
      {
         var _loc7_:int = 0;
         var _loc11_:Object = null;
         var _loc12_:int = 0;
         var _loc13_:Array = null;
         var _loc14_:int = 0;
         var _loc15_:int = 0;
         var _loc16_:Boolean = false;
         var _loc17_:Object = null;
         ZLog.add("60422：返回签到月历面板");
         var _loc2_:int = param1.readInt();
         var _loc3_:int = param1.readInt();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:Array = new Array();
         _loc7_ = 0;
         while(_loc7_ < _loc3_)
         {
            _loc11_ = new Object();
            _loc11_.day = param1.readByte();
            _loc11_.week = param1.readByte();
            _loc11_.isQian = param1.readByte();
            _loc6_.push(_loc11_);
            _loc7_++;
         }
         var _loc8_:int = param1.readByte();
         var _loc9_:Array = new Array();
         _loc7_ = 0;
         while(_loc7_ < _loc8_)
         {
            _loc11_ = new Object();
            _loc11_.type = param1.readByte();
            _loc12_ = param1.readInt();
            _loc13_ = new Array();
            _loc14_ = 0;
            while(_loc14_ < _loc12_)
            {
               _loc17_ = new Object();
               _loc17_.goid = param1.readInt();
               _loc17_.goNum = param1.readInt();
               _loc13_.push(_loc17_);
               _loc14_++;
            }
            _loc15_ = param1.readInt();
            _loc11_.lijin = _loc15_ / 50;
            _loc11_.isLing = param1.readByte();
            _loc16_ = false;
            if(_loc4_ >= _loc11_.type && _loc11_.isLing == 0)
            {
               _loc16_ = true;
            }
            else
            {
               _loc16_ = false;
            }
            this.monthsigninMediator.setGoods(_loc13_,_loc11_.lijin,_loc11_.type,_loc16_,_loc11_.isLing);
            _loc7_++;
         }
         var _loc10_:int = param1.readByte();
         this.monthsigninMediator.showPanel();
         this.monthsigninMediator.initDay(_loc3_,_loc6_,_loc5_,_loc10_);
         this.monthsigninMediator.setValue(_loc2_,_loc4_);
      }
      
      public function received_60424(param1:ByteArray) : void
      {
         ZLog.add("60424：返回领奖结果");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.monthsigninMediator.setGetBtnEn(false);
         }
      }
      
      public function received_60426(param1:ByteArray) : void
      {
         ZLog.add("60426：返回领奖结果");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.monthsigninMediator.setBtnEn(false);
         }
      }
      
      public function received_60428(param1:ByteArray) : void
      {
         ZLog.add("60428：返回是否显示面板");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 1)
         {
            this.monthsigninMediator.showPanel();
         }
         GameInstance.uiInstance.mainUI.seQianDaoBtnVisible(true);
      }
   }
}

