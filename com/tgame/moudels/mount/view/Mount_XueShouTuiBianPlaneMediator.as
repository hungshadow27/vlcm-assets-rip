package com.tgame.moudels.mount.view
{
   import com.greensock.TweenLite;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.mount.Mount_ApplicationFacade;
   import com.tgame.moudels.mount.model.Mount_MsgSenderProxy;
   import com.tgame.shell.view.components.ride.TuiBianResultPanel;
   import com.tgame.shell.view.components.ride.XueShouTuiBianPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Mount_XueShouTuiBianPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "Mount_XueShouTuiBianPlaneMediator";
      
      private var _selectMountID:int = 0;
      
      private var avatar_zizeng:int = 0;
      
      private var mountArr:Array = [];
      
      public var resultPanel:TuiBianResultPanel;
      
      private var _msgSenderProxy:Mount_MsgSenderProxy;
      
      public function Mount_XueShouTuiBianPlaneMediator()
      {
         super(NAME);
      }
      
      protected function get panel() : XueShouTuiBianPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xueShouTuiBianPanel);
         }
         return viewComponent as XueShouTuiBianPanel;
      }
      
      private function get msgSenderProxy() : Mount_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Mount_MsgSenderProxy.NAME) as Mount_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Mount_ApplicationFacade.SHOW_XUESHOUTUIBIAN_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Mount_ApplicationFacade.SHOW_XUESHOUTUIBIAN_PANEL:
               this.msgSenderProxy.send_60685();
               if(!Fun.isVisible(this.panel))
               {
                  GameInstance.uiInstance.uiContainer.addChild(this.panel);
                  this.panel.x = GameConfig.sceneWidth / 2 - this.panel.width / 2;
                  this.panel.y = GameConfig.sceneHeight / 2 - this.panel.height / 2;
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(XueShouTuiBianPanel,function():void
         {
            panel.addEventListener(XueShouTuiBianPanel.UI_RIDE_XUESHOUTUIBIAN_CLICK,uiHandle);
            panel.addEventListener(XueShouTuiBianPanel.UI_RIDE_MOUNT_SETLECT,uiHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(XueShouTuiBianPanel,function():void
         {
            panel.removeEventListener(XueShouTuiBianPanel.UI_RIDE_XUESHOUTUIBIAN_CLICK,uiHandle);
            panel.removeEventListener(XueShouTuiBianPanel.UI_RIDE_MOUNT_SETLECT,uiHandle);
         });
      }
      
      private function uiHandle(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc2_:String = param1.type;
         var _loc3_:BaseEvent = param1 as BaseEvent;
         switch(_loc2_)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case XueShouTuiBianPanel.UI_RIDE_XUESHOUTUIBIAN_CLICK:
               this.msgSenderProxy.send_60687(_loc3_.data);
         }
      }
      
      public function setRideList(param1:int, param2:Array) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
            this.panel.x = GameConfig.sceneWidth / 2 - this.panel.width / 2;
            this.panel.y = GameConfig.sceneHeight / 2 - this.panel.height / 2;
         }
         this.panel.ridelist(param1,param2);
      }
      
      public function setResult(param1:Boolean, param2:String, param3:String) : void
      {
         var onComplete:Function = null;
         var succ:Boolean = param1;
         var name:String = param2;
         var imgUrl:String = param3;
         onComplete = function():void
         {
            if(Boolean(resultPanel) && resultPanel.parent != null)
            {
               resultPanel.parent.removeChild(resultPanel);
            }
            resultPanel.scaleX = 1;
            resultPanel.scaleY = 1;
            resultPanel.x = GameConfig.sceneWidth / 2 - resultPanel.width / 2;
            resultPanel.y = GameConfig.sceneHeight / 2 - resultPanel.height / 2;
            if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
            }
            GameInstance.uiInstance.charAttribute.showWoDeMenPai();
            GameInstance.uiInstance.charAttribute.requstMenPai();
         };
         if(this.panel.parent != null)
         {
            this.panel.parent.removeChild(this.panel);
         }
         if(this.resultPanel == null)
         {
            this.resultPanel = new TuiBianResultPanel();
         }
         this.resultPanel.setData(name,imgUrl);
         this.resultPanel.x = GameConfig.sceneWidth / 2 - this.resultPanel.width / 2;
         this.resultPanel.y = GameConfig.sceneHeight / 2 - this.resultPanel.height / 2;
         GameInstance.uiInstance.uiContainer.addChild(this.resultPanel);
         TweenLite.to(this.resultPanel,2,{
            "scaleX":0.5,
            "scaleY":0.5,
            "onComplete":onComplete
         });
      }
   }
}

