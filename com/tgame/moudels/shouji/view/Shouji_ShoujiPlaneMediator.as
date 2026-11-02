package com.tgame.moudels.shouji.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.common.vo.character.info.data.CharShoujiData;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.shouji.Shouji_ApplicationFacade;
   import com.tgame.moudels.shouji.model.Shouji_MsgSenderProxy;
   import com.tgame.shell.view.components.CurioCollectPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Shouji_ShoujiPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "Shouji_ShoujiPlaneMediator";
      
      private var _msgSenderProxy:Shouji_MsgSenderProxy;
      
      public function Shouji_ShoujiPlaneMediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : Shouji_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Shouji_MsgSenderProxy.NAME) as Shouji_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get shoujiPanel() : CurioCollectPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.shoujiPanel);
         }
         return viewComponent as CurioCollectPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Shouji_ApplicationFacade.NPC_REQ_FUNCTION,Shouji_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Shouji_ApplicationFacade.NPC_REQ_FUNCTION:
               _loc4_ = Number(_loc2_);
               if(_loc4_ == NpcFunctionType.COLLECT)
               {
                  if(!Fun.isVisible(this.shoujiPanel))
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_SHOUJI_PANEL);
                  }
               }
               break;
            case Shouji_ApplicationFacade.GOODS_CHANGED:
               this.updateUI(true);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CurioCollectPanel,function():void
         {
            shoujiPanel.addEventListener(Event.ADDED_TO_STAGE,shoujiPanelHandle);
            shoujiPanel.addEventListener(CurioCollectPanel.UI_CURIOCOLLECTPANEL_ITEM_SUMBIT,shoujiPanelHandle);
            shoujiPanel.addEventListener(CurioCollectPanel.UI_CURIOCOLLECTPANEL_ITEM_DRAWBIT,shoujiPanelHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CurioCollectPanel,function():void
         {
            shoujiPanel.removeEventListener(Event.ADDED_TO_STAGE,shoujiPanelHandle);
            shoujiPanel.removeEventListener(CurioCollectPanel.UI_CURIOCOLLECTPANEL_ITEM_SUMBIT,shoujiPanelHandle);
            shoujiPanel.removeEventListener(CurioCollectPanel.UI_CURIOCOLLECTPANEL_ITEM_DRAWBIT,shoujiPanelHandle);
         });
      }
      
      private function shoujiPanelHandle(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:Object = null;
         var _loc5_:Array = null;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case Event.ADDED_TO_STAGE:
               this.msgSenderProxy.send_50901();
               break;
            case CurioCollectPanel.UI_CURIOCOLLECTPANEL_ITEM_SUMBIT:
               _loc3_ = param1 as BaseEvent;
               _loc4_ = _loc3_.data;
               this.msgSenderProxy.send_50903(parseInt(String(_loc4_)));
               break;
            case CurioCollectPanel.UI_CURIOCOLLECTPANEL_ITEM_DRAWBIT:
               _loc3_ = param1 as BaseEvent;
               _loc4_ = _loc3_.data;
               this.msgSenderProxy.send_50905(parseInt(String(_loc4_)));
         }
      }
      
      public function updateUI(param1:Boolean = false) : void
      {
         var _loc4_:Array = null;
         var _loc5_:String = null;
         var _loc7_:Object = null;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:String = null;
         var _loc11_:XML = null;
         var _loc12_:CharShoujiData = null;
         var _loc13_:XML = null;
         if(GameInstance.uiInstance._shoujiPanel == null)
         {
            return;
         }
         if(param1 && !Fun.isVisible(GameInstance.uiInstance._shoujiPanel))
         {
            return;
         }
         var _loc2_:XML = <node label="root"/>;
         var _loc3_:Dictionary = GameInstance.mainCharData.shoujiInfo.shoujiDict;
         var _loc6_:Array = [];
         for(_loc5_ in _loc3_)
         {
            _loc7_ = new Object();
            _loc7_.key = _loc5_;
            _loc7_.data = _loc3_[_loc5_];
            _loc6_.push(_loc7_);
         }
         _loc6_.sortOn("key",Array.NUMERIC);
         _loc9_ = int(_loc6_.length);
         _loc8_ = 0;
         while(_loc8_ < _loc9_)
         {
            _loc4_ = _loc6_[_loc8_].data;
            _loc10_ = _loc6_[_loc8_].key + LanResManager.getLanTextWords(this,"级收集");
            _loc11_ = <node label="" showLabel={_loc10_}/>;
            _loc2_.appendChild(_loc11_);
            for each(_loc12_ in _loc4_)
            {
               _loc13_ = <node label={_loc12_.shoujiRes.id} showLabel={_loc12_.shoujiRes.name} state={_loc12_.isComplete}/>;
               _loc11_.appendChild(_loc13_);
            }
            _loc8_++;
         }
         this.shoujiPanel.dataProvider = _loc2_;
      }
      
      public function updateGuWanUI(param1:int) : void
      {
         this.shoujiPanel.showSelectItemByID(param1.toString());
      }
   }
}

