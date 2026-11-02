package com.tgame.moudels.zhizhanzhishang.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.zhizhanzhishang.model.ZhiZhanZhiShang_MsgSenderProxy;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.ZhiZhanZhiShangLingJiangPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ZhiZhanZhiShangLingJiang_Mediator extends Mediator
   {
      
      public static const NAME:String = "ZhiZhanZhiShangLingJiang_Mediator";
      
      private var _msgSenderProxy:ZhiZhanZhiShang_MsgSenderProxy;
      
      public function ZhiZhanZhiShangLingJiang_Mediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : ZhiZhanZhiShang_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(ZhiZhanZhiShang_MsgSenderProxy.NAME) as ZhiZhanZhiShang_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get panel() : ZhiZhanZhiShangLingJiangPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.zhiZhanZhiShangLingJiangPanel);
         }
         return viewComponent as ZhiZhanZhiShangLingJiangPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ZhiZhanZhiShangLingJiangPanel,function():void
         {
            panel.addEventListener(ZhiZhanZhiShangLingJiangPanel.UI_ZHIZHANZHISHANG_LINGJIANG,handle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ZhiZhanZhiShangLingJiangPanel,function():void
         {
            panel.removeEventListener(ZhiZhanZhiShangLingJiangPanel.UI_ZHIZHANZHISHANG_LINGJIANG,handle);
         });
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      private function handle(param1:*) : void
      {
         switch(param1.type)
         {
            case ZhiZhanZhiShangLingJiangPanel.UI_ZHIZHANZHISHANG_LINGJIANG:
               this.msgSenderProxy.send_59007();
         }
      }
      
      public function setPanel(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.zhiZhanZhiShangLingJiangPanel);
            GameInstance.uiInstance.zhiZhanZhiShangLingJiangPanel.visible = true;
            GameInstance.uiInstance.zhiZhanZhiShangLingJiangPanel.x = (GameConfig.sceneWidth - GameInstance.uiInstance.zhiZhanZhiShangLingJiangPanel.width) / 2;
            GameInstance.uiInstance.zhiZhanZhiShangLingJiangPanel.y = (GameConfig.sceneHeight - GameInstance.uiInstance.zhiZhanZhiShangLingJiangPanel.height) / 2;
         }
         this.panel.setPanel(param1,param2,param3,param4,param5,param6,param7);
      }
      
      public function lingqu() : void
      {
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_ZHIZHANZHISHANG_LINGQU,{"fun":this.msgSenderProxy.send_59007});
      }
   }
}

