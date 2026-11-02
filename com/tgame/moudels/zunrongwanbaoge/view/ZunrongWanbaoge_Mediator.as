package com.tgame.moudels.zunrongwanbaoge.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.zunrongwanbaoge.ZunrongWanbaoge_ApplicationFacade;
   import com.tgame.moudels.zunrongwanbaoge.model.ZunrongWanbaoge_MsgSenderProxy;
   import com.tgame.shell.view.components.ZunRongWanBaoGePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ZunrongWanbaoge_Mediator extends Mediator
   {
      
      public static const NAME:String = "ZunrongWanbaoge_Mediator";
      
      public function ZunrongWanbaoge_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      private function get wanbaogeMsgSenderProxy() : ZunrongWanbaoge_MsgSenderProxy
      {
         return facade.retrieveProxy(ZunrongWanbaoge_MsgSenderProxy.NAME) as ZunrongWanbaoge_MsgSenderProxy;
      }
      
      protected function get zunrongWanbaogePanel() : ZunRongWanBaoGePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.zunrongWanbaogePanel);
         }
         return viewComponent as ZunRongWanBaoGePanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ZunrongWanbaoge_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case ZunrongWanbaoge_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(GameInstance.uiInstance._zunrongWanbaogePanel))
               {
                  this.zunrongWanbaogePanel.setJianBaoLingNum(GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.TONGTIANJIAN_ID,true));
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ZunRongWanBaoGePanel,function():void
         {
            zunrongWanbaogePanel.addEventListener(Event.ADDED_TO_STAGE,onHandler);
            zunrongWanbaogePanel.addEventListener(ZunRongWanBaoGePanel.UI_ZUNRONGWANBAOGE_BAOSHIJIANSHANG_OK_BTN_CLICK,onHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ZunRongWanBaoGePanel,function():void
         {
            zunrongWanbaogePanel.removeEventListener(Event.ADDED_TO_STAGE,onHandler);
            zunrongWanbaogePanel.addEventListener(ZunRongWanBaoGePanel.UI_ZUNRONGWANBAOGE_BAOSHIJIANSHANG_OK_BTN_CLICK,onHandler);
         });
      }
      
      public function onHandler(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:Object = null;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               this.zunrongWanbaogePanel.setJianBaoLingNum(GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.TONGTIANJIAN_ID,true));
               this.wanbaogeMsgSenderProxy.send_71825();
               break;
            case ZunRongWanBaoGePanel.UI_ZUNRONGWANBAOGE_BAOSHIJIANSHANG_OK_BTN_CLICK:
               _loc2_ = param1 as BaseEvent;
               _loc3_ = _loc2_.data as Object;
               this.wanbaogeMsgSenderProxy.send_71827([10,_loc3_.info1,5,_loc3_.info2,2.5,_loc3_.info3,2,_loc3_.info4]);
         }
      }
      
      public function setShowBaoShi(param1:Array) : void
      {
         this.zunrongWanbaogePanel.setBaoShiInfo(param1);
      }
      
      public function setTimer(param1:int) : void
      {
         this.zunrongWanbaogePanel.setTimer(param1);
      }
      
      public function yaBaoSuccess() : void
      {
         if(this.zunrongWanbaogePanel.parent)
         {
            this.zunrongWanbaogePanel.parent.removeChild(this.zunrongWanbaogePanel);
         }
      }
   }
}

