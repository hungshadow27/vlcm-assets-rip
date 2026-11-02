package com.tgame.moudels.fabao.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.fabao.model.Fabao_MsgSendProxy;
   import com.tgame.shell.view.components.fabao.Fabao_LingliPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class FabaoLingli_Mediator extends Mediator
   {
      
      public static const NAME:String = "FabaoLingli_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var ti:Timer = new Timer(1000,0);
      
      private var nowLV:int = 0;
      
      private var FBID:int = 0;
      
      private var _senderProxy:Fabao_MsgSendProxy;
      
      public function FabaoLingli_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      private function get senderProxy() : Fabao_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Fabao_MsgSendProxy.NAME) as Fabao_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : Fabao_LingliPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.fabaolingli);
         }
         return viewComponent as Fabao_LingliPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(Fabao_LingliPanel,function():void
         {
            panel.addEventListener(Fabao_LingliPanel.UI_AUTO_NINGJIELINGLIDAN,onHandle);
            panel.addEventListener(Fabao_LingliPanel.UI_NINGJIELINGLIDAN_CLICK,onHandle);
            panel.addEventListener(Fabao_LingliPanel.UI_QIANGHUAFABAO_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(Fabao_LingliPanel,function():void
         {
            panel.removeEventListener(Fabao_LingliPanel.UI_AUTO_NINGJIELINGLIDAN,onHandle);
            panel.removeEventListener(Fabao_LingliPanel.UI_NINGJIELINGLIDAN_CLICK,onHandle);
            panel.removeEventListener(Fabao_LingliPanel.UI_QIANGHUAFABAO_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         var e:BaseEvent = null;
         var type:int = 0;
         var t:int = 0;
         var tyy:int = 0;
         var tiFun:Function = null;
         var evt:* = param1;
         e = evt as BaseEvent;
         switch(evt.type)
         {
            case Fabao_LingliPanel.UI_AUTO_NINGJIELINGLIDAN:
               type = Boolean(e.data) == true ? 1 : 0;
               this.senderProxy.send_73645(type);
               break;
            case Fabao_LingliPanel.UI_NINGJIELINGLIDAN_CLICK:
               t = int(e.data);
               tyy = -1;
               if(t == 1)
               {
                  tyy = 1;
               }
               else if(t == 2)
               {
                  tyy = 2;
               }
               if(tyy == 1 || tyy == 2)
               {
                  tiFun = function():void
                  {
                     if(tyy == 2)
                     {
                        if(ti != null)
                        {
                           ti.removeEventListener(TimerEvent.TIMER,tiFun);
                           ti.stop();
                        }
                     }
                     else if(GameInstance.mainCharData.attributeInfo.lingliNow > 10000 && tyy == 1)
                     {
                        senderProxy.send_73643();
                     }
                     else if(GameInstance.mainCharData.attributeInfo.lingliNow < 10000)
                     {
                        NoticeManager.notify(NoticeManager.FOOT,"对不起，您的灵力不足！");
                        NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"对不起，您的灵力不足！");
                        panel.setBtn(true);
                        if(ti != null)
                        {
                           ti.removeEventListener(TimerEvent.TIMER,tiFun);
                           ti.stop();
                        }
                        return;
                     }
                  };
                  if(tyy == 1)
                  {
                     this.ti.start();
                     this.ti.addEventListener(TimerEvent.TIMER,tiFun);
                     NoticeManager.notify(NoticeManager.FOOT,"开始自动凝结灵力丹！");
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"开始自动凝结灵力丹！");
                  }
                  else if(tyy == 2)
                  {
                     this.ti.removeEventListener(TimerEvent.TIMER,tiFun);
                     this.ti.stop();
                     tyy = 2;
                     NoticeManager.notify(NoticeManager.FOOT,"停止自动凝结灵力丹！");
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"停止自动凝结灵力丹！");
                     this.panel.setBtn(true);
                  }
               }
               else
               {
                  this.senderProxy.send_73643();
               }
               break;
            case Fabao_LingliPanel.UI_QIANGHUAFABAO_CLICK:
               PipeManager.sendMsg(PipeConstants.REQUEST_FABAOPANEL,-1);
         }
      }
   }
}

