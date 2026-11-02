package com.tgame.moudels.xunzhangduihuan.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xunzhangduihuan.XunZhangDuiHuan_ApplicationFacade;
   import com.tgame.moudels.xunzhangduihuan.model.XunZhangDuiHuan_MsgSenderProxy;
   import com.tgame.shell.view.components.XunzhangDuihuanPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XunZhangDuiHuan_Mediator extends Mediator
   {
      
      public static const NAME:String = "XunZhangDuiHuan_Mediator";
      
      public var pageNow:int;
      
      public var pageTotal:int;
      
      private var _msgSenderProxy:XunZhangDuiHuan_MsgSenderProxy;
      
      public function XunZhangDuiHuan_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      protected function get xunZhangDuiHuanPanel() : XunzhangDuihuanPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xunZhangDuihuanPanel);
         }
         return viewComponent as XunzhangDuihuanPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [XunZhangDuiHuan_ApplicationFacade.SHOW_XUNZHANGDUIHUAN_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:int = _loc2_ as int;
         switch(param1.getName())
         {
            case XunZhangDuiHuan_ApplicationFacade.SHOW_XUNZHANGDUIHUAN_PANEL:
               this.msgSenderProxy.send_59651();
         }
      }
      
      private function get msgSenderProxy() : XunZhangDuiHuan_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(XunZhangDuiHuan_MsgSenderProxy.NAME) as XunZhangDuiHuan_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(XunzhangDuihuanPanel,function():void
         {
            xunZhangDuiHuanPanel.addEventListener(XunzhangDuihuanPanel.UI_PAGE_BTN_CLICK,xunZhangDuiHuanHandle);
            xunZhangDuiHuanPanel.addEventListener(XunzhangDuihuanPanel.UI_DUIHUAN_BTN_CLICK,xunZhangDuiHuanHandle);
            xunZhangDuiHuanPanel.addEventListener(XunzhangDuihuanPanel.UI_START_LAST_BTN_CLICK,xunZhangDuiHuanHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(XunzhangDuihuanPanel,function():void
         {
            xunZhangDuiHuanPanel.removeEventListener(XunzhangDuihuanPanel.UI_PAGE_BTN_CLICK,xunZhangDuiHuanHandle);
            xunZhangDuiHuanPanel.removeEventListener(XunzhangDuihuanPanel.UI_DUIHUAN_BTN_CLICK,xunZhangDuiHuanHandle);
            xunZhangDuiHuanPanel.removeEventListener(XunzhangDuihuanPanel.UI_START_LAST_BTN_CLICK,xunZhangDuiHuanHandle);
         });
      }
      
      private function xunZhangDuiHuanHandle(param1:Event = null) : void
      {
         var baseE:BaseEvent = null;
         var day:int = 0;
         var ary:Array = null;
         var str:String = null;
         var e:Event = param1;
         var type:String = e.type;
         baseE = e as BaseEvent;
         switch(type)
         {
            case XunzhangDuihuanPanel.UI_PAGE_BTN_CLICK:
               day = baseE.data as int;
               this.msgSenderProxy.send_59653([this.pageNow,day]);
               break;
            case XunzhangDuihuanPanel.UI_START_LAST_BTN_CLICK:
               day = baseE.data as int;
               if(day == 1)
               {
                  this.msgSenderProxy.send_59653([1,day]);
               }
               else
               {
                  this.msgSenderProxy.send_59653([this.pageTotal,day]);
               }
               break;
            case XunzhangDuihuanPanel.UI_DUIHUAN_BTN_CLICK:
               ary = baseE.data as Array;
               if(ary[1] == 1)
               {
                  str = "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("您已拥有此勋章，确定继续兑换吗？") + "</font>";
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                  FAlert.show(str,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        msgSenderProxy.send_59655([ary[0],pageNow]);
                     }
                  });
               }
               else
               {
                  this.msgSenderProxy.send_59655([ary[0],this.pageNow]);
               }
         }
      }
      
      public function setXunzhangDuiHuanPanel(param1:Array) : void
      {
         this.xunZhangDuiHuanPanel.setXunzhangDuiHuanPanel(param1);
      }
      
      public function setPageCount(param1:int, param2:int) : void
      {
         this.xunZhangDuiHuanPanel.setPageCount(param1,param2);
      }
   }
}

