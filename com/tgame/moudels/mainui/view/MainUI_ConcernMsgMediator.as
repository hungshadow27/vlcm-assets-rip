package com.tgame.moudels.mainui.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.mainui.model.MainUI_MsgSendProxy;
   import com.tgame.shell.view.components.InfoQueryPanel;
   import flash.events.Event;
   import flash.external.ExternalInterface;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class MainUI_ConcernMsgMediator extends Mediator
   {
      
      public static const NAME:String = "MainUI_NearRadarButtonMediator";
      
      private var isisPanelOnViewing:Boolean = false;
      
      public var ieGuanbiTishi:Array = [["副本名字",1],["任务",1]];
      
      private var _msg:String = "";
      
      private var txtNum:int;
      
      private var oldStr:String = "";
      
      private var _msgSenderProxy:MainUI_MsgSendProxy;
      
      public function MainUI_ConcernMsgMediator()
      {
         super(NAME);
      }
      
      protected function get msgPlane() : InfoQueryPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.infoQueryPanel);
         }
         return viewComponent as InfoQueryPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      public function getMsg(param1:Date, param2:String) : void
      {
         this.msgPlane.SetInitializeAffiche(param1,param2);
      }
      
      public function myMsg(param1:String) : void
      {
         this.showMsg(param1);
      }
      
      private function showMsg(param1:String) : void
      {
         this.msgPlane.SetInitializeIndividualNews(param1);
      }
      
      public function waitTodo(param1:Array) : void
      {
         if(!this.isisPanelOnViewing)
         {
            return;
         }
         this.msgPlane.setInitializeTodopanel(param1);
      }
      
      public function setIeGuanbiTishiFun(param1:Array) : void
      {
         this.ieGuanbiTishi = param1;
         var _loc2_:String = "";
         var _loc3_:int = 0;
         while(_loc3_ < this.ieGuanbiTishi.length)
         {
            _loc2_ += "★" + this.ieGuanbiTishi[_loc3_][0] + LanResManager.getLanCommonTextWords("剩余1") + this.ieGuanbiTishi[_loc3_][1] + LanResManager.getLanCommonTextWords("次") + "\n";
            _loc3_++;
         }
         try
         {
            if(this.oldStr != _loc2_)
            {
               ExternalInterface.call("setTips",_loc2_);
               this.oldStr = _loc2_;
            }
         }
         catch(e:Error)
         {
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(InfoQueryPanel,function():void
         {
            msgPlane.addEventListener(Event.ADDED_TO_STAGE,mainCharBackpackHandle);
            msgPlane.addEventListener(Event.REMOVED_FROM_STAGE,panelClose);
            msgPlane.addEventListener(Event.ADDED_TO_STAGE,onAdd2Stage);
            msgPlane.addEventListener(InfoQueryPanel.GETACCOMPLISHMENT,mainCharBackpackHandle);
            msgPlane.addEventListener(InfoQueryPanel.GERENCHENGHAOPANEL,mainCharBackpackHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(InfoQueryPanel,function():void
         {
            msgPlane.removeEventListener(Event.ADDED_TO_STAGE,mainCharBackpackHandle);
            msgPlane.removeEventListener(Event.REMOVED_FROM_STAGE,panelClose);
            msgPlane.removeEventListener(InfoQueryPanel.GETACCOMPLISHMENT,mainCharBackpackHandle);
            msgPlane.removeEventListener(InfoQueryPanel.GERENCHENGHAOPANEL,mainCharBackpackHandle);
         });
      }
      
      private function onAdd2Stage(param1:Event) : void
      {
      }
      
      private function mainCharBackpackHandle(param1:Event = null) : void
      {
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case Event.ADDED_TO_STAGE:
               this.isisPanelOnViewing = true;
               this.msgSenderProxy.send_40031();
               break;
            case InfoQueryPanel.GETACCOMPLISHMENT:
               PipeManager.sendMsg(PipeConstants.SHOW_CHENGJIU_PANEL,[0,""]);
               break;
            case InfoQueryPanel.GERENCHENGHAOPANEL:
               PipeManager.sendMsg(PipeConstants.SHOW_GERENCHENGHAO_PANEL);
         }
      }
      
      private function panelClose(param1:* = null) : void
      {
         this.isisPanelOnViewing = false;
      }
      
      private function get msgSenderProxy() : MainUI_MsgSendProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(MainUI_MsgSendProxy.NAME) as MainUI_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
   }
}

