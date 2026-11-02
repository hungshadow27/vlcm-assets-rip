package com.tgame.moudels.TianJiangXiangRui.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.TianJiangXiangRui.TianJiangXiangRui_ApplicationFacade;
   import com.tgame.moudels.TianJiangXiangRui.model.TianJiangXiangRui_MsgSenderProxy;
   import com.tgame.shell.view.components.TianJiangXiangRuiPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TianJiangXiangRui_Mediator extends Mediator
   {
      
      public static const NAME:String = "TianJiangXiangRui_Mediator";
      
      private var _senderProxy:TianJiangXiangRui_MsgSenderProxy;
      
      public function TianJiangXiangRui_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : TianJiangXiangRui_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(TianJiangXiangRui_MsgSenderProxy.NAME) as TianJiangXiangRui_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get panel() : TianJiangXiangRuiPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.tianJiangXiangRuiPanel);
         }
         return viewComponent as TianJiangXiangRuiPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [TianJiangXiangRui_ApplicationFacade.SHOW_TIANJIANGXIANGRUI];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case TianJiangXiangRui_ApplicationFacade.SHOW_TIANJIANGXIANGRUI:
               this.senderProxy.send_61401();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TianJiangXiangRuiPanel,function():void
         {
            panel.addEventListener(TianJiangXiangRuiPanel.TIANJIANGXIANGRUI_CHUANSHONG,panelHandle);
            panel.addEventListener(TianJiangXiangRuiPanel.TIANJIANGXIANGRUI_QINGQIU_GOODS,panelHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TianJiangXiangRuiPanel,function():void
         {
            panel.removeEventListener(TianJiangXiangRuiPanel.TIANJIANGXIANGRUI_CHUANSHONG,panelHandle);
            panel.removeEventListener(TianJiangXiangRuiPanel.TIANJIANGXIANGRUI_QINGQIU_GOODS,panelHandle);
         });
      }
      
      private function panelHandle(param1:Event) : void
      {
         var _loc3_:int = 0;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case TianJiangXiangRuiPanel.TIANJIANGXIANGRUI_CHUANSHONG:
               _loc3_ = (param1 as BaseEvent).data as int;
               this.senderProxy.send_61405(_loc3_);
               break;
            case TianJiangXiangRuiPanel.TIANJIANGXIANGRUI_QINGQIU_GOODS:
               this.senderProxy.send_61403();
         }
      }
      
      public function showPanel(param1:Array) : void
      {
         GameInstance.uiInstance.uiContainer.addChild(this.panel);
         this.panel.x = (GameConfig.sceneWidth - this.panel.panelWidth) / 2;
         this.panel.y = (GameConfig.sceneHeight - this.panel.panelHeight) / 2;
         this.panel.setData(param1);
      }
      
      public function showGoodsPanel(param1:Array) : void
      {
         this.panel.showGoods(param1);
      }
   }
}

