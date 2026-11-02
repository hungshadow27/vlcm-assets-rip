package com.tgame.moudels.huangjinshu.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.huangjinshu.HuangJinShu_ApplicationFacade;
   import com.tgame.moudels.huangjinshu.model.HuangJinShu_MsgSenderProxy;
   import com.tgame.shell.view.components.huangjinshu.HuangJinShuPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class HuangJinShuee_Mediator extends Mediator
   {
      
      public static const NAME:String = "HuangJinShuee_Mediator";
      
      private var _senderProxy:HuangJinShu_MsgSenderProxy;
      
      public function HuangJinShuee_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : HuangJinShu_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(HuangJinShu_MsgSenderProxy.NAME) as HuangJinShu_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get wishingTreePanel() : HuangJinShuPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.huangjinshuPanel);
         }
         return viewComponent as HuangJinShuPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [HuangJinShu_ApplicationFacade.HUANGJINSHU_WATER];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case HuangJinShu_ApplicationFacade.HUANGJINSHU_WATER:
               this.senderProxy.send_73051();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(HuangJinShuPanel,function():void
         {
            wishingTreePanel.addEventListener(Event.ADDED_TO_STAGE,handler);
            wishingTreePanel.addEventListener(HuangJinShuPanel.UI_HUANGJINSHU_JIAOSHUI_CLICK,handler);
            wishingTreePanel.addEventListener(HuangJinShuPanel.UI_HUANGJINSHU_LINGQU_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(HuangJinShuPanel,function():void
         {
            wishingTreePanel.removeEventListener(Event.ADDED_TO_STAGE,handler);
            wishingTreePanel.removeEventListener(HuangJinShuPanel.UI_HUANGJINSHU_JIAOSHUI_CLICK,handler);
            wishingTreePanel.removeEventListener(HuangJinShuPanel.UI_HUANGJINSHU_LINGQU_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               this.senderProxy.send_73051();
               break;
            case HuangJinShuPanel.UI_HUANGJINSHU_JIAOSHUI_CLICK:
               this.senderProxy.send_73053();
               break;
            case HuangJinShuPanel.UI_HUANGJINSHU_LINGQU_CLICK:
               this.senderProxy.send_73055();
         }
      }
      
      public function setinit(param1:int, param2:Boolean) : void
      {
         this.wishingTreePanel.setZhufuzhi(param1,param2);
      }
      
      public function LoadingBar() : void
      {
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"恭喜您浇水成功！");
         NoticeManager.notify(NoticeManager.FOOT,"恭喜您浇水成功！");
      }
   }
}

