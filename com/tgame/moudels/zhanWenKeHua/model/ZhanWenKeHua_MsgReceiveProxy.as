package com.tgame.moudels.zhanWenKeHua.model
{
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.zhanWenKeHua.view.ZhanWenKeHua_JinChuiZiUseMediator;
   import com.tgame.moudels.zhanWenKeHua.view.ZhanWenKeHua_Mediator;
   import com.tgame.shell.view.components.EquipPuddingTwoPanel;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.events.TimerEvent;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class ZhanWenKeHua_MsgReceiveProxy extends Proxy
   {
      
      public static var index_50168_50178:int;
      
      public static const NAME:String = "ZhanWenKeHua_MsgReceiveProxy";
      
      private var _zhanWenKeHuaMediator:ZhanWenKeHua_Mediator;
      
      private var _zhanWenKeHua_JinChuiZiMediator:ZhanWenKeHua_JinChuiZiUseMediator;
      
      public function ZhanWenKeHua_MsgReceiveProxy()
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([50188,50186,50180,50178,50168,50130,53524],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([50188,50186,50180,50178,50168,50130,53524],NAME);
      }
      
      private function get zhanWenKeHua_Mediator() : ZhanWenKeHua_Mediator
      {
         if(this._zhanWenKeHuaMediator == null)
         {
            this._zhanWenKeHuaMediator = facade.retrieveMediator(ZhanWenKeHua_Mediator.NAME) as ZhanWenKeHua_Mediator;
         }
         return this._zhanWenKeHuaMediator;
      }
      
      private function get zhanWenKeHua_JinChuiZiMediator() : ZhanWenKeHua_JinChuiZiUseMediator
      {
         if(this._zhanWenKeHua_JinChuiZiMediator == null)
         {
            this._zhanWenKeHua_JinChuiZiMediator = facade.retrieveMediator(ZhanWenKeHua_JinChuiZiUseMediator.NAME) as ZhanWenKeHua_JinChuiZiUseMediator;
         }
         return this._zhanWenKeHua_JinChuiZiMediator;
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
      
      public function received_50188(param1:ByteArray) : void
      {
         var t:Timer;
         var isOK:int = 0;
         var timeOver:Function = null;
         var $data:ByteArray = param1;
         timeOver = function(param1:TimerEvent):void
         {
            zhanWenKeHua_Mediator.upDataItem(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_COUNT_SHOW,isOK);
         };
         ZLog.add("战纹刻画之增减附加属性");
         isOK = $data.readByte();
         t = new Timer(150,1);
         t.start();
         t.addEventListener(TimerEvent.TIMER,timeOver);
      }
      
      public function received_50130(param1:ByteArray) : void
      {
         ZLog.add("战纹刻画之替换属性确认");
         var _loc2_:int = param1.readShort();
         var _loc3_:String = param1.readUTF();
         var _loc4_:String = param1.readUTF();
         this.zhanWenKeHua_Mediator.isTiHuanZhanWen(_loc2_,_loc3_,_loc4_);
      }
      
      public function received_50186(param1:ByteArray) : void
      {
         var t:Timer;
         var isOK:int = 0;
         var timeOver:Function = null;
         var $data:ByteArray = param1;
         timeOver = function(param1:TimerEvent):void
         {
            zhanWenKeHua_Mediator.upDataItem(EquipPuddingTwoPanel.UI_EQUIPPUDDING_MODIFT_ATTRIBUTE_VALUE_SHOW,isOK);
         };
         ZLog.add("战纹刻画之重置附加属性值");
         isOK = $data.readByte();
         t = new Timer(150,1);
         t.start();
         t.addEventListener(TimerEvent.TIMER,timeOver);
      }
      
      public function received_50180(param1:ByteArray) : void
      {
         var t:Timer;
         var isOK:int = 0;
         var timeOver:Function = null;
         var $data:ByteArray = param1;
         timeOver = function(param1:TimerEvent):void
         {
            zhanWenKeHua_Mediator.upDataItem(EquipPuddingTwoPanel.UI_EQUIPPUDDING_ZANWEN_SHOW,isOK);
         };
         ZLog.add("战纹刻画");
         isOK = $data.readByte();
         t = new Timer(150,1);
         t.start();
         t.addEventListener(TimerEvent.TIMER,timeOver);
      }
      
      public function received_50168(param1:ByteArray) : void
      {
         ZLog.add("50168：增删条目选择保留/替换 ");
         index_50168_50178 = param1.readShort();
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         this.zhanWenKeHua_Mediator.isResetStrengthenLevel(50168,_loc2_,_loc3_);
      }
      
      public function received_50178(param1:ByteArray) : void
      {
         ZLog.add("50178：条目值选择保留/替换 ");
         index_50168_50178 = param1.readShort();
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         this.zhanWenKeHua_Mediator.isResetStrengthenLevel(50178,_loc2_,_loc3_);
      }
      
      public function received_53524(param1:ByteArray) : void
      {
         ZLog.add("50178：条目值选择保留/替换 ");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = -1;
         if(_loc2_ == 1)
         {
            _loc3_ = param1.readShort();
         }
         this.zhanWenKeHua_JinChuiZiMediator.equipUpDataCommplete(_loc3_);
      }
   }
}

