package com.tgame.moudels.zhenqiDoll.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.fight.model.Fight_proxy;
   import com.tgame.moudels.zhenqiDoll.ZhenqiDoll_ApplicationFacade;
   import com.tgame.moudels.zhenqiDoll.model.ZhenqiDoll_MsgSenderProxy;
   import com.tgame.shell.view.components.ZhenQiBabyPanel;
   import com.tgame.shell.view.components.ZhenQiBabyPanelTwoPanel;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ZhenqiDoll_SuperMediator extends Mediator
   {
      
      public static const NAME:String = "ZhenqiDoll_SuperMediator";
      
      private var _fightProxy:Fight_proxy;
      
      private var _senderProxy:ZhenqiDoll_MsgSenderProxy;
      
      private var _fullDoll:Goods;
      
      public function ZhenqiDoll_SuperMediator()
      {
         super(NAME);
      }
      
      public function get senderProxy() : ZhenqiDoll_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(ZhenqiDoll_MsgSenderProxy.NAME) as ZhenqiDoll_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get zhenqiDollPanel() : ZhenQiBabyPanelTwoPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.zhenqiSuperPanel);
         }
         return viewComponent as ZhenQiBabyPanelTwoPanel;
      }
      
      override public function onRegister() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ZhenQiBabyPanelTwoPanel,function():void
         {
            zhenqiDollPanel.addEventListener(Event.ADDED_TO_STAGE,handle);
            zhenqiDollPanel.addEventListener(Event.REMOVED_FROM_STAGE,handle);
            zhenqiDollPanel.addEventListener(ZhenQiBabyPanelTwoPanel.UI_ZHENQIBABYPANEL_TWO_PUT_BABY_EMPTYCANVAS,handle);
            zhenqiDollPanel.addEventListener(ZhenQiBabyPanelTwoPanel.UI_ZHENQIBABYPANEL_TWO_SATR_GET,handle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ZhenQiBabyPanel,function():void
         {
            zhenqiDollPanel.removeEventListener(Event.ADDED_TO_STAGE,handle);
            zhenqiDollPanel.removeEventListener(Event.REMOVED_FROM_STAGE,handle);
            zhenqiDollPanel.removeEventListener(ZhenQiBabyPanelTwoPanel.UI_ZHENQIBABYPANEL_TWO_PUT_BABY_EMPTYCANVAS,handle);
            zhenqiDollPanel.removeEventListener(ZhenQiBabyPanelTwoPanel.UI_ZHENQIBABYPANEL_TWO_SATR_GET,handle);
         });
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ZhenqiDoll_ApplicationFacade.SHOW_GOODS_PANEL,ZhenqiDoll_ApplicationFacade.SELECT_DOLL_SUPER];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:Goods = null;
         var _loc6_:Goods = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case ZhenqiDoll_ApplicationFacade.SHOW_GOODS_PANEL:
               _loc5_ = _loc2_ as Goods;
               if(_loc5_.id != SpecialGoodsID.GUSHI_SUPER)
               {
                  return;
               }
               if(!Fun.isVisible(this.zhenqiDollPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_ZHENQI_DOLL_SUPER_PANEL);
               }
               ResizeManager.showDoublePanel(this.zhenqiDollPanel,GameInstance.uiInstance.backpack);
               break;
            case ZhenqiDoll_ApplicationFacade.SELECT_DOLL_SUPER:
               _loc3_ = _loc2_ as Array;
               _loc5_ = (_loc3_[1] as ItemFace).getBaseItem() as Goods;
               if((Boolean(_loc5_)) && _loc5_.id == SpecialGoodsID.DOLL_FULL)
               {
                  this._fullDoll = _loc5_;
                  _loc4_ = GameInstance.mainCharData.goodsInfo.getGoodsArrByID(SpecialGoodsID.GUSHI_SUPER,true);
                  _loc6_ = new Goods(SpecialGoodsID.GUSHI_SUPER);
                  if(_loc4_.length > 0)
                  {
                     _loc6_.count = 1;
                  }
                  else
                  {
                     _loc6_.count = 0;
                  }
                  this.zhenqiDollPanel.setJingHun(_loc6_);
                  this.zhenqiDollPanel.setBaby(_loc5_);
                  TCursorManager.resumFullMouse();
               }
               else
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("该道具不能被放入"));
               }
         }
      }
      
      private function handle(param1:*) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Goods = null;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               this.zhenqiDollPanel.setZhenqi(GameInstance.mainCharData.attributeInfo.gqNow);
               this.zhenqiDollPanel.setStartBtnEnabled_EmptyCanvs(true);
               this.zhenqiDollPanel.setBaby(null);
               this.zhenqiDollPanel.setJingHun(null);
               break;
            case ZhenQiBabyPanelTwoPanel.UI_ZHENQIBABYPANEL_TWO_PUT_BABY_EMPTYCANVAS:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.resumFullMouse();
                  TCursorManager.showCursor(TCursorManager.CURSOR_DOLL_SUPER_FULL);
                  TCursorManager.lockOnMouseStatus();
               }
               else
               {
                  TCursorManager.resumFullMouse();
               }
               break;
            case ZhenQiBabyPanelTwoPanel.UI_ZHENQIBABYPANEL_TWO_SATR_GET:
               if(this._fullDoll == null)
               {
                  return;
               }
               this.senderProxy.send_51401(this._fullDoll.position);
               if(Fun.isVisible(this.zhenqiDollPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_ZHENQI_DOLL_SUPER_PANEL);
               }
         }
      }
   }
}

