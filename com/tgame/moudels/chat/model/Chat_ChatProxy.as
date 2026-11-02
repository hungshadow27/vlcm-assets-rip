package com.tgame.moudels.chat.model
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.NewPlayerGuideType;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Chat_ChatProxy extends Proxy
   {
      
      public static const NAME:String = "Chat_ChatProxy";
      
      private var _msgSenderProxy:Chat_MsgSendProxy;
      
      private var targetPlayerArr:Array = [];
      
      public function Chat_ChatProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function get msgSenderProxy() : Chat_MsgSendProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(Chat_MsgSendProxy.NAME) as Chat_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function get mainUI() : MainUI
      {
         return GameInstance.uiInstance.mainUI;
      }
      
      private function initEvents() : void
      {
         this.mainUI.addEventListener(MainUI.CHAT_SENDMESSAGEBTN_CLICK,this.mainUIChatHandle);
         this.mainUI.addEventListener(MainUI.CHAT_MENU_CLICK,this.selectedChatChange);
      }
      
      private function selectedChatChange(param1:BaseEvent) : void
      {
         var type:int;
         var name:String;
         var id:int = 0;
         var e:BaseEvent = param1;
         this.targetPlayerArr = e.data as Array;
         type = int(this.targetPlayerArr[0]);
         id = int(this.targetPlayerArr[1]);
         name = this.targetPlayerArr[2];
         switch(type)
         {
            case 1:
               this.mainUI.setPrivateChat(name);
               break;
            case 2:
               GameInstance.lookPlayerID = id;
               if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               }
               PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               break;
            case 3:
               PipeManager.sendMsg(PipeConstants.SEND_ADD_FRIEND,id);
               break;
            case 4:
               PipeManager.sendMsg(PipeConstants.START_TRADE,id);
               break;
            case 5:
               PipeManager.sendMsg(PipeConstants.SEND_TEAM_INVITE,id);
               break;
            case 6:
               PipeManager.sendMsg(PipeConstants.SEND_BANGYAO,id);
               break;
            case 7:
               PipeManager.sendMsg(PipeConstants.LOOK_OTHERCHAR_SHOP_PANEL,id);
               break;
            case 8:
               PipeManager.sendMsg(PipeConstants.SHOW_SEND_FLOWER_PANEL,[id,name,"100"]);
               break;
            case 9:
               GameInstance.readyJieHunID = id;
               PipeManager.sendMsg(PipeConstants.SEND_QIUHUN);
               break;
            case 11:
               FAlert.okLabel = LanResManager.getLanCommonTextWords("确定禁言");
               FAlert.cancelLabel = LanResManager.getLanCommonTextWords("容我想想");
               FAlert.show(LanResManager.getLanCommonTextWords("您确定要将") + name + LanResManager.getLanCommonTextWords("禁言吗？"),"",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     PipeManager.sendMsg(PipeConstants.SEND_JINYAN,id);
                  }
               },true);
         }
      }
      
      private function mainUIChatHandle(param1:BaseEvent) : void
      {
         NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide21);
         NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide22);
         NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide23);
         if(NewPlayerGuideStaticFun.getNewPlayerGuideVO(NewPlayerGuideType.Guide22).getIsComplete)
         {
            NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide23);
         }
         if(NewPlayerGuideStaticFun.getNewPlayerGuideVO(NewPlayerGuideType.Guide21).getIsComplete)
         {
            NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide22);
         }
         var _loc2_:int = int(param1.data[0]);
         var _loc3_:String = param1.data[1];
         var _loc4_:String = param1.data[2];
         var _loc5_:Object = {};
         var _loc6_:ByteArray = new ByteArray();
         switch(_loc2_)
         {
            case 0:
               break;
            case 1:
               _loc5_["chatContent"] = _loc4_;
               this.msgSenderProxy.send_30111(_loc5_);
               break;
            case 2:
               _loc5_["chatContent"] = _loc4_;
               _loc5_["trageName"] = _loc3_;
               this.msgSenderProxy.send_30105(_loc5_);
               break;
            case 3:
               _loc5_["chatContent"] = _loc4_;
               this.msgSenderProxy.send_30109(_loc5_);
               break;
            case 4:
               _loc5_["chatContent"] = _loc4_;
               this.msgSenderProxy.send_30107(_loc5_);
               break;
            case 5:
               _loc5_["chatContent"] = _loc4_;
               this.msgSenderProxy.send_30113(_loc5_);
               break;
            case 6:
               _loc5_["chatContent"] = _loc4_;
               this.msgSenderProxy.send_30151(_loc5_);
               break;
            case 7:
               _loc5_["chatContent"] = _loc4_;
               this.msgSenderProxy.send_GM(_loc5_);
               break;
            default:
               _loc5_["chatContent"] = _loc4_;
               this.msgSenderProxy.send_65530(_loc5_);
         }
      }
   }
}

