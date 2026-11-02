package com.tgame.moudels.wedding.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.wedding.Wedding_ApplicationFacade;
   import com.tgame.moudels.wedding.model.Wedding_MsgSenderProxy;
   import com.tgame.shell.view.components.LaunchProposalPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.events.EventDispatchCenter;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class WeddingLaunchProposal_Mediator extends Mediator
   {
      
      public static const NAME:String = "WeddingLaunchProposal_Mediator";
      
      private var roleID:int;
      
      private var yupeiGoods:Goods;
      
      private var _senderProxy:Wedding_MsgSenderProxy;
      
      public function WeddingLaunchProposal_Mediator()
      {
         super(NAME);
      }
      
      protected function get panel() : LaunchProposalPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.launchProposalPanel);
         }
         return viewComponent as LaunchProposalPanel;
      }
      
      private function get sender() : Wedding_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Wedding_MsgSenderProxy.NAME) as Wedding_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Wedding_ApplicationFacade.SELECT_YUPEI,Wedding_ApplicationFacade.QIUHUN,Wedding_ApplicationFacade.SEND_QIUHUN];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:ItemFace = null;
         var _loc4_:Goods = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Wedding_ApplicationFacade.SELECT_YUPEI:
               _loc3_ = _loc2_ as ItemFace;
               _loc4_ = _loc3_.getBaseItem() as Goods;
               if(SpecialGoodsID.isYuPei(_loc4_.id))
               {
                  this.sender.send_52215(_loc4_.id);
                  TCursorManager.resumFullMouse();
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"该物品不是玉佩"),false);
               }
               break;
            case Wedding_ApplicationFacade.QIUHUN:
               this.sender.send_52213(_loc2_);
               break;
            case Wedding_ApplicationFacade.SEND_QIUHUN:
               this.sender.send_52213(GameInstance.readyJieHunID);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         EventDispatchCenter.getInstance().addEventListener(LaunchProposalPanel.UI_LAUNCHPROPOSALPANEL_BUYGOODSPANEL_OK_CLICK,this.addPanelEventListener);
         UIEventsRegisterManager.addUIRegisterEvent(LaunchProposalPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,addPanelEventListener);
            panel.addEventListener(LaunchProposalPanel.UI_LAUNCHPROPOSALPANEL_CHAKANZILIAO_CLICK,addPanelEventListener);
            panel.addEventListener(LaunchProposalPanel.UI_LAUNCHPROPOSALPANEL_FANGRUDINGQINGPEI_CLICK,addPanelEventListener);
            panel.addEventListener(LaunchProposalPanel.UI_LAUNCHPROPOSALPANEL_GOUMAIDINGQINGPEI_CLICK,addPanelEventListener);
            panel.addEventListener(LaunchProposalPanel.UI_LAUNCHPROPOSALPANEL_QIUHUN_CLICK,addPanelEventListener);
            panel.addEventListener(LaunchProposalPanel.UI_LAUNCHPROPOSALPANEL_YUPEILISTRENDERI_OK_CLICK,addPanelEventListener);
         });
         UIEventsRegisterManager.addUIRemovedEvent(LaunchProposalPanel,function():void
         {
            panel.removeEventListener(LaunchProposalPanel.UI_LAUNCHPROPOSALPANEL_BUYGOODSPANEL_OK_CLICK,addPanelEventListener);
            panel.removeEventListener(LaunchProposalPanel.UI_LAUNCHPROPOSALPANEL_CHAKANZILIAO_CLICK,addPanelEventListener);
            panel.removeEventListener(LaunchProposalPanel.UI_LAUNCHPROPOSALPANEL_FANGRUDINGQINGPEI_CLICK,addPanelEventListener);
            panel.removeEventListener(LaunchProposalPanel.UI_LAUNCHPROPOSALPANEL_GOUMAIDINGQINGPEI_CLICK,addPanelEventListener);
            panel.removeEventListener(LaunchProposalPanel.UI_LAUNCHPROPOSALPANEL_QIUHUN_CLICK,addPanelEventListener);
            panel.removeEventListener(LaunchProposalPanel.UI_LAUNCHPROPOSALPANEL_YUPEILISTRENDERI_OK_CLICK,addPanelEventListener);
            yupeiGoods = null;
         });
      }
      
      private function addPanelEventListener(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case LaunchProposalPanel.UI_LAUNCHPROPOSALPANEL_BUYGOODSPANEL_OK_CLICK:
               this.sender.send_52219(_loc2_.data);
               this.panel.closeBuyPanel();
               break;
            case LaunchProposalPanel.UI_LAUNCHPROPOSALPANEL_CHAKANZILIAO_CLICK:
               GameInstance.lookPlayerID = Number(_loc2_.data);
               if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               }
               PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               break;
            case LaunchProposalPanel.UI_LAUNCHPROPOSALPANEL_FANGRUDINGQINGPEI_CLICK:
               if(!Fun.isVisible(GameInstance.uiInstance._backpack))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
               }
               ResizeManager.showDoublePanel(this.panel,GameInstance.uiInstance.backpack);
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.resumFullMouse();
                  TCursorManager.showCursor(TCursorManager.CURSOR_SELECT_YUPEI);
                  TCursorManager.lockOnMouseStatus();
               }
               else
               {
                  TCursorManager.resumFullMouse();
               }
               break;
            case LaunchProposalPanel.UI_LAUNCHPROPOSALPANEL_GOUMAIDINGQINGPEI_CLICK:
               this.sender.send_52217();
               break;
            case LaunchProposalPanel.UI_LAUNCHPROPOSALPANEL_QIUHUN_CLICK:
               if(this.yupeiGoods == null)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"请先放入玉佩"),false);
                  return;
               }
               this.sender.send_52221([this.roleID,this.yupeiGoods.id]);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"求婚请求已经发送"),false);
               this.close();
         }
      }
      
      public function setYuPei(param1:Array) : void
      {
         this.yupeiGoods = param1[0] as Goods;
         this.panel.setYupei(param1);
      }
      
      public function setYuPeiList(param1:Array) : void
      {
         this.panel.showTupopingjingPanel(param1);
      }
      
      public function setInit(param1:int, param2:int, param3:String, param4:int, param5:String, param6:int) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_LAUNCH_PROPOSAL_PANEL);
         }
         this.roleID = param1;
         this.panel.setInitialize(HeadResChange.headResChangeToString(param2),param3,param5,param4.toString(),PartyType.getName(param6),param1);
      }
      
      public function close() : void
      {
         this.panel.onClose();
      }
   }
}

