package com.tgame.moudels.fengzhengjie.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.fengzhengjie.FengZhengJie_ApplicationFacade;
   import com.tgame.moudels.fengzhengjie.model.FengZhengJie_MsgSendProxy;
   import com.tgame.shell.view.components.fengzhengjie.FengZhengJiePanel;
   import com.tgame.shell.view.components.fengzhengjie.ZengSongFengZhengPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class FengZhengJie_Mediator extends Mediator
   {
      
      public static const NAME:String = "FengZhengJie_Mediator";
      
      private var _senderProxy:FengZhengJie_MsgSendProxy;
      
      public function FengZhengJie_Mediator()
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [FengZhengJie_ApplicationFacade.GET_FENGZHENGJIE_PANEL,FengZhengJie_ApplicationFacade.FENGZHENGJIE_ZENGSONG,FengZhengJie_ApplicationFacade.FENGZHENGJIE_XUNZHANGDUIHUAN];
      }
      
      private function get senderProxy() : FengZhengJie_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(FengZhengJie_MsgSendProxy.NAME) as FengZhengJie_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case FengZhengJie_ApplicationFacade.GET_FENGZHENGJIE_PANEL:
               this.senderProxy.send_73251(_loc2_);
               break;
            case FengZhengJie_ApplicationFacade.FENGZHENGJIE_ZENGSONG:
               this.senderProxy.send_73259(_loc2_);
               break;
            case FengZhengJie_ApplicationFacade.FENGZHENGJIE_XUNZHANGDUIHUAN:
               this.showFengzhengjieXunzhangPanel();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : FengZhengJiePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.fengzhengjiePanel);
         }
         return viewComponent as FengZhengJiePanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(FengZhengJiePanel,function():void
         {
            panel.addEventListener(FengZhengJiePanel.UI_GETXUNZHANG,onHandle);
            panel.addEventListener(FengZhengJiePanel.UI_LOOKRANK,onHandle);
            panel.addEventListener(FengZhengJiePanel.UI_GETMEIREN,onHandle);
            panel.addEventListener(FengZhengJiePanel.UI_SHENGJIFENGZHENG,onHandle);
            panel.addEventListener(FengZhengJiePanel.UI_ZHIZAOFENGZHENG,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(FengZhengJiePanel,function():void
         {
            panel.removeEventListener(FengZhengJiePanel.UI_GETXUNZHANG,onHandle);
            panel.removeEventListener(FengZhengJiePanel.UI_LOOKRANK,onHandle);
            panel.removeEventListener(FengZhengJiePanel.UI_GETMEIREN,onHandle);
            panel.removeEventListener(FengZhengJiePanel.UI_SHENGJIFENGZHENG,onHandle);
            panel.removeEventListener(FengZhengJiePanel.UI_ZHIZAOFENGZHENG,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         var _loc2_:Array = null;
         switch(param1.type)
         {
            case FengZhengJiePanel.UI_GETXUNZHANG:
               this.senderProxy.send_73261(param1.data);
               break;
            case FengZhengJiePanel.UI_LOOKRANK:
               _loc2_ = param1.data as Array;
               if(!Fun.isVisible(GameInstance.uiInstance.fengzhengjierankPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_FENGZHENGJIE_RANK_PANEL);
               }
               this.senderProxy.send_73253(_loc2_[0],_loc2_[1]);
               break;
            case FengZhengJiePanel.UI_GETMEIREN:
               this.senderProxy.send_73263(param1.data);
               break;
            case FengZhengJiePanel.UI_SHENGJIFENGZHENG:
               this.senderProxy.send_73257(param1.data);
               break;
            case FengZhengJiePanel.UI_ZHIZAOFENGZHENG:
               this.senderProxy.send_73255(param1.data);
         }
      }
      
      public function update(param1:int, param2:int, param3:int, param4:Boolean, param5:Boolean, param6:Boolean) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.fengzhengjiePanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_FENGZHENGJIE_PANEL);
         }
         if(Fun.isVisible(GameInstance.uiInstance.fengzhengjiePanel))
         {
            GameInstance.uiInstance.fengzhengjiePanel.update(param1,param2,param3,param4,param5,param6);
         }
      }
      
      public function updateRank(param1:int, param2:int, param3:int, param4:Array, param5:Boolean) : void
      {
         if(Fun.isVisible(GameInstance.uiInstance.fengzhengjierankPanel))
         {
            ResizeManager.showDoublePanel(GameInstance.uiInstance.fengzhengjiePanel,GameInstance.uiInstance.fengzhengjierankPanel);
            GameInstance.uiInstance.fengzhengjierankPanel.updateRank(param1,param2,param3,param4,param5);
         }
      }
      
      public function showAddQingmuzhiPanel(param1:int, param2:int) : void
      {
         var _loc3_:ZengSongFengZhengPanel = new ZengSongFengZhengPanel();
         _loc3_.update(param1,param2);
         POPWindowManager.showWindow(_loc3_,false);
      }
      
      public function showFengzhengjieXunzhangPanel() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.fengzhengjiexunzhang))
         {
            POPWindowManager.showWindow(GameInstance.uiInstance.fengzhengjiexunzhang);
         }
      }
   }
}

