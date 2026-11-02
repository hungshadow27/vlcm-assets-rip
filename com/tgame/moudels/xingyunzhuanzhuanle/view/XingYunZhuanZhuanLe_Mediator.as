package com.tgame.moudels.xingyunzhuanzhuanle.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xingyunzhuanzhuanle.XingYunZhuanZhuanLe_ApplicationFacade;
   import com.tgame.moudels.xingyunzhuanzhuanle.model.XingYunZhuanZhuanLe_MsgSenderProxy;
   import com.tgame.shell.view.components.utils.UITools;
   import com.tgame.shell.view.components.xingyunzhuanzhuanle.DingFengYunPanPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XingYunZhuanZhuanLe_Mediator extends Mediator
   {
      
      public static const NAME:String = "XingYunZhuanZhuanLe_Mediator";
      
      private var _msgSenderProxy:XingYunZhuanZhuanLe_MsgSenderProxy;
      
      public function XingYunZhuanZhuanLe_Mediator()
      {
         super(NAME);
      }
      
      protected function get panel() : DingFengYunPanPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xingYunZhuanZhuanLePanel);
         }
         return viewComponent as DingFengYunPanPanel;
      }
      
      private function get msgSenderProxy() : XingYunZhuanZhuanLe_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(XingYunZhuanZhuanLe_MsgSenderProxy.NAME) as XingYunZhuanZhuanLe_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [XingYunZhuanZhuanLe_ApplicationFacade.SHOW_XINGYUNZHUANZHUANLE_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case XingYunZhuanZhuanLe_ApplicationFacade.SHOW_XINGYUNZHUANZHUANLE_PANEL:
               this.msgSenderProxy.send_82631();
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(DingFengYunPanPanel,function():void
         {
            panel.addEventListener(DingFengYunPanPanel.ZHUANPAN_KAISHI_BTN_CLICK,handel);
            panel.addEventListener(DingFengYunPanPanel.ZHUANPAN_LINGJIANG_BTN_CLICK,handel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(DingFengYunPanPanel,function():void
         {
            panel.removeEventListener(DingFengYunPanPanel.ZHUANPAN_KAISHI_BTN_CLICK,handel);
            panel.removeEventListener(DingFengYunPanPanel.ZHUANPAN_LINGJIANG_BTN_CLICK,handel);
         });
      }
      
      private function handel(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case DingFengYunPanPanel.ZHUANPAN_KAISHI_BTN_CLICK:
               this.msgSenderProxy.send_82633();
               break;
            case DingFengYunPanPanel.ZHUANPAN_LINGJIANG_BTN_CLICK:
               this.msgSenderProxy.send_82635();
         }
      }
      
      public function setData(param1:Object) : void
      {
         UITools.showPanel(this.panel);
         this.panel.setListData(param1.arr1);
         this.panel.setGoods(param1.arr2);
         this.panel.setData(param1.isRecieved,param1.currIndex);
         this.panel.setcishu(param1.count);
      }
      
      public function setResult(param1:Object) : void
      {
         this.panel.setTurn(param1.index);
         this.panel.setcishu(param1.count);
      }
   }
}

