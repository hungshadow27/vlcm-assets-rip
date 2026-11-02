package com.tgame.moudels.chat.model
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.HighEffectManager;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Chat_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "Chat_MsgReceivedProxy";
      
      public function Chat_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([30106,30108,30110,30112,30114,30120,30116,30118,30122],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([30106,30108,30110,30112,30114,30120,30116,30118,30122],NAME);
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
      
      private function get mainUI() : MainUI
      {
         return GameInstance.uiInstance.mainUI;
      }
      
      public function received_30106(param1:* = null) : void
      {
         ZLog.add("30106:收到私聊");
         this.msg(2,param1);
      }
      
      public function received_30108(param1:* = null) : void
      {
         ZLog.add("30108:收到帮会聊");
         this.msg(4,param1);
      }
      
      public function received_30110(param1:* = null) : void
      {
         ZLog.add("30110:收到队伍聊");
         this.msg(3,param1);
      }
      
      public function received_30112(param1:* = null) : void
      {
         ZLog.add("30112:收到普通聊");
         this.msg(1,param1);
      }
      
      public function received_30114(param1:* = null) : void
      {
         ZLog.add("30114:广播聊");
         this.msg(5,param1);
      }
      
      public function received_30116(param1:* = null) : void
      {
         ZLog.add("30116:收到喇叭聊");
         this.msg(6,param1);
      }
      
      public function received_30118(param1:* = null) : void
      {
         ZLog.add("30118:收到商贸喇叭聊");
         this.msg(8,param1);
      }
      
      public function received_30122(param1:* = null) : void
      {
         ZLog.add("30122:收到情人节花语");
         this.msg(7,param1);
      }
      
      public function received_30120(param1:* = null) : void
      {
         ZLog.add("30120:聊天错误");
         var _loc2_:Array = [undefined,2,4,3,1,5,6];
         var _loc3_:int = int(param1.readByte());
         var _loc4_:String = NetWorkManager.readGILMsg(param1);
         this.mainUI.receiveMessage(_loc2_[_loc3_],"",-100,"",-1,_loc4_);
      }
      
      private function msg(param1:int, param2:ByteArray) : void
      {
         var _loc8_:Boolean = false;
         var _loc9_:SceneCharacter = null;
         var _loc10_:RegExp = null;
         var _loc11_:String = null;
         var _loc12_:int = 0;
         var _loc13_:String = null;
         var _loc14_:int = 0;
         var _loc3_:Boolean = param2.readByte() == 1;
         var _loc4_:Boolean = param2.readByte() == 1;
         var _loc5_:int = param2.readInt();
         var _loc6_:String = param2.readUTF();
         var _loc7_:String = param2.readUTF();
         if(param1 == 8)
         {
            _loc7_ = LanResManager.getLanCommonTextWords("走过路过，不要错过，此处的货物最齐全!");
         }
         if(param1 != 2 && param1 != 7)
         {
            _loc8_ = param2.readByte() == 0 ? false : true;
            if(_loc5_ == GameInstance.mainChar.id)
            {
               this.mainUI.receiveMessage(param1,"",-1,"",-1,_loc7_,_loc8_,_loc4_,_loc3_);
            }
            else
            {
               this.mainUI.receiveMessage(param1,_loc6_,_loc5_,"",-1,_loc7_,_loc8_,_loc4_,_loc3_);
            }
            if(param1 == 4)
            {
               PipeManager.sendMsg(PipeConstants.ADD_BANGHUI_CHAT,[_loc6_,_loc7_]);
            }
            else if(param1 == 1 || param1 == 5 || param1 == 6)
            {
               _loc9_ = GameInstance.scene.getCharByID(_loc5_,SceneCharacterType.PLAYER);
               if(_loc9_ == null)
               {
                  return;
               }
               _loc7_ = _loc7_.replace(/</g,"&lt;");
               _loc10_ = /ξgoods(\d+)\,(\d+)\,(\d+)\,(\#[\da-zA-Z]+)\,([^;]+?);/g;
               _loc11_ = "【$5】";
               _loc7_ = _loc7_.replace(_loc10_,_loc11_);
               if(_loc7_ != "")
               {
                  if(param1 == 1)
                  {
                     _loc9_.setHeadFaceTalkText(_loc7_,StaticValue.WHITE);
                  }
                  if(param1 == 5)
                  {
                     _loc9_.setHeadFaceTalkText(_loc7_,StaticValue.YELLOW);
                  }
                  if(param1 == 6)
                  {
                     _loc9_.setHeadFaceTalkText(_loc7_,StaticValue.RED);
                  }
               }
            }
         }
         else
         {
            _loc12_ = param2.readInt();
            _loc13_ = param2.readUTF();
            _loc8_ = param2.readByte() == 0 ? false : true;
            if(param1 == 7)
            {
               _loc14_ = param2.readByte();
               if(_loc14_)
               {
                  HighEffectManager.fenFlower_start(30);
                  HighEffectManager.showFlower_kuang();
               }
            }
            if(_loc5_ == GameInstance.mainChar.id)
            {
               this.mainUI.receiveMessage(param1,"",-1,_loc13_,_loc12_,_loc7_,_loc8_,_loc4_,_loc3_);
            }
            else if(_loc12_ == GameInstance.mainChar.id)
            {
               this.mainUI.receiveMessage(param1,_loc6_,_loc5_,"",-1,_loc7_,_loc8_,_loc4_,_loc3_);
            }
            else
            {
               this.mainUI.receiveMessage(param1,_loc6_,_loc5_,_loc13_,_loc12_,_loc7_,_loc8_,false,_loc3_);
            }
         }
      }
   }
}

