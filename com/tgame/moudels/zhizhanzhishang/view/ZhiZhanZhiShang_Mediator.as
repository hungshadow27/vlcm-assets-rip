package com.tgame.moudels.zhizhanzhishang.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.zhizhanzhishang.ZhiZhanZhiShang_ApplicationFacade;
   import com.tgame.moudels.zhizhanzhishang.model.ZhiZhanZhiShang_MsgSenderProxy;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.ZhiZhanZhiShangPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ZhiZhanZhiShang_Mediator extends Mediator
   {
      
      public static const NAME:String = "ZhiZhanZhiShang_Mediator";
      
      private var nowPageNum:int = 1;
      
      private var nowPageNum_History:int = 1;
      
      private var maxPageNum:int = 1;
      
      private var maxPageNum_History:int = 1;
      
      private var _msgSenderProxy:ZhiZhanZhiShang_MsgSenderProxy;
      
      public function ZhiZhanZhiShang_Mediator()
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ZhiZhanZhiShangPanel,function():void
         {
            zhizhanzhishangPanel.addEventListener(ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_JINRU_BTN,handler);
            zhizhanzhishangPanel.addEventListener(ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_RED_ZHUWEI,handler);
            zhizhanzhishangPanel.addEventListener(ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_BLUE_ZHUWEI,handler);
            zhizhanzhishangPanel.addEventListener(ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_LIST_PAGE,handler);
            zhizhanzhishangPanel.addEventListener(ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_LEIGUPANEL,handler);
            zhizhanzhishangPanel.addEventListener(ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_ZHANKUANGPANEL,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ZhiZhanZhiShangPanel,function():void
         {
            zhizhanzhishangPanel.removeEventListener(ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_JINRU_BTN,handler);
            zhizhanzhishangPanel.removeEventListener(ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_RED_ZHUWEI,handler);
            zhizhanzhishangPanel.removeEventListener(ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_BLUE_ZHUWEI,handler);
            zhizhanzhishangPanel.removeEventListener(ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_LIST_PAGE,handler);
            zhizhanzhishangPanel.removeEventListener(ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_LEIGUPANEL,handler);
            zhizhanzhishangPanel.removeEventListener(ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_ZHANKUANGPANEL,handler);
         });
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ZhiZhanZhiShang_ApplicationFacade.SHOW_ZHIZHANZHISHANG];
      }
      
      protected function get zhizhanzhishangPanel() : ZhiZhanZhiShangPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.zhizhanzhishang);
         }
         return viewComponent as ZhiZhanZhiShangPanel;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case ZhiZhanZhiShang_ApplicationFacade.SHOW_ZHIZHANZHISHANG:
               if(!Fun.isVisible(this.zhizhanzhishangPanel))
               {
                  GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.zhizhanzhishang);
                  GameInstance.uiInstance.zhizhanzhishang.visible = true;
                  GameInstance.uiInstance.zhizhanzhishang.x = (GameConfig.sceneWidth - GameInstance.uiInstance.zhizhanzhishang.width) / 2;
                  GameInstance.uiInstance.zhizhanzhishang.y = (GameConfig.sceneHeight - GameInstance.uiInstance.zhizhanzhishang.height) / 2;
               }
         }
      }
      
      private function get msgSenderProxy() : ZhiZhanZhiShang_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(ZhiZhanZhiShang_MsgSenderProxy.NAME) as ZhiZhanZhiShang_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function handler(param1:*) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         var _loc3_:int = _loc2_.data as int;
         switch(param1.type)
         {
            case ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_LEIGUPANEL:
               this.msgSenderProxy.send_59051();
               break;
            case ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_ZHANKUANGPANEL:
               this.msgSenderProxy.send_59057([1]);
               break;
            case ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_JINRU_BTN:
               if(Fun.isVisible(this.zhizhanzhishangPanel))
               {
                  GameInstance.uiInstance.uiContainer.removeChild(GameInstance.uiInstance.zhizhanzhishang);
                  GameInstance.uiInstance.zhizhanzhishang.visible = false;
               }
               this.msgSenderProxy.send_59001();
               break;
            case ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_RED_ZHUWEI:
               this.msgSenderProxy.send_59053([0]);
               break;
            case ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_BLUE_ZHUWEI:
               this.msgSenderProxy.send_59053([1]);
               break;
            case ZhiZhanZhiShangPanel.UI_ZHIZHANZHISHANG_LIST_PAGE:
               if(param1.data == 1)
               {
                  this.nowPageNum_History = 1;
               }
               if(param1.data == 2)
               {
                  --this.nowPageNum_History;
               }
               if(param1.data == 3)
               {
                  this.nowPageNum_History += 1;
               }
               if(param1.data == 4)
               {
                  this.nowPageNum_History = this.maxPageNum;
               }
               if(this.nowPageNum_History < 1)
               {
                  this.nowPageNum_History = 1;
               }
               if(this.nowPageNum_History > this.maxPageNum)
               {
                  this.nowPageNum_History = this.maxPageNum;
               }
               this.msgSenderProxy.send_59057([this.nowPageNum_History]);
         }
      }
      
      public function setZhuWeiPanel(param1:int, param2:int) : void
      {
         this.zhizhanzhishangPanel.setZhuWeiRed(param1);
         this.zhizhanzhishangPanel.setZhuWeiBlue(param2);
      }
      
      public function setZhuWeiResult(param1:int, param2:int) : void
      {
         if(param2 == 0)
         {
            this.zhizhanzhishangPanel.setZhuWeiRed(param1);
            this.zhizhanzhishangPanel.RedPlay();
         }
         else
         {
            this.zhizhanzhishangPanel.setZhuWeiBlue(param1);
            this.zhizhanzhishangPanel.BluePlay();
         }
      }
      
      public function setHistory(param1:int, param2:int, param3:Array) : void
      {
         this.nowPageNum = param1;
         this.maxPageNum = param2;
         this.nowPageNum_History = param1;
         this.maxPageNum_History = param2;
         this.zhizhanzhishangPanel.setHistory(param1,param2,param3);
      }
      
      public function lingqu() : void
      {
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_ZHIZHANZHISHANG_LINGQU,{"fun":this.msgSenderProxy.send_59007});
      }
   }
}

