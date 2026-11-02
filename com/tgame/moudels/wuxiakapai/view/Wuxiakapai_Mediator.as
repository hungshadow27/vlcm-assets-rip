package com.tgame.moudels.wuxiakapai.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.character.BaseCharacter;
   import com.tgame.common.vo.character.info.AvatarInfo;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.wuxiakapai.Wuxiakapai_ApplicationFacade;
   import com.tgame.moudels.wuxiakapai.model.Wuxiakapai_MsgSendProxy;
   import com.tgame.shell.view.components.WuxiakapaiPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Wuxiakapai_Mediator extends Mediator
   {
      
      public static const NAME:String = "Wuxiakapai_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var play:int = -1;
      
      private var _senderProxy:Wuxiakapai_MsgSendProxy;
      
      public function Wuxiakapai_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Wuxiakapai_ApplicationFacade.REQUEST_WUXIAKAPAI];
      }
      
      private function get senderProxy() : Wuxiakapai_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Wuxiakapai_MsgSendProxy.NAME) as Wuxiakapai_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:Object = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Wuxiakapai_ApplicationFacade.REQUEST_WUXIAKAPAI:
               this.play = int(_loc2_);
               this.senderProxy.send_74241(_loc2_);
               _loc3_ = [];
               _loc4_ = 0;
               while(_loc4_ < 3)
               {
                  _loc5_ = new Object();
                  _loc5_.id = 1001 + _loc4_;
                  _loc5_.name = LanResManager.getLanCommonTextWords("卡牌名称") + _loc4_;
                  _loc3_.push(_loc5_);
                  _loc4_++;
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : WuxiakapaiPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.wuxiakapaiPanel);
         }
         return viewComponent as WuxiakapaiPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(WuxiakapaiPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,onHandle);
            panel.addEventListener(WuxiakapaiPanel.UI_WUXIAKAPAI_DUIHUAN_CLICK,onHandle);
            panel.addEventListener(WuxiakapaiPanel.UI_WUXIAKAPAI_LIST_CLICK,onHandle);
            panel.addEventListener(WuxiakapaiPanel.UI_WUXIAKAPAI_WAIXIAN_CLICK,onHandle);
            panel.addEventListener(WuxiakapaiPanel.UI_WUXIAKAPAI_XIANGXI_CLICK,onHandle);
            panel.addEventListener(WuxiakapaiPanel.UI_WUXIAKAPAI_YIJIANDUIHUAN_CLICK,onHandle);
            panel.addEventListener(WuxiakapaiPanel.UI_WUXIAKAPAIXIANGXI_GUANBI_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(WuxiakapaiPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,onHandle);
            panel.removeEventListener(WuxiakapaiPanel.UI_WUXIAKAPAI_DUIHUAN_CLICK,onHandle);
            panel.removeEventListener(WuxiakapaiPanel.UI_WUXIAKAPAI_LIST_CLICK,onHandle);
            panel.removeEventListener(WuxiakapaiPanel.UI_WUXIAKAPAI_WAIXIAN_CLICK,onHandle);
            panel.removeEventListener(WuxiakapaiPanel.UI_WUXIAKAPAI_XIANGXI_CLICK,onHandle);
            panel.removeEventListener(WuxiakapaiPanel.UI_WUXIAKAPAI_YIJIANDUIHUAN_CLICK,onHandle);
            panel.removeEventListener(WuxiakapaiPanel.UI_WUXIAKAPAIXIANGXI_GUANBI_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         var _loc6_:AvatarInfo = null;
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case WuxiakapaiPanel.UI_WUXIAKAPAI_DUIHUAN_CLICK:
               this.senderProxy.send_74249(param1.data);
               break;
            case WuxiakapaiPanel.UI_WUXIAKAPAI_LIST_CLICK:
               _loc3_ = -1;
               _loc4_ = 4;
               _loc5_ = [];
               _loc7_ = 0;
               while(_loc7_ < _loc4_)
               {
                  _loc8_ = new Object();
                  _loc8_.id = _loc7_ + 1;
                  _loc8_.name = LanResManager.getLanCommonTextWords("名稱") + _loc7_;
                  _loc8_.state = _loc7_ % 2;
                  _loc8_.imgID = 1001;
                  _loc8_.lv = 2;
                  _loc5_.push(_loc8_);
                  _loc7_++;
               }
               this.senderProxy.send_74243([param1.data,this.play]);
               break;
            case WuxiakapaiPanel.UI_WUXIAKAPAI_WAIXIAN_CLICK:
               _loc6_ = (GameInstance.mainChar.data as BaseCharacter).avatarInfo;
               _loc5_ = param1.data as Array;
               this.senderProxy.send_74251(param1.data);
               break;
            case WuxiakapaiPanel.UI_WUXIAKAPAI_XIANGXI_CLICK:
               this.panel.onShowLv(true);
               this.senderProxy.send_74245([param1.data,this.play]);
               break;
            case WuxiakapaiPanel.UI_WUXIAKAPAI_YIJIANDUIHUAN_CLICK:
               this.senderProxy.send_74247(param1.data);
               break;
            case WuxiakapaiPanel.UI_WUXIAKAPAIXIANGXI_GUANBI_CLICK:
               this.panel.onShowLv(false);
         }
      }
      
      public function setLeft(param1:Array, param2:String) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_WUXIAKAPAI_PANEL);
         }
         this.panel.setLeft(param1,param2);
         this.senderProxy.send_74243([param1[0].id,this.play]);
      }
      
      public function setRight(param1:int, param2:Array) : void
      {
         this.play = param1;
         this.panel.setRight(param2,param1);
      }
      
      public function setXiangxi(param1:int, param2:int, param3:int, param4:int, param5:String, param6:String, param7:String, param8:String, param9:int, param10:int, param11:int) : void
      {
         this.play = param1;
         this.panel.setXiangxi(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
   }
}

