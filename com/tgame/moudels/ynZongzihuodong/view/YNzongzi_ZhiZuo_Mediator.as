package com.tgame.moudels.ynZongzihuodong.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.ynZongzihuodong.YNzongzi_ApplicationFacade;
   import com.tgame.moudels.ynZongzihuodong.model.YNzongzi_MsgSenderProxy;
   import com.tgame.shell.view.components.YNzhizuozongziPanel;
   import com.tgame.shell.view.components.ynChunjie2015.YNZongziShuomingPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YNzongzi_ZhiZuo_Mediator extends Mediator
   {
      
      public static const NAME:String = "YNzongzi_ZhiZuo_Mediator";
      
      internal var zongzishuoming:YNZongziShuomingPanel;
      
      public function YNzongzi_ZhiZuo_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function onRemove() : void
      {
      }
      
      override public function listNotificationInterests() : Array
      {
         return [YNzongzi_ApplicationFacade.NPC_REQ_FUNCTION,YNzongzi_ApplicationFacade.GOODS_CHANGED,YNzongzi_ApplicationFacade.YN_SHOW_CHUNJIEHUODONGPANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case YNzongzi_ApplicationFacade.NPC_REQ_FUNCTION:
               _loc3_ = int(_loc2_);
               if(_loc3_ == NpcFunctionType.YUENAN_ZHIZUOZONGZI)
               {
                  if(!Fun.isVisible(GameInstance.uiInstance.ynzhizuozongziPanel))
                  {
                     GameInstance.uiInstance.ynzhizuozongziPanel.x = GameConfig.sceneWidth / 2 - GameInstance.uiInstance.ynzhizuozongziPanel.width / 2;
                     GameInstance.uiInstance.ynzhizuozongziPanel.y = GameConfig.sceneHeight / 2 - GameInstance.uiInstance.ynzhizuozongziPanel.height / 2;
                     GameInstance.uiInstance.uiContainer.addChild(GameInstance.uiInstance.ynzhizuozongziPanel);
                  }
               }
               else if(_loc3_ == NpcFunctionType.YUENAN_ZHIZUOZONGZISHUOMING || _loc3_ == NpcFunctionType.YUENAN_DUILIANSHUOMING)
               {
                  if(this.zongzishuoming == null)
                  {
                     this.zongzishuoming = new YNZongziShuomingPanel();
                  }
                  if(!Fun.isVisible(this.zongzishuoming))
                  {
                     this.zongzishuoming.x = GameConfig.sceneWidth / 2 - this.zongzishuoming.width / 2;
                     this.zongzishuoming.y = GameConfig.sceneHeight / 2 - this.zongzishuoming.height / 2;
                     GameInstance.uiInstance.uiContainer.addChild(this.zongzishuoming);
                  }
                  if(_loc3_ == NpcFunctionType.YUENAN_ZHIZUOZONGZISHUOMING)
                  {
                     this.zongzishuoming.setData(4);
                  }
                  else if(_loc3_ == NpcFunctionType.YUENAN_DUILIANSHUOMING)
                  {
                     this.zongzishuoming.setData(2);
                  }
               }
               else if(_loc3_ == NpcFunctionType.YUENAN_YANGSHUOMING)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_53095,[23]);
               }
               else if(_loc3_ == NpcFunctionType.YUENAN_AIQINGTIANMI)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_53095,[16]);
               }
               else if(_loc3_ == NpcFunctionType.YUENAN_AIQINGYONGJIU)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_53095,[15]);
               }
               else if(_loc3_ == NpcFunctionType.YUENAN_TIANMICHENGHAO)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_53095,[17]);
               }
               else if(_loc3_ == NpcFunctionType.YUENAN_SONGHUAHUODONG)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_QINGRENJIESONGHUA_PLANE,7);
               }
               else if(_loc3_ == NpcFunctionType.YUENAN_CHUNJIELIBAO)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_53095,[18]);
               }
               else if(_loc3_ == NpcFunctionType.YUENAN_CHONGZHILINGJIANG)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_53095,[19]);
               }
               else if(_loc3_ == NpcFunctionType.YUENAN_GOUMAIDAOJU)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_53095,[21]);
               }
               else if(_loc3_ == NpcFunctionType.YUENAN_DUIHUANLIBAO)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_53095,[20]);
               }
               else if(_loc3_ == NpcFunctionType.YUENAN_GOUMAICHAHUA)
               {
                  PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[723280,1]);
               }
               else if(_loc3_ == NpcFunctionType.YUENAN_2016YUANDAN)
               {
                  PipeManager.sendMsg(PipeConstants.SEND_53095,[48]);
               }
               break;
            case YNzongzi_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.panel))
               {
                  this.panel.setInitialize();
               }
               break;
            case YNzongzi_ApplicationFacade.YN_SHOW_CHUNJIEHUODONGPANEL:
               _loc3_ = int(_loc2_);
               if(this.zongzishuoming == null)
               {
                  this.zongzishuoming = new YNZongziShuomingPanel();
               }
               if(!Fun.isVisible(this.zongzishuoming))
               {
                  this.zongzishuoming.x = GameConfig.sceneWidth / 2 - this.zongzishuoming.width / 2;
                  this.zongzishuoming.y = GameConfig.sceneHeight / 2 - this.zongzishuoming.height / 2;
                  GameInstance.uiInstance.uiContainer.addChild(this.zongzishuoming);
               }
               if(_loc3_ == 1)
               {
                  this.zongzishuoming.setData(4);
               }
               else if(_loc3_ == 4)
               {
                  this.zongzishuoming.setData(4);
               }
               else if(_loc3_ == 5)
               {
                  this.zongzishuoming.setData(5);
               }
               else
               {
                  this.zongzishuoming.setData(30 + _loc3_);
               }
         }
      }
      
      public function get panel() : YNzhizuozongziPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.ynzhizuozongziPanel);
         }
         return viewComponent as YNzhizuozongziPanel;
      }
      
      public function get senderProxy() : YNzongzi_MsgSenderProxy
      {
         return facade.retrieveProxy(YNzongzi_MsgSenderProxy.NAME) as YNzongzi_MsgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YNzhizuozongziPanel,function():void
         {
            GameInstance.uiInstance.ynzhizuozongziPanel.addEventListener(Event.ADDED_TO_STAGE,panelHandle);
            panel.addEventListener(YNzhizuozongziPanel.UI_LABAJIE_ZHIZUO_CLICK,panelHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNzhizuozongziPanel,function():void
         {
            GameInstance.uiInstance.ynzhizuozongziPanel.removeEventListener(Event.ADDED_TO_STAGE,panelHandle);
            panel.removeEventListener(YNzhizuozongziPanel.UI_LABAJIE_ZHIZUO_CLICK,panelHandle);
         });
      }
      
      private function panelHandle(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               this.panel.setInitialize();
               this.panel.setTime(-1);
               break;
            case YNzhizuozongziPanel.UI_LABAJIE_ZHIZUO_CLICK:
               this.setTime(3,1);
         }
      }
      
      public function setTime(param1:int, param2:int) : void
      {
         this.panel.setTime(param1,param2);
      }
   }
}

