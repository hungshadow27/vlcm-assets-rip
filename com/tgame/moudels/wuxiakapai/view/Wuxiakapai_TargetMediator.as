package com.tgame.moudels.wuxiakapai.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.wuxiakapai.model.Wuxiakapai_MsgSendProxy;
   import com.tgame.shell.view.components.WuxiakapaiPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Wuxiakapai_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "Wuxiakapai_TargetMediator";
      
      private var isAuto:Boolean = false;
      
      private var play:int = -1;
      
      private var _senderProxy:Wuxiakapai_MsgSendProxy;
      
      public function Wuxiakapai_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      private function get senderProxy() : Wuxiakapai_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Wuxiakapai_MsgSendProxy.NAME) as Wuxiakapai_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : WuxiakapaiPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.wuxiakapaiPanel);
         }
         return viewComponent as WuxiakapaiPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(WuxiakapaiPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,onHandle);
            panel.addEventListener(WuxiakapaiPanel.UI_WUXIAKAPAI_DUIHUAN_CLICK,onHandle);
            panel.addEventListener(WuxiakapaiPanel.UI_WUXIAKAPAI_LIST_CLICK,onHandle);
            panel.addEventListener(WuxiakapaiPanel.UI_WUXIAKAPAI_WAIXIAN_CLICK,onHandle);
            panel.addEventListener(WuxiakapaiPanel.UI_WUXIAKAPAI_XIANGXI_CLICK,onHandle);
            panel.addEventListener(WuxiakapaiPanel.UI_WUXIAKAPAI_YIJIANDUIHUAN_CLICK,onHandle);
            panel.addEventListener(WuxiakapaiPanel.UI_WUXIAKAPAIXIANGXI_GUANBI_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(WuxiakapaiPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,onHandle);
            panel.removeEventListener(WuxiakapaiPanel.UI_WUXIAKAPAI_DUIHUAN_CLICK,onHandle);
            panel.removeEventListener(WuxiakapaiPanel.UI_WUXIAKAPAI_LIST_CLICK,onHandle);
            panel.removeEventListener(WuxiakapaiPanel.UI_WUXIAKAPAI_WAIXIAN_CLICK,onHandle);
            panel.removeEventListener(WuxiakapaiPanel.UI_WUXIAKAPAI_XIANGXI_CLICK,onHandle);
            panel.removeEventListener(WuxiakapaiPanel.UI_WUXIAKAPAI_YIJIANDUIHUAN_CLICK,onHandle);
            panel.removeEventListener(WuxiakapaiPanel.UI_WUXIAKAPAIXIANGXI_GUANBI_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Array = null;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               this.senderProxy.send_74241(-1);
               _loc3_ = [];
               _loc7_ = 0;
               while(_loc7_ < 3)
               {
                  _loc8_ = new Object();
                  _loc8_.id = 1001 + _loc7_;
                  _loc8_.name = LanResManager.getLanCommonTextWords("卡牌名称") + _loc7_;
                  _loc3_.push(_loc8_);
                  _loc7_++;
               }
               break;
            case WuxiakapaiPanel.UI_WUXIAKAPAI_DUIHUAN_CLICK:
               this.senderProxy.send_74249(param1.data);
               break;
            case WuxiakapaiPanel.UI_WUXIAKAPAI_LIST_CLICK:
               _loc4_ = -1;
               _loc5_ = 4;
               _loc6_ = [];
               _loc7_ = 0;
               while(_loc7_ < _loc5_)
               {
                  _loc8_ = new Object();
                  _loc8_.id = _loc7_ + 1;
                  _loc8_.name = LanResManager.getLanCommonTextWords("名稱") + _loc7_;
                  _loc8_.state = _loc7_ % 2;
                  _loc8_.imgID = 1001;
                  _loc8_.lv = 2;
                  _loc6_.push(_loc8_);
                  _loc7_++;
               }
               this.senderProxy.send_74243([param1.data,-1]);
               break;
            case WuxiakapaiPanel.UI_WUXIAKAPAI_WAIXIAN_CLICK:
               this.senderProxy.send_74251(param1.data);
               break;
            case WuxiakapaiPanel.UI_WUXIAKAPAI_XIANGXI_CLICK:
               this.panel.onShowLv(true);
               this.senderProxy.send_74245([param1.data,-1]);
               break;
            case WuxiakapaiPanel.UI_WUXIAKAPAI_YIJIANDUIHUAN_CLICK:
               this.senderProxy.send_74247();
               break;
            case WuxiakapaiPanel.UI_WUXIAKAPAIXIANGXI_GUANBI_CLICK:
               this.panel.onShowLv(false);
         }
      }
   }
}

