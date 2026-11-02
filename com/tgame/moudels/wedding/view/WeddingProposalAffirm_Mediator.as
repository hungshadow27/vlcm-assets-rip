package com.tgame.moudels.wedding.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.HeadResChange;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.wedding.model.Wedding_MsgSenderProxy;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.ProposalAffirmPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class WeddingProposalAffirm_Mediator extends Mediator
   {
      
      public static const NAME:String = "WeddingProposalAffirm_Mediator";
      
      private var roleID:int;
      
      private var yupeiID:int;
      
      private var _senderProxy:Wedding_MsgSenderProxy;
      
      public function WeddingProposalAffirm_Mediator()
      {
         super(NAME);
      }
      
      protected function get panel() : ProposalAffirmPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.proposalAffirmPanel);
         }
         return viewComponent as ProposalAffirmPanel;
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
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ProposalAffirmPanel,function():void
         {
            panel.addEventListener(ProposalAffirmPanel.UI_LAUNCHPROPOSALPANEL_CHAKANZILIAO_CLICK,addPanelEventListener);
            panel.addEventListener(ProposalAffirmPanel.UI_LAUNCHPROPOSALPANEL_QIUHUN_CLICK,addPanelEventListener);
            panel.addEventListener(ProposalAffirmPanel.UI_LAUNCHPROPOSALPANEL_JUJUE_CLICK,addPanelEventListener);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ProposalAffirmPanel,function():void
         {
            panel.removeEventListener(ProposalAffirmPanel.UI_LAUNCHPROPOSALPANEL_CHAKANZILIAO_CLICK,addPanelEventListener);
            panel.removeEventListener(ProposalAffirmPanel.UI_LAUNCHPROPOSALPANEL_QIUHUN_CLICK,addPanelEventListener);
            panel.removeEventListener(ProposalAffirmPanel.UI_LAUNCHPROPOSALPANEL_JUJUE_CLICK,addPanelEventListener);
         });
      }
      
      private function addPanelEventListener(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case ProposalAffirmPanel.UI_LAUNCHPROPOSALPANEL_CHAKANZILIAO_CLICK:
               GameInstance.lookPlayerID = Number(_loc2_.data);
               if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               }
               PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               break;
            case ProposalAffirmPanel.UI_LAUNCHPROPOSALPANEL_QIUHUN_CLICK:
               this.sender.send_52227([this.roleID,this.yupeiID,1]);
               this.close();
               break;
            case ProposalAffirmPanel.UI_LAUNCHPROPOSALPANEL_JUJUE_CLICK:
               this.sender.send_52227([this.roleID,this.yupeiID,0]);
               this.close();
         }
      }
      
      public function setInit(param1:int, param2:int, param3:String, param4:int, param5:String, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int) : void
      {
         var callBack:Function = null;
         var $roleID:int = param1;
         var $head:int = param2;
         var $name:String = param3;
         var $level:int = param4;
         var $panghui:String = param5;
         var $menpai:int = param6;
         var $yupeiID:int = param7;
         var $buffID_1:int = param8;
         var $buffID_2:int = param9;
         var $goodsID_1:int = param10;
         var $goodsID_2:int = param11;
         callBack = function():void
         {
            if(!Fun.isVisible(panel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_PROPOSAL_AFFIRM_PANEL);
            }
            panel.setInitialize(HeadResChange.headResChangeToString($head),$name,$panghui,$level.toString(),PartyType.getName($menpai),$roleID);
            var _loc1_:Goods = new Goods($yupeiID);
            var _loc2_:Skill = new Skill($buffID_1);
            var _loc3_:Skill = new Skill($buffID_2);
            var _loc4_:Goods = new Goods($goodsID_1);
            var _loc5_:Goods = new Goods($goodsID_2);
            var _loc6_:Array = [];
            _loc6_.push(_loc1_,_loc2_,_loc3_,_loc4_,_loc5_);
            panel.setYupei(_loc6_);
            roleID = $roleID;
            yupeiID = $yupeiID;
         };
         GameInstance.uiInstance.mainUI.showICOTip(MainUI.TYPE_COURTSHIP_TIP,callBack);
      }
      
      public function close() : void
      {
         this.panel.onClose();
      }
   }
}

