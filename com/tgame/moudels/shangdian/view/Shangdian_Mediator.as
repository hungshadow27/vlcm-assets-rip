package com.tgame.moudels.shangdian.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.shangdian.model.Shangdian_MsgSenderProxy;
   import com.tgame.shell.view.components.shangdian.JuezhanshangdianPanel;
   import com.tgame.shell.view.components.shangdian.ZhenpinShangdianPanel;
   import com.tgame.shell.view.components.utils.UITools;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Shangdian_Mediator extends Mediator
   {
      
      public static const NAME:String = "Shangdian_Mediator";
      
      private var _senderProxy:Shangdian_MsgSenderProxy;
      
      private var _zhenpin:ZhenpinShangdianPanel;
      
      private var _juezhan:JuezhanshangdianPanel;
      
      public function Shangdian_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : Shangdian_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Shangdian_MsgSenderProxy.NAME) as Shangdian_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get panel() : ZhenpinShangdianPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.zhenpinshangdianPanel);
         }
         return viewComponent as ZhenpinShangdianPanel;
      }
      
      private function get zhenpinPanel() : ZhenpinShangdianPanel
      {
         if(this._zhenpin == null)
         {
            this._zhenpin = GameInstance.uiInstance.zhenpinshangdianPanel;
         }
         return this._zhenpin;
      }
      
      private function get juezhanPanel() : JuezhanshangdianPanel
      {
         if(this._juezhan == null)
         {
            this._juezhan = GameInstance.uiInstance.juezhanshangdianPanel;
         }
         return this._juezhan;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [PipeConstants.SHOW_XIANSHISHANGDIAN_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case PipeConstants.SHOW_XIANSHISHANGDIAN_PANEL:
               this.senderProxy.send_82181(_loc2_);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ZhenpinShangdianPanel,function():void
         {
            zhenpinPanel.addEventListener(ZhenpinShangdianPanel.FANYE_CLICK,handler);
            zhenpinPanel.addEventListener(ZhenpinShangdianPanel.GOUMAI_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ZhenpinShangdianPanel,function():void
         {
            zhenpinPanel.removeEventListener(ZhenpinShangdianPanel.FANYE_CLICK,handler);
            zhenpinPanel.removeEventListener(ZhenpinShangdianPanel.GOUMAI_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRegisterEvent(JuezhanshangdianPanel,function():void
         {
            juezhanPanel.addEventListener(ZhenpinShangdianPanel.FANYE_CLICK,handler);
            juezhanPanel.addEventListener(ZhenpinShangdianPanel.GOUMAI_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(JuezhanshangdianPanel,function():void
         {
            juezhanPanel.removeEventListener(ZhenpinShangdianPanel.FANYE_CLICK,handler);
            juezhanPanel.removeEventListener(ZhenpinShangdianPanel.GOUMAI_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case ZhenpinShangdianPanel.FANYE_CLICK:
               this.senderProxy.send_82183(_loc2_.data);
               break;
            case ZhenpinShangdianPanel.GOUMAI_CLICK:
               this.senderProxy.send_82185(_loc2_.data);
         }
      }
      
      public function setYongJiuData(param1:Object) : void
      {
         if(param1.type == 1 || param1.type == 3)
         {
            this.zhenpinPanel.setYongJiuData(param1);
            UITools.showPanel(this.zhenpinPanel);
         }
         else if(param1.type == 2 || param1.type == 4)
         {
            this.juezhanPanel.setYongJiuData(param1);
            UITools.showPanel(this.juezhanPanel);
         }
      }
   }
}

