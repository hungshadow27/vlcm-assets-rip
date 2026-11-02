package com.tgame.moudels.tianFu.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.tianFu.TianFu_ApplicationFacade;
   import com.tgame.moudels.tianFu.model.TianFu_MsgSenderProxy;
   import com.tgame.shell.view.components.XiangQianTianFuPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XiangQianTianFu_Mediator extends Mediator
   {
      
      public static const NAME:String = "XiangQianTianFu_Mediator";
      
      private var good:Goods;
      
      private var dangqianye:int;
      
      private var tianfu:XiangQianTianFuPanel;
      
      private var _senderProxy:TianFu_MsgSenderProxy;
      
      public function XiangQianTianFu_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : TianFu_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(TianFu_MsgSenderProxy.NAME) as TianFu_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get xqTianFuPanel() : XiangQianTianFuPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xqTianFuPanel);
         }
         return viewComponent as XiangQianTianFuPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [TianFu_ApplicationFacade.SHOW_TIANFU_XIANGQIAN];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:int = 0;
         switch(param1.getName())
         {
            case TianFu_ApplicationFacade.SHOW_TIANFU_XIANGQIAN:
               _loc2_ = param1.getBody() as int;
               if(this.xqTianFuPanel)
               {
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.xqTianFuPanel);
                  GameInstance.uiInstance.xqTianFuPanel.visible = true;
                  GameInstance.uiInstance.xqTianFuPanel.x = (GameConfig.sceneWidth - GameInstance.uiInstance.xqTianFuPanel.width) / 2;
                  GameInstance.uiInstance.xqTianFuPanel.y = (GameConfig.sceneHeight - GameInstance.uiInstance.xqTianFuPanel.height) / 2;
               }
               if(_loc2_ == -1)
               {
                  this.openBackpack();
                  this.senderProxy.send_58301([-1,1]);
               }
               else
               {
                  this.senderProxy.send_58301([_loc2_,1]);
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(XiangQianTianFuPanel,function():void
         {
            xqTianFuPanel.addEventListener(XiangQianTianFuPanel.UI_TIANFU_XIANGQIAN_PANEL_DRAG_ENTER,handler);
            xqTianFuPanel.addEventListener(XiangQianTianFuPanel.UI_YIWANGTIANFU,handler);
            xqTianFuPanel.addEventListener(XiangQianTianFuPanel.UI_HUANXINGTIANFU,handler);
            xqTianFuPanel.addEventListener(XiangQianTianFuPanel.UI_NEXT_PAGE,handler);
            xqTianFuPanel.addEventListener(XiangQianTianFuPanel.UI_PRE_PAGE,handler);
            xqTianFuPanel.addEventListener(XiangQianTianFuPanel.UI_HUANXINGTIANFU_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(XiangQianTianFuPanel,function():void
         {
            xqTianFuPanel.removeEventListener(XiangQianTianFuPanel.UI_TIANFU_XIANGQIAN_PANEL_DRAG_ENTER,handler);
            xqTianFuPanel.removeEventListener(XiangQianTianFuPanel.UI_YIWANGTIANFU,handler);
            xqTianFuPanel.removeEventListener(XiangQianTianFuPanel.UI_HUANXINGTIANFU,handler);
            xqTianFuPanel.removeEventListener(XiangQianTianFuPanel.UI_NEXT_PAGE,handler);
            xqTianFuPanel.removeEventListener(XiangQianTianFuPanel.UI_PRE_PAGE,handler);
            xqTianFuPanel.removeEventListener(XiangQianTianFuPanel.UI_HUANXINGTIANFU_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var o:Object = null;
         var msg:String = null;
         var ar:Array = null;
         var page:int = 0;
         var playid:int = 0;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case XiangQianTianFuPanel.UI_TIANFU_XIANGQIAN_PANEL_DRAG_ENTER:
               o = evt.data as Object;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  this.good = TCursorManager.currentItemFace.getBaseItem() as Goods;
                  this._senderProxy.send_58307([this.good.id,this.good.position,this.dangqianye,o.l,o.g]);
                  break;
               }
               return;
               break;
            case XiangQianTianFuPanel.UI_YIWANGTIANFU:
               o = evt.data as Object;
               msg = "";
               msg += "<font algin=\'center\'>" + LanResManager.getLanCommonTextWords("你确定要遗忘该天赋吗？") + "</font>\n\n";
               msg += "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("注：遗忘后天赋将彻底消失！") + "</font>";
               FAlert.okLabel = LanResManager.getLanCommonTextWords("确定");
               FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
               FAlert.show(msg,"",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     _senderProxy.send_58303([dangqianye,o.l,o.g]);
                  }
               });
               break;
            case XiangQianTianFuPanel.UI_HUANXINGTIANFU_CLICK:
               o = evt.data as Object;
               this._senderProxy.send_58305([o.jc,this.dangqianye,o.l,o.g]);
               break;
            case XiangQianTianFuPanel.UI_NEXT_PAGE:
               ar = evt.data as Array;
               page = ar[0] as int;
               if(ar[1] == 0)
               {
                  this._senderProxy.send_58301([-1,page + 1]);
               }
               else
               {
                  playid = GameInstance.lookPlayerID;
                  this._senderProxy.send_58301([playid,page + 1]);
               }
               break;
            case XiangQianTianFuPanel.UI_PRE_PAGE:
               ar = evt.data as Array;
               page = ar[0] as int;
               if(ar[1] == 0)
               {
                  this._senderProxy.send_58301([-1,page - 1]);
               }
               else
               {
                  this._senderProxy.send_58301([GameInstance.lookPlayerID,page - 1]);
               }
         }
      }
      
      public function ywTianFuRe(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.xqTianFuPanel.ywRe(param1,param2,param3,param4);
      }
      
      public function hxTianFuRe(param1:int, param2:int, param3:int, param4:int, param5:String) : void
      {
         this.xqTianFuPanel.hxRe(param1,param2,param3,param4,param5);
      }
      
      public function xqTianFuRe(param1:int, param2:int, param3:int, param4:int, param5:Object) : void
      {
         this.xqTianFuPanel.xqRe(param1,param2,param3,param4,param5);
      }
      
      private function openBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.xqTianFuPanel,GameInstance.uiInstance.backpack);
      }
      
      public function setData(param1:Array, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.dangqianye = param2;
         this.xqTianFuPanel.setData(param1,param2,param3,param4,param5);
      }
   }
}

