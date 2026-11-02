package com.tgame.moudels.duixueren.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.duixueren.DuiXueRen_ApplicationFacade;
   import com.tgame.moudels.duixueren.model.DuiXueRen_MsgSendProxy;
   import com.tgame.shell.view.components.duixueren.DuiXueRenPanel;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneCharacter;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class DuiXueRen_Mediator extends Mediator
   {
      
      public static const NAME:String = "DuiXueRen_Mediator";
      
      private var _senderProxy:DuiXueRen_MsgSendProxy;
      
      public function DuiXueRen_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : DuiXueRen_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(DuiXueRen_MsgSendProxy.NAME) as DuiXueRen_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [DuiXueRen_ApplicationFacade.GET_DUIXUEREN_PANEL,DuiXueRen_ApplicationFacade.DUIXUEREN_GET];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:SceneCharacter = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case DuiXueRen_ApplicationFacade.GET_DUIXUEREN_PANEL:
               this.senderProxy.send_80321();
               this.senderProxy.send_80337(1);
               break;
            case DuiXueRen_ApplicationFacade.DUIXUEREN_GET:
               _loc3_ = param1.getBody() as SceneCharacter;
               if(!_loc3_)
               {
                  return;
               }
               this.senderProxy.send_80323(_loc3_.id);
         }
      }
      
      public function get panel() : DuiXueRenPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.duixuerenPanel);
         }
         return viewComponent as DuiXueRenPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(DuiXueRenPanel,function():void
         {
            panel.addEventListener(DuiXueRenPanel.DUIXUEREN_CLICK,onHandle);
            panel.addEventListener(DuiXueRenPanel.DUIXUEREN_DUIHUAN_CLICK,onHandle);
            panel.addEventListener(DuiXueRenPanel.QUANMINGZAIXIAN_CHOUJIANG_CLICK,onHandle);
            panel.addEventListener(DuiXueRenPanel.QUANMINGZAIXIAN_LINGQU_CLICK,onHandle);
            panel.addEventListener(DuiXueRenPanel.QUANMINGCHOUJIANG,onHandle);
            panel.addEventListener(DuiXueRenPanel.QUANMINGCHOUJIANG_KAISHI,onHandle);
            panel.addEventListener(DuiXueRenPanel.QUANMINGCHOUJIANG_LIANGQU,onHandle);
            panel.addEventListener(DuiXueRenPanel.JIAONANGRANK_LINGQU_CLICK,onHandle);
            panel.addEventListener(DuiXueRenPanel.JIAONANGRANK_FANYE_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(DuiXueRenPanel,function():void
         {
            panel.removeEventListener(DuiXueRenPanel.DUIXUEREN_CLICK,onHandle);
            panel.removeEventListener(DuiXueRenPanel.DUIXUEREN_DUIHUAN_CLICK,onHandle);
            panel.removeEventListener(DuiXueRenPanel.QUANMINGZAIXIAN_CHOUJIANG_CLICK,onHandle);
            panel.removeEventListener(DuiXueRenPanel.QUANMINGZAIXIAN_LINGQU_CLICK,onHandle);
            panel.removeEventListener(DuiXueRenPanel.QUANMINGCHOUJIANG,onHandle);
            panel.removeEventListener(DuiXueRenPanel.QUANMINGCHOUJIANG_KAISHI,onHandle);
            panel.removeEventListener(DuiXueRenPanel.QUANMINGCHOUJIANG_LIANGQU,onHandle);
            panel.removeEventListener(DuiXueRenPanel.JIAONANGRANK_LINGQU_CLICK,onHandle);
            panel.removeEventListener(DuiXueRenPanel.JIAONANGRANK_FANYE_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case DuiXueRenPanel.DUIXUEREN_CLICK:
               switch(param1.data as int)
               {
                  case 1:
                     this.senderProxy.send_80321();
                     break;
                  case 2:
                     this.senderProxy.send_80325();
                     break;
                  case 3:
                     this.senderProxy.send_80331(1);
               }
               break;
            case DuiXueRenPanel.DUIXUEREN_DUIHUAN_CLICK:
               this.senderProxy.send_80343(param1.data as int);
               break;
            case DuiXueRenPanel.QUANMINGZAIXIAN_CHOUJIANG_CLICK:
               this.senderProxy.send_80327(param1.data as int);
               break;
            case DuiXueRenPanel.QUANMINGZAIXIAN_LINGQU_CLICK:
               this.senderProxy.send_80329(param1.data as int);
               break;
            case DuiXueRenPanel.QUANMINGCHOUJIANG:
               this.senderProxy.send_80331(param1.data as int);
               break;
            case DuiXueRenPanel.QUANMINGCHOUJIANG_KAISHI:
               this.senderProxy.send_80333(param1.data as int);
               break;
            case DuiXueRenPanel.QUANMINGCHOUJIANG_LIANGQU:
               this.senderProxy.send_80335(param1.data as int);
               break;
            case DuiXueRenPanel.JIAONANGRANK_LINGQU_CLICK:
               this.senderProxy.send_80339();
               break;
            case DuiXueRenPanel.JIAONANGRANK_FANYE_CLICK:
               this.senderProxy.send_80337(param1.data as int);
         }
      }
      
      public function setDuiXueRenData(param1:int = 0, param2:Array = null) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_DUIXUEREN);
         }
         this.panel.setDuiXueRenData(param1,param2);
         this.panel.setCurrIndexView(1);
      }
      
      public function setQuanMingZaiXianData(param1:int, param2:Array) : void
      {
         this.panel.setQuanMingZaiXianData(param1,param2);
         this.panel.setCurrIndexView(2);
      }
      
      public function setQuanMingZaiXianResult(param1:int, param2:int) : void
      {
         this.panel.setQuanMingZaiXianResult(param1,param2);
      }
      
      public function setQuanMinChouJiangData(param1:int = 0, param2:Object = null, param3:Array = null, param4:int = 0, param5:int = 0) : void
      {
         this.panel.setQuanMinChouJiangData(param1,param2,param3,param4,param5);
         this.panel.setCurrIndexView(3);
      }
      
      public function setTurnData(param1:Object, param2:int) : void
      {
         this.panel.setTurnData(param1,param2);
      }
      
      public function setJiaoNangDaLuanDouRankData(param1:Array, param2:Object) : void
      {
         this.panel.setJiaoNangDaLuanDouRankData(param1,param2);
      }
   }
}

