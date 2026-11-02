package com.tgame.moudels.amulet.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.amulet.Amulet_ApplicationFacade;
   import com.tgame.moudels.amulet.model.Amult_MsgReceivedProxy;
   import com.tgame.moudels.amulet.model.Amult_MsgSenderProxy;
   import com.tgame.shell.view.components.SheliziEnchasePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class AmultAddSheLiZi_Mediator extends Mediator
   {
      
      public static const NAME:String = "AmultAddSheLiZi_Mediator";
      
      private var isPanelUse:Boolean = false;
      
      private var huShenFu:Goods;
      
      private var sheLiZi:Goods;
      
      private var _sendMsg:Amult_MsgSenderProxy;
      
      public function AmultAddSheLiZi_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get sheLiZiPanel() : SheliziEnchasePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.sheliziEnchasePanel);
         }
         return viewComponent as SheliziEnchasePanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Amulet_ApplicationFacade.SHOW_AMULT_ADD_SHELIZI,Amulet_ApplicationFacade.ITEM_SWAP_OR_MOVE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Amulet_ApplicationFacade.SHOW_AMULT_ADD_SHELIZI:
               this.openBackpack();
               PipeManager.sendMsg(PipeConstants.USE_BAG,0);
               this.huShenFu = _loc2_ as Goods;
               this.send52101(this.huShenFu);
               break;
            case Amulet_ApplicationFacade.ITEM_SWAP_OR_MOVE:
               if(!this.huShenFu)
               {
                  return;
               }
               _loc3_ = _loc2_ as Array;
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  if(_loc3_[_loc4_] == this.huShenFu.position)
                  {
                     PipeManager.sendMsg(PipeConstants.CLOSE_AMULT_ADD_SHELIZI);
                     return;
                  }
                  _loc4_++;
               }
         }
      }
      
      public function upDataComplete(param1:int, param2:String) : void
      {
         if(param1 == 0)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_EQUIP_STRONG_FA);
         }
         if(param1 == 1)
         {
            TSoundManager.playShortSound(ResPathManager.SOUND_UI_HECHENG_SU);
         }
         if(!Fun.isVisible(this.sheLiZiPanel))
         {
            return;
         }
         this.send52101(this.huShenFu);
      }
      
      public function setGL(param1:Object) : void
      {
         this.sheLiZiPanel.setInitialize(param1.max);
         this.sheLiZiPanel.setGoodsInitialize(this.huShenFu);
         this.sheLiZiPanel.setItem(param1.idArr);
         this.isPanelUse = true;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(SheliziEnchasePanel,function():void
         {
            sheLiZiPanel.addEventListener(SheliziEnchasePanel.UI_STONE_OPTION_PANEL_DRAG_ENTER,easyStonePanelHandle);
            sheLiZiPanel.addEventListener(SheliziEnchasePanel.UI_STONE_OPTION_PANEL_DRAG_START,easyStonePanelHandle);
            sheLiZiPanel.addEventListener(SheliziEnchasePanel.UI_STONE_OPTION_PANEL_STONE_CLICK,easyStonePanelHandle);
            sheLiZiPanel.addEventListener(Event.REMOVED_FROM_STAGE,easyStonePanelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(SheliziEnchasePanel,function():void
         {
            sheLiZiPanel.removeEventListener(SheliziEnchasePanel.UI_STONE_OPTION_PANEL_DRAG_ENTER,easyStonePanelHandle);
            sheLiZiPanel.removeEventListener(SheliziEnchasePanel.UI_STONE_OPTION_PANEL_DRAG_START,easyStonePanelHandle);
            sheLiZiPanel.removeEventListener(SheliziEnchasePanel.UI_STONE_OPTION_PANEL_STONE_CLICK,easyStonePanelHandle);
            sheLiZiPanel.removeEventListener(Event.REMOVED_FROM_STAGE,easyStonePanelClose);
         });
      }
      
      private function easyStonePanelClose(param1:* = null) : void
      {
         this.huShenFu = null;
         PipeManager.sendMsg(PipeConstants.USE_BAG,1);
         ResizeManager.hideDoublePanel();
      }
      
      private function easyStonePanelHandle(param1:Event) : void
      {
         var baseE:BaseEvent = null;
         var removeID:int = 0;
         var e:Event = param1;
         baseE = e as BaseEvent;
         var data:Object = {};
         switch(e.type)
         {
            case Event.ADDED_TO_STAGE:
               this.openBackpack();
               break;
            case SheliziEnchasePanel.UI_STONE_OPTION_PANEL_STONE_CLICK:
               if(!this.isPanelUse)
               {
                  return;
               }
               removeID = baseE.data as int;
               this.send52105(this.huShenFu,removeID);
               this.isPanelUse = true;
               break;
            case SheliziEnchasePanel.UI_STONE_OPTION_PANEL_DRAG_ENTER:
               if(!this.isPanelUse)
               {
                  return;
               }
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  this.sheLiZi = TCursorManager.currentItemFace.getBaseItem() as Goods;
                  if(!SpecialGoodsID.isSheLiZi(this.sheLiZi.id))
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该物品不是舍利子"),false);
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该物品不是舍利子"),false);
                     return;
                  }
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("镶嵌");
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                  FAlert.show(LanResManager.getLanTextWords(this,"镶嵌绑定提示",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]),"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        send52103(huShenFu,sheLiZi);
                     }
                  });
                  break;
               }
               return;
         }
      }
      
      private function send52105(param1:Goods, param2:int) : void
      {
         var _loc3_:Object = {};
         _loc3_.xy = param1.position;
         _loc3_.id = param1.id;
         _loc3_.sid = param2;
         this.sendMsg.send_52105(_loc3_);
      }
      
      private function send52103(param1:Goods, param2:Goods) : void
      {
         var _loc3_:Object = {};
         _loc3_.xy = param1.position;
         _loc3_.id = param1.id;
         _loc3_.sxy = param2.position;
         _loc3_.sid = param2.id;
         this.sendMsg.send_52103(_loc3_);
      }
      
      private function send52101(param1:Goods) : void
      {
         this.isPanelUse = false;
         Amult_MsgReceivedProxy.huShenFuIndex = param1.position;
         var _loc2_:Object = {};
         _loc2_.xy = param1.position;
         _loc2_.id = param1.id;
         this.sendMsg.send_52101(_loc2_);
      }
      
      private function changeMouseStatus() : void
      {
         TCursorManager.showCursor(TCursorManager.CURSOR_SHOUXING,true);
         TCursorManager.seleteItemOnOtherPanel();
         TCursorManager.lockOnMouseStatus();
      }
      
      private function resumMouseStatus() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = null;
            TCursorManager.removeLockOnMouseStatus();
            TCursorManager.resumMouse();
         }
      }
      
      private function mouseToNormal() : void
      {
         if(TCursorManager.getCurruntStatus() == TCursorManager.SELETE_ITEM_ON_OTHER_PANEL || TCursorManager.getLockOnMouseStatus())
         {
            TCursorManager.chickItemToPanelFun = function a(param1:*):void
            {
            };
            TCursorManager.mouseToNormal();
         }
      }
      
      private function openBackpack() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
         }
         ResizeManager.showDoublePanel(this.sheLiZiPanel,GameInstance.uiInstance.backpack);
      }
      
      private function get sendMsg() : Amult_MsgSenderProxy
      {
         if(this._sendMsg == null)
         {
            this._sendMsg = facade.retrieveProxy(Amult_MsgSenderProxy.NAME) as Amult_MsgSenderProxy;
         }
         return this._sendMsg;
      }
   }
}

