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
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ZhenqiDoll_Mediator extends Mediator
   {
      
      public static const NAME:String = "ZhenqiDoll_Mediator";
      
      private var _fightProxy:Fight_proxy;
      
      private var _senderProxy:ZhenqiDoll_MsgSenderProxy;
      
      private var _fullDoll:Goods;
      
      public function ZhenqiDoll_Mediator()
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
      
      protected function get zhenqiDollPanel() : ZhenQiBabyPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.zhenqiDollPanel);
         }
         return viewComponent as ZhenQiBabyPanel;
      }
      
      override public function onRegister() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ZhenQiBabyPanel,function():void
         {
            zhenqiDollPanel.addEventListener(Event.ADDED_TO_STAGE,handle);
            zhenqiDollPanel.addEventListener(Event.REMOVED_FROM_STAGE,handle);
            zhenqiDollPanel.addEventListener(ZhenQiBabyPanel.UI_ZHENQIBABYPANEL_SATR_FULL,handle);
            zhenqiDollPanel.addEventListener(ZhenQiBabyPanel.UI_ZHENQIBABYPANEL_SATR_GET,handle);
            zhenqiDollPanel.addEventListener(ZhenQiBabyPanel.UI_ZHENQIBABYPANEL_SHOW_EMPTYCANVAS,handle);
            zhenqiDollPanel.addEventListener(ZhenQiBabyPanel.UI_ZHENQIBABYPANEL_SHOW_FULLCANVAS,handle);
            zhenqiDollPanel.addEventListener(ZhenQiBabyPanel.UI_ZHENQIBABYPANEL_PUT_BABY_EMPTYCANVAS,handle);
            zhenqiDollPanel.addEventListener(ZhenQiBabyPanel.UI_ZHENQIBABYPANEL_PUT_BABY_FULLCANVAS,handle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ZhenQiBabyPanel,function():void
         {
            zhenqiDollPanel.removeEventListener(Event.ADDED_TO_STAGE,handle);
            zhenqiDollPanel.removeEventListener(Event.REMOVED_FROM_STAGE,handle);
            zhenqiDollPanel.removeEventListener(ZhenQiBabyPanel.UI_ZHENQIBABYPANEL_SATR_FULL,handle);
            zhenqiDollPanel.removeEventListener(ZhenQiBabyPanel.UI_ZHENQIBABYPANEL_SATR_GET,handle);
            zhenqiDollPanel.removeEventListener(ZhenQiBabyPanel.UI_ZHENQIBABYPANEL_SHOW_EMPTYCANVAS,handle);
            zhenqiDollPanel.removeEventListener(ZhenQiBabyPanel.UI_ZHENQIBABYPANEL_SHOW_FULLCANVAS,handle);
            zhenqiDollPanel.removeEventListener(ZhenQiBabyPanel.UI_ZHENQIBABYPANEL_PUT_BABY_EMPTYCANVAS,handle);
            zhenqiDollPanel.removeEventListener(ZhenQiBabyPanel.UI_ZHENQIBABYPANEL_PUT_BABY_FULLCANVAS,handle);
         });
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ZhenqiDoll_ApplicationFacade.SHOW_GOODS_PANEL,ZhenqiDoll_ApplicationFacade.SELECT_DOLL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:Goods = null;
         var _loc6_:Goods = null;
         var _loc7_:int = 0;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case ZhenqiDoll_ApplicationFacade.SHOW_GOODS_PANEL:
               _loc5_ = _loc2_ as Goods;
               _loc7_ = _loc5_.id;
               if(_loc7_ != SpecialGoodsID.DOLL_EMPTY && _loc7_ != SpecialGoodsID.DOLL_FULL && _loc7_ != SpecialGoodsID.GUSHI)
               {
                  return;
               }
               if(!Fun.isVisible(this.zhenqiDollPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_ZHENQI_DOLL_PANEL);
               }
               this.senderProxy.send_50705();
               if(_loc7_ == SpecialGoodsID.DOLL_EMPTY)
               {
                  _loc3_ = GameInstance.mainCharData.goodsInfo.getGoodsArrByID(SpecialGoodsID.DOLL_EMPTY,true);
                  if(_loc3_.length > 0)
                  {
                     _loc4_ = GameInstance.mainCharData.goodsInfo.getGoodsArrByID(SpecialGoodsID.GUSHI,true);
                     _loc6_ = new Goods(SpecialGoodsID.DOLL_FULL);
                     this.zhenqiDollPanel.setItem_FullCanvas(_loc3_[0],_loc6_);
                  }
                  this.zhenqiDollPanel.setZhenqi(GameInstance.mainCharData.attributeInfo.gqNow);
                  this.zhenqiDollPanel.showFullCanvas(true);
                  this.zhenqiDollPanel.setStartBtnEnabled_FullCanvs(true);
               }
               else if(_loc7_ == SpecialGoodsID.DOLL_FULL)
               {
                  this._fullDoll = _loc5_;
                  _loc4_ = GameInstance.mainCharData.goodsInfo.getGoodsArrByID(SpecialGoodsID.GUSHI,true);
                  _loc6_ = new Goods(SpecialGoodsID.GUSHI);
                  if(_loc4_.length > 0)
                  {
                     _loc6_.count = 1;
                     this.zhenqiDollPanel.setItem_EmptyCanvas(this._fullDoll,_loc6_);
                  }
                  else
                  {
                     _loc6_.count = 0;
                     this.zhenqiDollPanel.setItem_EmptyCanvas(this._fullDoll,_loc6_);
                  }
                  this.zhenqiDollPanel.setZhenqi(GameInstance.mainCharData.attributeInfo.gqNow);
                  this.zhenqiDollPanel.showEmptyCanvas(true);
                  this.zhenqiDollPanel.setStartBtnEnabled_EmptyCanvs(true);
               }
               else if(_loc7_ == SpecialGoodsID.GUSHI)
               {
                  ResizeManager.showDoublePanel(this.zhenqiDollPanel,GameInstance.uiInstance.backpack);
                  this.zhenqiDollPanel.setZhenqi(GameInstance.mainCharData.attributeInfo.gqNow);
                  this.zhenqiDollPanel.setStartBtnEnabled_EmptyCanvs(true);
                  this.zhenqiDollPanel.showEmptyCanvas(true);
               }
               break;
            case ZhenqiDoll_ApplicationFacade.SELECT_DOLL:
               _loc3_ = _loc2_ as Array;
               if(_loc3_[0] == 0)
               {
                  _loc5_ = (_loc3_[1] as ItemFace).getBaseItem() as Goods;
                  if((Boolean(_loc5_)) && _loc5_.id == SpecialGoodsID.DOLL_EMPTY)
                  {
                     this.zhenqiDollPanel.setItem_FullCanvas(_loc5_,new Goods(SpecialGoodsID.DOLL_FULL));
                  }
                  else
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该道具不能被放入"),false);
                  }
               }
               else if(_loc3_[0] == 1)
               {
                  _loc5_ = (_loc3_[1] as ItemFace).getBaseItem() as Goods;
                  if((Boolean(_loc5_)) && _loc5_.id == SpecialGoodsID.DOLL_FULL)
                  {
                     this._fullDoll = _loc5_;
                     _loc4_ = GameInstance.mainCharData.goodsInfo.getGoodsArrByID(SpecialGoodsID.GUSHI,true);
                     _loc6_ = new Goods(SpecialGoodsID.GUSHI);
                     if(_loc4_.length > 0)
                     {
                        _loc6_.count = 1;
                        this.zhenqiDollPanel.setItem_EmptyCanvas(_loc5_,_loc6_);
                     }
                     else
                     {
                        _loc6_.count = 0;
                        this.zhenqiDollPanel.setItem_EmptyCanvas(_loc5_,_loc6_);
                     }
                     this.zhenqiDollPanel.showEmptyCanvas(true);
                  }
                  else
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该道具不能被放入"),false);
                  }
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
               if(GameInstance.mainCharData.attributeInfo.gqNow == 10000)
               {
                  this.zhenqiDollPanel.setStartBtnEnabled_FullCanvs(true);
               }
               break;
            case Event.REMOVED_FROM_STAGE:
               this.zhenqiDollPanel.setItem_EmptyCanvas(null,null);
               this.zhenqiDollPanel.setItem_FullCanvas(null,null);
               break;
            case ZhenQiBabyPanel.UI_ZHENQIBABYPANEL_SATR_FULL:
               _loc2_ = GameInstance.mainCharData.goodsInfo.getGoodsArrByID(SpecialGoodsID.DOLL_EMPTY,true);
               if(_loc2_.length > 0)
               {
                  _loc3_ = _loc2_[0];
                  this.senderProxy.send_50701(_loc3_.position);
               }
               break;
            case ZhenQiBabyPanel.UI_ZHENQIBABYPANEL_SATR_GET:
               if(this._fullDoll)
               {
                  this.senderProxy.send_50707(this._fullDoll.position);
                  if(Fun.isVisible(this.zhenqiDollPanel))
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_ZHENQI_DOLL_PANEL);
                  }
               }
               break;
            case ZhenQiBabyPanel.UI_ZHENQIBABYPANEL_PUT_BABY_EMPTYCANVAS:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.resumFullMouse();
                  TCursorManager.showCursor(TCursorManager.CURSOR_DOLL_FULL);
                  TCursorManager.lockOnMouseStatus();
               }
               else
               {
                  TCursorManager.resumFullMouse();
               }
               break;
            case ZhenQiBabyPanel.UI_ZHENQIBABYPANEL_PUT_BABY_FULLCANVAS:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.resumFullMouse();
                  TCursorManager.showCursor(TCursorManager.CURSOR_DOLL_EMPTY);
                  TCursorManager.lockOnMouseStatus();
               }
               else
               {
                  TCursorManager.resumFullMouse();
               }
               break;
            case ZhenQiBabyPanel.UI_ZHENQIBABYPANEL_SHOW_EMPTYCANVAS:
               this.zhenqiDollPanel.showEmptyCanvas();
               break;
            case ZhenQiBabyPanel.UI_ZHENQIBABYPANEL_SHOW_FULLCANVAS:
               this.zhenqiDollPanel.showFullCanvas();
         }
      }
      
      public function updateGuShi(param1:int, param2:int) : void
      {
         this.zhenqiDollPanel.setCount_EmptyCanvas(param1,param1,param2);
      }
   }
}

