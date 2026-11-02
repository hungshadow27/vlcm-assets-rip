package com.tgame.moudels.biguan.view
{
   import com.fireice.alert.FAlert;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.biguan.model.Biguan_MsgSenderProxy;
   import com.tgame.shell.view.components.BiGuangPanel;
   import flash.events.Event;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Biguan_BiguanMediator extends Mediator
   {
      
      public static const NAME:String = "Biguan_BiguanMediator";
      
      public var is_doubling:int = 0;
      
      public var rec_jinyan:int = 0;
      
      public var rec_zhenqi:int = 0;
      
      public function Biguan_BiguanMediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function onRemove() : void
      {
      }
      
      public function get Biguan_send() : Biguan_MsgSenderProxy
      {
         return facade.retrieveProxy(Biguan_MsgSenderProxy.NAME) as Biguan_MsgSenderProxy;
      }
      
      public function get biguanPan() : BiGuangPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.biguanPanel);
         }
         return viewComponent as BiGuangPanel;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(BiGuangPanel,function():void
         {
            biguanPan.addEventListener(Event.ADDED_TO_STAGE,onHandl);
            biguanPan.addEventListener(BiGuangPanel.UI_BIGUAN_BUY_BTN_CLICK,onHandl);
            biguanPan.addEventListener(BiGuangPanel.UI_BIGUAN_DOUBLING_INCOME_BTN_CLICK,onHandl);
            biguanPan.addEventListener(BiGuangPanel.UI_BIGUAN_INCOME_BTN_CLICK,onHandl);
            biguanPan.addEventListener(BiGuangPanel.UI_BIGUAN_DOUBLING_INCOME_GET,onHandl);
            biguanPan.addEventListener(BiGuangPanel.UI_BIGUAN_INCOME_GET,onHandl);
         });
         UIEventsRegisterManager.addUIRemovedEvent(BiGuangPanel,function():void
         {
            biguanPan.removeEventListener(Event.ADDED_TO_STAGE,onHandl);
            biguanPan.removeEventListener(BiGuangPanel.UI_BIGUAN_BUY_BTN_CLICK,onHandl);
            biguanPan.removeEventListener(BiGuangPanel.UI_BIGUAN_DOUBLING_INCOME_BTN_CLICK,onHandl);
            biguanPan.removeEventListener(BiGuangPanel.UI_BIGUAN_INCOME_BTN_CLICK,onHandl);
            biguanPan.removeEventListener(BiGuangPanel.UI_BIGUAN_DOUBLING_INCOME_GET,onHandl);
            biguanPan.removeEventListener(BiGuangPanel.UI_BIGUAN_INCOME_GET,onHandl);
         });
      }
      
      public function onHandl(param1:Event) : void
      {
         var _loc2_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.BIGUANFU_ID,true);
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               this.Biguan_send.send_50551();
               break;
            case BiGuangPanel.UI_BIGUAN_BUY_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[_loc2_.id,0]);
               break;
            case BiGuangPanel.UI_BIGUAN_DOUBLING_INCOME_BTN_CLICK:
               this.is_doubling = 1;
               this.biguanPan.showDoubleIncomeAffirmancePanel(_loc2_,this.rec_jinyan * 2,this.rec_zhenqi * 2);
               break;
            case BiGuangPanel.UI_BIGUAN_INCOME_BTN_CLICK:
               this.is_doubling = 0;
               this.biguanPan.showIncomeAffirmancePanel(_loc2_,this.rec_jinyan,this.rec_zhenqi);
               break;
            case BiGuangPanel.UI_BIGUAN_DOUBLING_INCOME_GET:
               this.is_doubling = 1;
               if(_loc2_.count <= 0)
               {
                  FAlert.show(LanResManager.getLanTextWords(this,"您的背包中没有闭关令符"),LanResManager.getLanTextWords(this,"闭关收益领取"));
               }
               else
               {
                  this.Biguan_send.send_50553(GameInstance.mainCharData.mountInfo.currentMountID,1);
               }
               break;
            case BiGuangPanel.UI_BIGUAN_INCOME_GET:
               this.is_doubling = 0;
               this.Biguan_send.send_50553(GameInstance.mainCharData.mountInfo.currentMountID,0);
         }
      }
   }
}

