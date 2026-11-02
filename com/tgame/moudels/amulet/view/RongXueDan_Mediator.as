package com.tgame.moudels.amulet.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.TSoundManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.amulet.Amulet_ApplicationFacade;
   import com.tgame.moudels.amulet.model.Amult_MsgSenderProxy;
   import com.tgame.shell.view.components.RongXunDanPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.geom.Rectangle;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class RongXueDan_Mediator extends Mediator
   {
      
      public static const NAME:String = "RongXueDan_Mediator";
      
      private var sheLiZi:Goods;
      
      private var index:int;
      
      private var _sendMsg:Amult_MsgSenderProxy;
      
      public function RongXueDan_Mediator()
      {
         super(NAME);
      }
      
      protected function get panel() : RongXunDanPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.rongXueDanPanel);
            viewComponent.x = GameConfig.sceneWidth / 2 - viewComponent.width / 2;
            viewComponent.y = GameConfig.sceneHeight / 2 - viewComponent.height / 2;
         }
         return viewComponent as RongXunDanPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Amulet_ApplicationFacade.SHOW_RONGXUEDAN_PLANE,Amulet_ApplicationFacade.ITEM_SWAP_OR_MOVE];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Number = NaN;
         var _loc4_:DisplayObject = null;
         var _loc5_:Rectangle = null;
         var _loc6_:Rectangle = null;
         var _loc7_:Rectangle = null;
         var _loc8_:int = 0;
         switch(param1.getName())
         {
            case Amulet_ApplicationFacade.SHOW_RONGXUEDAN_PLANE:
               if(!Fun.isVisible(this.panel))
               {
                  GameInstance.uiInstance.uiContainer.addChild(this.panel);
                  this.panel.visible = true;
                  _loc3_ = 50;
                  _loc4_ = viewComponent as DisplayObject;
                  _loc5_ = new Rectangle(0,0,GameConfig.sceneWidth,GameConfig.sceneHeight);
                  _loc6_ = _loc4_.getBounds(GameInstance.stage);
                  _loc7_ = _loc5_.intersection(_loc6_);
                  if(_loc7_.width < _loc3_ || _loc7_.height < _loc3_)
                  {
                     _loc4_.x = GameConfig.sceneWidth / 2 - _loc4_.width / 2;
                     _loc4_.y = GameConfig.sceneHeight / 2 - _loc4_.height / 2;
                  }
                  TSoundManager.playShortSound(ResPathManager.SOUND_UI_OPEN);
                  TSoundManager.addPanelCloseSound(_loc4_);
               }
               else
               {
                  if(this.panel.parent)
                  {
                     this.replay();
                     this.panel.parent.removeChild(this.panel);
                  }
                  this.panel.visible = false;
               }
               break;
            case Amulet_ApplicationFacade.ITEM_SWAP_OR_MOVE:
               if(this.index == 0)
               {
                  return;
               }
               _loc2_ = param1.getBody() as Array;
               _loc8_ = 0;
               while(_loc8_ < _loc2_.length)
               {
                  if(_loc2_[_loc8_] == this.sheLiZi.position && Fun.isVisible(this.panel))
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_RONGXUEDAN_PLANE);
                     return;
                  }
                  _loc8_++;
               }
         }
      }
      
      public function upDataComplete(param1:int) : void
      {
         if(Fun.isVisible(this.panel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_RONGXUEDAN_PLANE);
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(RongXunDanPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,mainCharEquipPuddingHandle);
            panel.addEventListener(RongXunDanPanel.UI_RONGXUEDAN_OPTION_PANEL_DRAG_ENTER,mainCharEquipPuddingHandle);
            panel.addEventListener(RongXunDanPanel.UI_RONGXUEDAN_OPTION_PANEL_STONE_CLICK,mainCharEquipPuddingHandle);
            panel.addEventListener(RongXunDanPanel.UI_RONGXUEDAN_START,mainCharEquipPuddingHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(RongXunDanPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,mainCharEquipPuddingHandle);
            panel.removeEventListener(RongXunDanPanel.UI_RONGXUEDAN_OPTION_PANEL_DRAG_ENTER,mainCharEquipPuddingHandle);
            panel.removeEventListener(RongXunDanPanel.UI_RONGXUEDAN_OPTION_PANEL_STONE_CLICK,mainCharEquipPuddingHandle);
            panel.removeEventListener(RongXunDanPanel.UI_RONGXUEDAN_START,mainCharEquipPuddingHandle);
         });
      }
      
      private function mainCharEquipPuddingHandle(param1:Event = null) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         var _loc3_:Object = {};
         switch(param1.type)
         {
            case RongXunDanPanel.UI_RONGXUEDAN_OPTION_PANEL_DRAG_ENTER:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  this.sheLiZi = TCursorManager.currentItemFace.getBaseItem() as Goods;
                  this.index = this.sheLiZi.position;
                  if(!SpecialGoodsID.isSheLiZi(this.sheLiZi.id))
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该物品不是舍利子"),false);
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该物品不是舍利子"),false);
                     return;
                  }
                  if(this.sheLiZi.id != 10010)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该物品不是10品舍利子"),false);
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该物品不是10品舍利子"),false);
                     return;
                  }
                  this.panel.setITem(this.sheLiZi);
                  break;
               }
               return;
               break;
            case RongXunDanPanel.UI_RONGXUEDAN_OPTION_PANEL_STONE_CLICK:
               this.replay();
               break;
            case RongXunDanPanel.UI_RONGXUEDAN_START:
               if(!this.sheLiZi)
               {
                  return;
               }
               this.sendMsg.send_50181({"XY":this.sheLiZi.position});
         }
      }
      
      private function replay(param1:Event = null) : void
      {
         this.panel.setITem();
         this.index = 0;
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

