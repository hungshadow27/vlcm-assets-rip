package com.tgame.moudels.nitaCyclone.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.nitaCyclone.NitaCyclone_ApplicationFacade;
   import com.tgame.moudels.nitaCyclone.info.NitaSkillInfo;
   import com.tgame.moudels.nitaCyclone.model.NitaCyclone_MsgSenderProxy;
   import com.tgame.shell.view.components.DantianWuxueDanPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.observer.Notification;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class NitaSkill_Mediator extends Mediator
   {
      
      public static const NAME:String = "NitaSkill_Mediator";
      
      private var _msgSendProxy:NitaCyclone_MsgSenderProxy;
      
      public function NitaSkill_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      protected function get nitaSkill() : DantianWuxueDanPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.nitaSkill);
         }
         return viewComponent as DantianWuxueDanPanel;
      }
      
      public function get msgSendProxy() : NitaCyclone_MsgSenderProxy
      {
         if(this._msgSendProxy == null)
         {
            this._msgSendProxy = facade.retrieveProxy(NitaCyclone_MsgSenderProxy.NAME) as NitaCyclone_MsgSenderProxy;
         }
         return this._msgSendProxy;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [NitaCyclone_ApplicationFacade.SHOW_GOODS_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:Goods = _loc2_ as Goods;
         switch(param1.getName())
         {
            case NitaCyclone_ApplicationFacade.SHOW_GOODS_PANEL:
               if(_loc3_.id == 1307)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_NITA_SKILL);
                  this.msgSendProxy.send_53161();
               }
         }
      }
      
      public function updateSkillPanel(param1:NitaSkillInfo) : void
      {
         var _loc2_:uint = uint(GameInstance.mainCharData.goodsInfo.getGoodsNumByID(1307,true));
         var _loc3_:Boolean = _loc2_ >= 1307 ? true : false;
         var _loc4_:Goods = new Goods(1307);
         _loc4_.count = _loc2_;
         this.nitaSkill.setInitialize(param1.curtNitaID,param1.skillList);
         this.nitaSkill.setGoods(_loc4_);
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(DantianWuxueDanPanel,function():void
         {
            nitaSkill.addEventListener(DantianWuxueDanPanel.UI_DANTIANWUXUEDAN_SKILL_BOOK_COUNT,onLearnSkill);
         });
         UIEventsRegisterManager.addUIRemovedEvent(DantianWuxueDanPanel,function():void
         {
            nitaSkill.removeEventListener(DantianWuxueDanPanel.UI_DANTIANWUXUEDAN_SKILL_BOOK_COUNT,onLearnSkill);
         });
      }
      
      private function handlePipeMessage(param1:Notification) : void
      {
         var _loc2_:Object = param1.body;
         switch(param1.name)
         {
            case PipeConstants.GOODS_CHANGED:
         }
      }
      
      private function onLearnSkill(param1:BaseEvent) : void
      {
         var _loc2_:uint = uint(param1.data);
         this._msgSendProxy.send_53159(_loc2_);
      }
   }
}

