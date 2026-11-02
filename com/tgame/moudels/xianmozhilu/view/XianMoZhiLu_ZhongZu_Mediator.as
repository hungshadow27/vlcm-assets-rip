package com.tgame.moudels.xianmozhilu.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xianmozhilu.XianMoZhiLu_ApplicationFacade;
   import com.tgame.moudels.xianmozhilu.model.XianMoZhiLu_MsgSenderProxy;
   import com.tgame.shell.view.components.xianmozhilu.ZhongZuJieMianPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XianMoZhiLu_ZhongZu_Mediator extends Mediator
   {
      
      public static const NAME:String = "XianMoZhiLu_ZhongZu_Mediator";
      
      private var _senderProxy:XianMoZhiLu_MsgSenderProxy;
      
      public function XianMoZhiLu_ZhongZu_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : XianMoZhiLu_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XianMoZhiLu_MsgSenderProxy.NAME) as XianMoZhiLu_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [XianMoZhiLu_ApplicationFacade.GET_ZHONGZU_PANEL,XianMoZhiLu_ApplicationFacade.GOODS_CHANGED];
      }
      
      public function get panel() : ZhongZuJieMianPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xianmozhilu_zhongzu_Panel);
         }
         return viewComponent as ZhongZuJieMianPanel;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case XianMoZhiLu_ApplicationFacade.GET_ZHONGZU_PANEL:
               switch(_loc2_ as int)
               {
                  case 1:
                     PipeManager.sendMsg(PipeConstants.SHOW_ZHONGZU_PLANE);
                     break;
                  case 2:
                     PipeManager.sendMsg(PipeConstants.SHOW_ZHONGZU_PLANE);
                     this.senderProxy.send_80491();
                     break;
                  case 3:
                     PipeManager.sendMsg(PipeConstants.SHOW_ZHONGZU_PLANE);
                     this.senderProxy.send_80941();
                     break;
                  case 4:
                     PipeManager.sendMsg(PipeConstants.SHOW_ZHONGZU_PLANE);
                     this.senderProxy.send_81101();
                     break;
                  case 5:
                     PipeManager.sendMsg(PipeConstants.SHOW_ZHONGZU_PLANE);
                     this.senderProxy.send_81321();
               }
               break;
            case XianMoZhiLu_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(GameInstance.uiInstance._xianmozhilu_zhongzu_Panel))
               {
                  this.panel.setGoodsChangeHandler();
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ZhongZuJieMianPanel,function():void
         {
            panel.addEventListener(ZhongZuJieMianPanel.UI_ZHONGZUJIEMIAN,handler);
            panel.addEventListener(ZhongZuJieMianPanel.UI_ZHONGZUJIEMIAN_WAIXIAN_CLICK,handler);
            panel.addEventListener(ZhongZuJieMianPanel.UI_ZHONGZUJIEMIAN_YICHU_CLICK,handler);
            panel.addEventListener(ZhongZuJieMianPanel.UI_ZHONGZUJIEMIAN_MENU_SHOW,handler);
            panel.addEventListener(ZhongZuJieMianPanel.UI_XIANMOJUEXING,handler);
            panel.addEventListener(ZhongZuJieMianPanel.UI_XIANMOJUEXING_SHENGJIE,handler);
            panel.addEventListener(ZhongZuJieMianPanel.UI_XIANMOTIANJI,handler);
            panel.addEventListener(ZhongZuJieMianPanel.UI_XIANMOTIANJI_SHENGJIE,handler);
            panel.addEventListener(ZhongZuJieMianPanel.UI_XIANMOTIANWEN,handler);
            panel.addEventListener(ZhongZuJieMianPanel.UI_XIANMOTIANWEN_SHENGJIE,handler);
            panel.addEventListener(ZhongZuJieMianPanel.UI_XIANMOTIANRUI,handler);
            panel.addEventListener(ZhongZuJieMianPanel.UI_XIANMOTIANRUI_SHENGJIE,handler);
            panel.addEventListener(ZhongZuJieMianPanel.UI_XIANMOTIANRUI_GOUXUAN,handler);
            panel.addEventListener(ZhongZuJieMianPanel.XIANMOZHILU_JIHUO_SHOW,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ZhongZuJieMianPanel,function():void
         {
            panel.removeEventListener(ZhongZuJieMianPanel.UI_ZHONGZUJIEMIAN,handler);
            panel.removeEventListener(ZhongZuJieMianPanel.UI_ZHONGZUJIEMIAN_WAIXIAN_CLICK,handler);
            panel.removeEventListener(ZhongZuJieMianPanel.UI_ZHONGZUJIEMIAN_YICHU_CLICK,handler);
            panel.removeEventListener(ZhongZuJieMianPanel.UI_ZHONGZUJIEMIAN_MENU_SHOW,handler);
            panel.removeEventListener(ZhongZuJieMianPanel.UI_XIANMOJUEXING,handler);
            panel.removeEventListener(ZhongZuJieMianPanel.UI_XIANMOJUEXING_SHENGJIE,handler);
            panel.removeEventListener(ZhongZuJieMianPanel.UI_XIANMOTIANJI,handler);
            panel.removeEventListener(ZhongZuJieMianPanel.UI_XIANMOTIANJI_SHENGJIE,handler);
            panel.removeEventListener(ZhongZuJieMianPanel.UI_XIANMOTIANWEN,handler);
            panel.removeEventListener(ZhongZuJieMianPanel.UI_XIANMOTIANWEN_SHENGJIE,handler);
            panel.removeEventListener(ZhongZuJieMianPanel.UI_XIANMOTIANRUI,handler);
            panel.removeEventListener(ZhongZuJieMianPanel.UI_XIANMOTIANRUI_SHENGJIE,handler);
            panel.removeEventListener(ZhongZuJieMianPanel.UI_XIANMOTIANRUI_GOUXUAN,handler);
            panel.removeEventListener(ZhongZuJieMianPanel.XIANMOZHILU_JIHUO_SHOW,handler);
         });
      }
      
      private function handler(param1:*) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         switch(param1.type)
         {
            case ZhongZuJieMianPanel.UI_ZHONGZUJIEMIAN:
               this.senderProxy.send_80463();
               break;
            case ZhongZuJieMianPanel.UI_ZHONGZUJIEMIAN_WAIXIAN_CLICK:
               this.senderProxy.send_80465(param1.data as int);
               break;
            case ZhongZuJieMianPanel.UI_ZHONGZUJIEMIAN_YICHU_CLICK:
               this.senderProxy.send_80467();
               break;
            case ZhongZuJieMianPanel.UI_ZHONGZUJIEMIAN_MENU_SHOW:
               PipeManager.sendMsg(PipeConstants.UI_CHAR_ATTRIBUTE_MENU_SHOW,param1 as BaseEvent);
               break;
            case ZhongZuJieMianPanel.UI_XIANMOJUEXING:
               this.senderProxy.send_80491();
               break;
            case ZhongZuJieMianPanel.UI_XIANMOJUEXING_SHENGJIE:
               this.senderProxy.send_80493();
               break;
            case ZhongZuJieMianPanel.UI_XIANMOTIANJI:
               this.senderProxy.send_80941();
               break;
            case ZhongZuJieMianPanel.UI_XIANMOTIANJI_SHENGJIE:
               this.senderProxy.send_80943();
               break;
            case ZhongZuJieMianPanel.UI_XIANMOTIANWEN:
               this.senderProxy.send_81101();
               break;
            case ZhongZuJieMianPanel.UI_XIANMOTIANWEN_SHENGJIE:
               this.senderProxy.send_81103();
               break;
            case ZhongZuJieMianPanel.UI_XIANMOTIANRUI:
               this.senderProxy.send_81321();
               break;
            case ZhongZuJieMianPanel.UI_XIANMOTIANRUI_SHENGJIE:
               this.senderProxy.send_81323();
               break;
            case ZhongZuJieMianPanel.UI_XIANMOTIANRUI_GOUXUAN:
               this.senderProxy.send_81325(param1.data as int);
               break;
            case ZhongZuJieMianPanel.XIANMOZHILU_JIHUO_SHOW:
               _loc2_ = param1.data as Array;
               _loc3_ = Boolean(_loc2_[0]);
               _loc4_ = int(_loc2_[1]);
               if(_loc3_)
               {
                  this.senderProxy.send_73005([1,_loc4_]);
               }
               else
               {
                  this.senderProxy.send_73005([0,_loc4_]);
               }
         }
      }
      
      public function setPanel(param1:Object) : void
      {
         this.panel.setPanel(param1);
         this.panel.setCurrIndexView(1);
      }
      
      public function setjieChu(param1:Boolean) : void
      {
         if(param1)
         {
            this.panel.onClose();
         }
      }
      
      public function setXianMoJueXingData(param1:Object) : void
      {
         this.panel.setXianMoJueXingData(param1);
         this.panel.setCurrIndexView(2);
      }
      
      public function setXianMoTianJiData(param1:Object) : void
      {
         this.panel.setXianMoTianJiData(param1);
         this.panel.setCurrIndexView(3);
      }
      
      public function setXianMoTianWenData(param1:Object) : void
      {
         this.panel.setXianMoTianWenData(param1);
         this.panel.setCurrIndexView(4);
      }
      
      public function setXianMoTianRuiData(param1:Object) : void
      {
         this.panel.setXianMoTianRuiData(param1);
         this.panel.setCurrIndexView(5);
      }
   }
}

