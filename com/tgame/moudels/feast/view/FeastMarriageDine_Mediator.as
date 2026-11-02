package com.tgame.moudels.feast.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.character.Monster;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.feast.Feast_ApplicationFacade;
   import com.tgame.moudels.feast.model.Feast_MsgSenderProxy;
   import com.tgame.shell.view.components.MarriageDinePanel;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class FeastMarriageDine_Mediator extends Mediator
   {
      
      public static const NAME:String = "FeastMarriageDine_Mediator";
      
      private var _jincanHunyanID:int = 0;
      
      private var _monsterID:int = 0;
      
      private var _msgSenderProxy:Feast_MsgSenderProxy;
      
      public function FeastMarriageDine_Mediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : Feast_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Feast_MsgSenderProxy.NAME) as Feast_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get marriageDinePanel() : MarriageDinePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.marriageDinePanel);
         }
         return viewComponent as MarriageDinePanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Feast_ApplicationFacade.HUN_YAN_CHI];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Feast_ApplicationFacade.HUN_YAN_CHI:
               this.msgSenderProxy.send_52253([((_loc2_ as SceneCharacter).data as Monster).attributeInfo.hunyan7_ID,(_loc2_ as SceneCharacter).id]);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(MarriageDinePanel,function():void
         {
            marriageDinePanel.addEventListener(MarriageDinePanel.UI_MARRIAGE_DINE_START,initEventsListener);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MarriageDinePanel,function():void
         {
            marriageDinePanel.removeEventListener(MarriageDinePanel.UI_MARRIAGE_DINE_START,initEventsListener);
         });
      }
      
      private function initEventsListener(param1:Event) : void
      {
         switch(param1.type)
         {
            case MarriageDinePanel.UI_MARRIAGE_DINE_START:
               if(this._monsterID > 0)
               {
                  this.closePanelHandler();
                  this.msgSenderProxy.send_52257(this._monsterID);
               }
         }
      }
      
      public function updateUI(param1:int, param2:String, param3:int, param4:Number, param5:int, param6:int) : void
      {
         this.closePanelHandler();
         this._jincanHunyanID = param1;
         this._monsterID = param3;
         this.marriageDinePanel.setName(param2);
         this.marriageDinePanel.setFoodCount(param4);
         this.marriageDinePanel.setExp(param5);
         this.marriageDinePanel.setCash(param6);
         PipeManager.sendMsg(PipeConstants.SHOW_MARRIAGE_DINE_PLANE);
      }
      
      private function closePanelHandler() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._marriageGiveCashGiftPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MARRIAGE_GIVE_CASH_GIFT_PLANE);
         }
         if(Fun.isVisible(GameInstance.uiInstance._marriageDinePanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MARRIAGE_DINE_PLANE);
         }
      }
   }
}

