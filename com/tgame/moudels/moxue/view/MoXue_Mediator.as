package com.tgame.moudels.moxue.view
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
   import com.tgame.moudels.moxue.MoXue_ApplicationFacade;
   import com.tgame.moudels.moxue.model.MoXue_MsgSenderProxy;
   import com.tgame.shell.view.components.MoXueBabyPanel;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class MoXue_Mediator extends Mediator
   {
      
      public static const NAME:String = "MoXue_Mediator";
      
      private var _senderProxy:MoXue_MsgSenderProxy;
      
      private var _fullDoll:Goods;
      
      private var goodID:int;
      
      private var arr:Array;
      
      private var arr1:Array;
      
      private var good:Goods;
      
      private var gushiGood:Goods;
      
      public function MoXue_Mediator()
      {
         super(NAME);
      }
      
      public function get senderProxy() : MoXue_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(MoXue_MsgSenderProxy.NAME) as MoXue_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get moxueDollPanel() : MoXueBabyPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.moxueDollPanel);
         }
         return viewComponent as MoXueBabyPanel;
      }
      
      override public function onRegister() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(MoXueBabyPanel,function():void
         {
            moxueDollPanel.addEventListener(Event.ADDED_TO_STAGE,handle);
            moxueDollPanel.addEventListener(Event.REMOVED_FROM_STAGE,handle);
            moxueDollPanel.addEventListener(MoXueBabyPanel.UI_MOXUEBABYPANEL_PUT_BABY_EMPTYCANVAS,handle);
            moxueDollPanel.addEventListener(MoXueBabyPanel.UI_MOXUEBABYPANEL_PUT_BABY_FULLCANVAS,handle);
            moxueDollPanel.addEventListener(MoXueBabyPanel.UI_MOXUEBABYPANEL_SATR_FULL,handle);
            moxueDollPanel.addEventListener(MoXueBabyPanel.UI_MOXUEBABYPANEL_SATR_GET,handle);
            moxueDollPanel.addEventListener(MoXueBabyPanel.UI_MOXUEBABYPANEL_SHOW_EMPTYCANVAS,handle);
            moxueDollPanel.addEventListener(MoXueBabyPanel.UI_MOXUEBABYPANEL_SHOW_FULLCANVAS,handle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MoXueBabyPanel,function():void
         {
            moxueDollPanel.removeEventListener(Event.ADDED_TO_STAGE,handle);
            moxueDollPanel.removeEventListener(Event.REMOVED_FROM_STAGE,handle);
            moxueDollPanel.removeEventListener(MoXueBabyPanel.UI_MOXUEBABYPANEL_PUT_BABY_EMPTYCANVAS,handle);
            moxueDollPanel.removeEventListener(MoXueBabyPanel.UI_MOXUEBABYPANEL_PUT_BABY_FULLCANVAS,handle);
            moxueDollPanel.removeEventListener(MoXueBabyPanel.UI_MOXUEBABYPANEL_SATR_FULL,handle);
            moxueDollPanel.removeEventListener(MoXueBabyPanel.UI_MOXUEBABYPANEL_SATR_GET,handle);
            moxueDollPanel.removeEventListener(MoXueBabyPanel.UI_MOXUEBABYPANEL_SHOW_EMPTYCANVAS,handle);
            moxueDollPanel.removeEventListener(MoXueBabyPanel.UI_MOXUEBABYPANEL_SHOW_FULLCANVAS,handle);
         });
      }
      
      override public function listNotificationInterests() : Array
      {
         return [MoXue_ApplicationFacade.SHOW_GOODS_PANEL,MoXue_ApplicationFacade.SELECT_DOLL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case MoXue_ApplicationFacade.SHOW_GOODS_PANEL:
               this.good = _loc2_ as Goods;
               _loc3_ = 0;
               if(this.good)
               {
                  this.goodID = this.good.id;
                  if(this.goodID != SpecialGoodsID.MOXUEDOLL_EMPTY && this.goodID != SpecialGoodsID.MOXUEDOLL_FULL)
                  {
                     return;
                  }
                  _loc3_ = this.good.position;
               }
               else
               {
                  _loc3_ = -1;
               }
               this.senderProxy.send_59771(_loc3_);
               break;
            case MoXue_ApplicationFacade.SELECT_DOLL:
               this.arr = _loc2_ as Array;
               if(this.arr[0] == 0)
               {
                  this.good = (this.arr[1] as ItemFace).getBaseItem() as Goods;
                  if(Boolean(this.good) && this.good.id == SpecialGoodsID.MOXUEDOLL_EMPTY)
                  {
                     this.moxueDollPanel.setItem_FullCanvas(this.good,new Goods(SpecialGoodsID.MOXUEDOLL_FULL));
                     this.moxueDollPanel.setStartBtnEnabled_FullCanvs(true);
                  }
                  else
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该道具不能被放入"),false);
                  }
               }
               else if(this.arr[0] == 1)
               {
                  this.good = (this.arr[1] as ItemFace).getBaseItem() as Goods;
                  if(Boolean(this.good) && this.good.id == SpecialGoodsID.MOXUEDOLL_FULL)
                  {
                     this._fullDoll = this.good;
                     this.arr1 = GameInstance.mainCharData.goodsInfo.getGoodsArrByID(SpecialGoodsID.XUEYIN,true);
                     this.gushiGood = new Goods(SpecialGoodsID.XUEYIN);
                     if(this.arr1.length > 0)
                     {
                        this.gushiGood.count = 1;
                        this.moxueDollPanel.setItem_EmptyCanvas(this.good,this.gushiGood);
                     }
                     else
                     {
                        this.gushiGood.count = 0;
                        this.moxueDollPanel.setItem_EmptyCanvas(this.good,this.gushiGood);
                     }
                     this.moxueDollPanel.showEmptyCanvas(true);
                     this.moxueDollPanel.setStartBtnEnabled_EmptyCanvs(true);
                  }
                  else
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"该道具不能被放入"),false);
                  }
               }
         }
      }
      
      public function openMoxuePanel() : void
      {
         if(!Fun.isVisible(this.moxueDollPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MOXUE_DOLL_PANEL);
         }
         if(this.goodID == SpecialGoodsID.MOXUEDOLL_EMPTY)
         {
            this.arr = GameInstance.mainCharData.goodsInfo.getGoodsArrByID(SpecialGoodsID.MOXUEDOLL_EMPTY,true);
            if(this.arr.length > 0)
            {
               this.arr1 = GameInstance.mainCharData.goodsInfo.getGoodsArrByID(SpecialGoodsID.XUEYIN,true);
               this.gushiGood = new Goods(SpecialGoodsID.MOXUEDOLL_FULL);
               this.moxueDollPanel.setItem_FullCanvas(this.arr[0],this.gushiGood);
            }
            ResizeManager.showDoublePanel(this.moxueDollPanel,GameInstance.uiInstance.backpack);
            this.moxueDollPanel.setMoxue_Guanzhu(GameInstance.mainCharData.attributeInfo.moxueNow);
            this.moxueDollPanel.showFullCanvas(true);
            this.moxueDollPanel.setStartBtnEnabled_FullCanvs(true);
            this.moxueDollPanel.setStartBtnEnabled_EmptyCanvs(false);
         }
         else if(this.goodID == SpecialGoodsID.MOXUEDOLL_FULL)
         {
            this._fullDoll = this.good;
            this.arr1 = GameInstance.mainCharData.goodsInfo.getGoodsArrByID(SpecialGoodsID.XUEYIN,true);
            this.gushiGood = new Goods(SpecialGoodsID.XUEYIN);
            if(this.arr1.length > 0)
            {
               this.gushiGood.count = this.arr1.length;
               this.moxueDollPanel.setItem_EmptyCanvas(this._fullDoll,this.gushiGood);
            }
            else
            {
               this.gushiGood.count = 0;
               this.moxueDollPanel.setItem_EmptyCanvas(this._fullDoll,this.gushiGood);
            }
            ResizeManager.showDoublePanel(this.moxueDollPanel,GameInstance.uiInstance.backpack);
            this.moxueDollPanel.setMoxue_Guanzhu(GameInstance.mainCharData.attributeInfo.moxueNow);
            this.moxueDollPanel.showEmptyCanvas(true);
            this.moxueDollPanel.setStartBtnEnabled_EmptyCanvs(true);
            this.moxueDollPanel.setStartBtnEnabled_FullCanvs(false);
         }
         else if(this.goodID == SpecialGoodsID.XUEYIN)
         {
            NoticeManager.notify(NoticeManager.FOOT,"请双击魔血娃娃使用！",false);
            return;
         }
      }
      
      private function handle(param1:*) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Goods = null;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case Event.REMOVED_FROM_STAGE:
               this.moxueDollPanel.setItem_EmptyCanvas(null,null);
               this.moxueDollPanel.setItem_FullCanvas(null,null);
               break;
            case MoXueBabyPanel.UI_MOXUEBABYPANEL_SATR_FULL:
               _loc2_ = GameInstance.mainCharData.goodsInfo.getGoodsArrByID(SpecialGoodsID.MOXUEDOLL_EMPTY,true);
               if(_loc2_.length > 0)
               {
                  _loc3_ = _loc2_[0];
                  this.senderProxy.send_59773(_loc3_.position);
                  TCursorManager.resumFullMouse();
               }
               break;
            case MoXueBabyPanel.UI_MOXUEBABYPANEL_SATR_GET:
               if(this._fullDoll)
               {
                  this.senderProxy.send_59775(this._fullDoll.position);
                  TCursorManager.resumFullMouse();
                  if(Fun.isVisible(this.moxueDollPanel))
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_MOXUE_DOLL_PANEL);
                  }
               }
               break;
            case MoXueBabyPanel.UI_MOXUEBABYPANEL_PUT_BABY_FULLCANVAS:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.backpack))
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_MOXUE_DOLL_PANEL);
                  }
                  ResizeManager.showDoublePanel(this.moxueDollPanel,GameInstance.uiInstance.backpack);
                  TCursorManager.resumFullMouse();
                  TCursorManager.showCursor(TCursorManager.CURSOR_MOXUEDOLL_EMPTY);
                  TCursorManager.lockOnMouseStatus();
               }
               else
               {
                  TCursorManager.resumFullMouse();
               }
               break;
            case MoXueBabyPanel.UI_MOXUEBABYPANEL_PUT_BABY_EMPTYCANVAS:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.backpack))
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_MOXUE_DOLL_PANEL);
                  }
                  ResizeManager.showDoublePanel(this.moxueDollPanel,GameInstance.uiInstance.backpack);
                  TCursorManager.resumFullMouse();
                  TCursorManager.showCursor(TCursorManager.CURSOR_MOXUEDOLL_FULL);
                  TCursorManager.lockOnMouseStatus();
               }
               else
               {
                  TCursorManager.resumFullMouse();
               }
               break;
            case MoXueBabyPanel.UI_MOXUEBABYPANEL_SHOW_EMPTYCANVAS:
               this.moxueDollPanel.showEmptyCanvas();
               break;
            case MoXueBabyPanel.UI_MOXUEBABYPANEL_SHOW_FULLCANVAS:
               this.moxueDollPanel.showFullCanvas();
         }
      }
      
      public function initMoxuePanel(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.moxueDollPanel.setMoxue_Guanzhu(param1);
         this.moxueDollPanel.setMoxue_Tiqu(param2,param3);
      }
      
      public function setNullTiqu() : void
      {
         this.moxueDollPanel.setItem_EmptyCanvas(null,null);
      }
      
      public function setNullGuanzhu() : void
      {
         this.moxueDollPanel.setItem_FullCanvas(null,null);
      }
   }
}

