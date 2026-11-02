package com.tgame.moudels.tianMenZhen.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.tianMenZhen.TianMenZhen_ApplicationFacade;
   import com.tgame.moudels.tianMenZhen.model.TianMenZhen_MsgSenderProxy;
   import com.tgame.shell.view.components.TianMenBuZhenPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class BuZhen_Mediator extends Mediator
   {
      
      public static var zhenType:int;
      
      public static const NAME:String = "BuZhen_Mediator";
      
      private var page:int;
      
      private var _senderProxy:TianMenZhen_MsgSenderProxy;
      
      private var leftArr:Array;
      
      private var rightArr:Array;
      
      public function BuZhen_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : TianMenZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(TianMenZhen_MsgSenderProxy.NAME) as TianMenZhen_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get panel() : TianMenBuZhenPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.buZhenPanel);
         }
         return viewComponent as TianMenBuZhenPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [TianMenZhen_ApplicationFacade.SHOW_BUZHEN_PANEL,TianMenZhen_ApplicationFacade.ZHENFA_BAOFA_BTN];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case TianMenZhen_ApplicationFacade.SHOW_BUZHEN_PANEL:
               zhenType = _loc2_ as int;
               this.senderProxy.send_70107(_loc2_ as int);
               break;
            case TianMenZhen_ApplicationFacade.ZHENFA_BAOFA_BTN:
               this.senderProxy.send_70121(_loc2_ as Array);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TianMenBuZhenPanel,function():void
         {
            panel.addEventListener(TianMenBuZhenPanel.UI_TIANMENBUZHEN_OK_CLICK,handler);
            panel.addEventListener(TianMenBuZhenPanel.UI_TIANMENBUZHEN_CHONGXIN_CLICK,handler);
            panel.addEventListener(TianMenBuZhenPanel.UI_TIANMENBUZHEN_SHIYONGSKILL_DRAGDOWN,handler);
            panel.addEventListener(TianMenBuZhenPanel.UI_TIANMENBUZHEN_SHIYONGSKILL_DRAGUP,handler);
            panel.addEventListener(TianMenBuZhenPanel.UI_TIANMENBUZHEN_ZISHENSKILL_DRAG,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TianMenBuZhenPanel,function():void
         {
            panel.removeEventListener(TianMenBuZhenPanel.UI_TIANMENBUZHEN_OK_CLICK,handler);
            panel.removeEventListener(TianMenBuZhenPanel.UI_TIANMENBUZHEN_CHONGXIN_CLICK,handler);
            panel.removeEventListener(TianMenBuZhenPanel.UI_TIANMENBUZHEN_SHIYONGSKILL_DRAGDOWN,handler);
            panel.removeEventListener(TianMenBuZhenPanel.UI_TIANMENBUZHEN_SHIYONGSKILL_DRAGUP,handler);
            panel.removeEventListener(TianMenBuZhenPanel.UI_TIANMENBUZHEN_ZISHENSKILL_DRAG,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:ItemFace = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:Object = null;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case TianMenBuZhenPanel.UI_TIANMENBUZHEN_OK_CLICK:
               this.senderProxy.send_70109(zhenType);
               break;
            case TianMenBuZhenPanel.UI_TIANMENBUZHEN_CHONGXIN_CLICK:
               this.senderProxy.send_70111(zhenType);
               break;
            case TianMenBuZhenPanel.UI_TIANMENBUZHEN_ZISHENSKILL_DRAG:
               _loc3_ = _loc2_.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = _loc3_;
                  TCursorManager.showItem(_loc3_.itemBD);
                  TCursorManager.source = 6;
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
               break;
            case TianMenBuZhenPanel.UI_TIANMENBUZHEN_SHIYONGSKILL_DRAGDOWN:
               _loc3_ = _loc2_.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = _loc3_;
                  TCursorManager.showItem(_loc3_.itemBD);
                  TCursorManager.source = 7;
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
               break;
            case TianMenBuZhenPanel.UI_TIANMENBUZHEN_SHIYONGSKILL_DRAGUP:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  if(TCursorManager.source != 6 && TCursorManager.source != 7)
                  {
                     return;
                  }
                  if(TCursorManager.currentItemFace == null || TCursorManager.currentItemFace.getBaseItem() == null)
                  {
                     return;
                  }
                  _loc4_ = _loc2_.data as Array;
                  _loc3_ = _loc4_[0].target as ItemFace;
                  _loc5_ = _loc4_[1] as int;
                  _loc6_ = 0;
                  if(_loc3_ == null)
                  {
                     this.senderProxy.send_70113([zhenType,TCursorManager.currentItemFace.getBaseItem().id,TCursorManager.currentItemFace.getBaseItem().position,0,_loc5_ + 1000]);
                  }
                  else
                  {
                     this.senderProxy.send_70113([zhenType,TCursorManager.currentItemFace.getBaseItem().id,TCursorManager.currentItemFace.getBaseItem().position,_loc3_.getBaseItem().id,_loc5_ + 1000]);
                  }
               }
         }
      }
      
      public function setPanel(param1:int, param2:Array, param3:Array) : void
      {
         var _loc5_:Object = null;
         if(!Fun.isVisible(this.panel))
         {
            this.panel.x = (GameConfig.sceneWidth - this.panel.width) / 2;
            this.panel.y = (GameConfig.sceneHeight - this.panel.height) / 2;
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
         }
         if(param1 != zhenType)
         {
         }
         var _loc4_:Array = [];
         for each(_loc5_ in param2)
         {
            _loc4_.push(new Goods(_loc5_.id,_loc5_.index));
         }
         this.panel.setInitialize(zhenType,_loc4_,param3);
      }
   }
}

