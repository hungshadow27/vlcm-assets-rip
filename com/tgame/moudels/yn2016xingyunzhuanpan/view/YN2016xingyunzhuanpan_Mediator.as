package com.tgame.moudels.yn2016xingyunzhuanpan.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.yn2016xingyunzhuanpan.YN2016xingyunzhuanpan_ApplicationFacade;
   import com.tgame.moudels.yn2016xingyunzhuanpan.model.YN2016xingyunzhuanpan_MsgSendProxy;
   import com.tgame.shell.view.components.ynSpecial.YN2016xingyunzhuanpanPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YN2016xingyunzhuanpan_Mediator extends Mediator
   {
      
      public static const NAME:String = "YN2016xingyunzhuanpan_Mediator";
      
      private var _senderProxy:YN2016xingyunzhuanpan_MsgSendProxy;
      
      private var ty:int = -1;
      
      private var tt:int = 0;
      
      public function YN2016xingyunzhuanpan_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [undefined,YN2016xingyunzhuanpan_ApplicationFacade.SHOW_YN2016XINGYUNZHUANPAN];
      }
      
      private function get senderProxy() : YN2016xingyunzhuanpan_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YN2016xingyunzhuanpan_MsgSendProxy.NAME) as YN2016xingyunzhuanpan_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case YN2016xingyunzhuanpan_ApplicationFacade.SHOW_YN2016XINGYUNZHUANPAN:
               this.senderProxy.send_81061();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : YN2016xingyunzhuanpanPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.yn2016XingyunzhuanpanPanel);
         }
         return viewComponent as YN2016xingyunzhuanpanPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YN2016xingyunzhuanpanPanel,function():void
         {
            panel.addEventListener(YN2016xingyunzhuanpanPanel.YN_QUANMINGCHOUJIANG_KAISHI,onHandle);
            panel.addEventListener(YN2016xingyunzhuanpanPanel.YN_QUANMINGCHOUJIANG_LIANGQU,onHandle);
            panel.addEventListener(YN2016xingyunzhuanpanPanel.YN_XINGYUNZHUANPAN_KAIJIANGJILU,onHandle);
            panel.addEventListener(YN2016xingyunzhuanpanPanel.YN_XINGYUNZHUANPAN_DUIHUANWUPIN,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YN2016xingyunzhuanpanPanel,function():void
         {
            panel.removeEventListener(YN2016xingyunzhuanpanPanel.YN_QUANMINGCHOUJIANG_KAISHI,onHandle);
            panel.removeEventListener(YN2016xingyunzhuanpanPanel.YN_QUANMINGCHOUJIANG_LIANGQU,onHandle);
            panel.removeEventListener(YN2016xingyunzhuanpanPanel.YN_XINGYUNZHUANPAN_KAIJIANGJILU,onHandle);
            panel.removeEventListener(YN2016xingyunzhuanpanPanel.YN_XINGYUNZHUANPAN_DUIHUANWUPIN,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case YN2016xingyunzhuanpanPanel.YN_QUANMINGCHOUJIANG_KAISHI:
               this.senderProxy.send_81063();
               this.tt = 0;
               break;
            case YN2016xingyunzhuanpanPanel.YN_QUANMINGCHOUJIANG_LIANGQU:
               this.senderProxy.send_81065();
               break;
            case YN2016xingyunzhuanpanPanel.YN_XINGYUNZHUANPAN_DUIHUANWUPIN:
               this.senderProxy.send_81067(param1.data);
               break;
            case YN2016xingyunzhuanpanPanel.YN_XINGYUNZHUANPAN_KAIJIANGJILU:
               this.senderProxy.send_81069(param1.data);
         }
      }
      
      public function setData(param1:Array, param2:int, param3:int, param4:int, param5:int, param6:Array, param7:String, param8:String, param9:Boolean, param10:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.yn2016XingyunzhuanpanPanel))
         {
            GameInstance.uiInstance.yn2016XingyunzhuanpanPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.yn2016XingyunzhuanpanPanel.width / 2;
            GameInstance.uiInstance.yn2016XingyunzhuanpanPanel.y = GameConfig.sceneHeight / 2 - 466 / 2;
            GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.yn2016XingyunzhuanpanPanel);
            this.tt = 1;
         }
         this.panel.setQuanMingChouJiangData(param3,param1,param9,param10,param6,param5,param4,param7,param8,this.tt);
      }
      
      public function setJiangli(param1:int) : void
      {
         this.panel.setTurn(param1);
      }
      
      public function setJilu(param1:int, param2:String) : void
      {
         this.panel.setJilu(param2,param1);
      }
   }
}

