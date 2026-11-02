package com.tgame.moudels.baoshijianshang.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.npc.NpcRes;
   import com.tgame.common.res.npc.NpcResManager;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.baoshijianshang.BaoShiJianShang_ApplicationFacade;
   import com.tgame.moudels.baoshijianshang.model.BaoShiJianShang_MsgSenderProxy;
   import com.tgame.shell.view.components.BaoShiJianShangPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.SceneCharacterType;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class BaoShiJianShang_BaoShiJianShangMediator extends Mediator
   {
      
      public static const NAME:String = "BaoShiJianShang_BaoShiJianShangMediator";
      
      public function BaoShiJianShang_BaoShiJianShangMediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      private function get baoshiMsgSenderProxy() : BaoShiJianShang_MsgSenderProxy
      {
         return facade.retrieveProxy(BaoShiJianShang_MsgSenderProxy.NAME) as BaoShiJianShang_MsgSenderProxy;
      }
      
      protected function get baoShiJianShangPanel() : BaoShiJianShangPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.baoShiJianShangPanel);
         }
         return viewComponent as BaoShiJianShangPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(BaoShiJianShangPanel,function():void
         {
            baoShiJianShangPanel.addEventListener(Event.ADDED_TO_STAGE,onHandler);
            baoShiJianShangPanel.addEventListener(BaoShiJianShangPanel.UI_BAOSHIJIANSHANG_BUY_BTN_CLICK,onHandler);
            baoShiJianShangPanel.addEventListener(BaoShiJianShangPanel.UI_BAOSHIJIANSHANG_OK_BTN_CLICK,onHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(BaoShiJianShangPanel,function():void
         {
            baoShiJianShangPanel.removeEventListener(Event.ADDED_TO_STAGE,onHandler);
            baoShiJianShangPanel.removeEventListener(BaoShiJianShangPanel.UI_BAOSHIJIANSHANG_BUY_BTN_CLICK,onHandler);
            baoShiJianShangPanel.addEventListener(BaoShiJianShangPanel.UI_BAOSHIJIANSHANG_OK_BTN_CLICK,onHandler);
         });
      }
      
      public function onHandler(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:Object = null;
         var _loc2_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.JIANBAOLING_ID,true);
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               this.baoShiJianShangPanel.setJianBaoLingNum(GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.JIANBAOLING_ID,true));
               this.baoshiMsgSenderProxy.send_54001();
               break;
            case BaoShiJianShangPanel.UI_BAOSHIJIANSHANG_BUY_BTN_CLICK:
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[_loc2_.id,0]);
               break;
            case BaoShiJianShangPanel.UI_BAOSHIJIANSHANG_OK_BTN_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc4_ = _loc3_.data as Object;
               this.baoshiMsgSenderProxy.send_54003([10,_loc4_.info1,5,_loc4_.info2,2.5,_loc4_.info3,2,_loc4_.info4]);
         }
      }
      
      override public function listNotificationInterests() : Array
      {
         return [BaoShiJianShang_ApplicationFacade.GOODS_CHANGED,BaoShiJianShang_ApplicationFacade.SEND_TO_WANBAOGE,BaoShiJianShang_ApplicationFacade.SET_BAOSHI_TIME];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:SceneCharacter = null;
         var _loc4_:NpcRes = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case BaoShiJianShang_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(GameInstance.uiInstance._baoShiJianShangPanel))
               {
                  this.baoShiJianShangPanel.setJianBaoLingNum(GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.JIANBAOLING_ID,true));
               }
               break;
            case BaoShiJianShang_ApplicationFacade.SEND_TO_WANBAOGE:
               _loc3_ = GameInstance.lockOnChar;
               if(Boolean(_loc3_) && _loc3_.type == SceneCharacterType.NPC)
               {
                  _loc4_ = NpcResManager.getNpcRes(_loc3_.id);
                  this.baoshiMsgSenderProxy.send_10731([_loc3_.id,2,20230]);
               }
               break;
            case BaoShiJianShang_ApplicationFacade.SET_BAOSHI_TIME:
               if(_loc2_ != null)
               {
                  this.setTimer(_loc2_.timer);
               }
         }
      }
      
      public function setShowBaoShi(param1:Array) : void
      {
         this.baoShiJianShangPanel.setBaoShiInfo(param1);
      }
      
      public function setTimer(param1:int) : void
      {
         this.baoShiJianShangPanel.setTimer(param1);
      }
      
      public function yaBaoSuccess() : void
      {
         if(this.baoShiJianShangPanel.parent)
         {
            this.baoShiJianShangPanel.parent.removeChild(this.baoShiJianShangPanel);
         }
      }
      
      public function showBaoShiIco(param1:int, param2:int) : void
      {
         this.baoShiJianShangPanel.showBaoShiIco(param1,param2);
      }
   }
}

