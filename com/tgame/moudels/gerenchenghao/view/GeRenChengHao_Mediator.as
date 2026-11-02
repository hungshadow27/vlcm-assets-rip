package com.tgame.moudels.gerenchenghao.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.gerenchenghao.model.GeRenChengHao_MsgSenderProxy;
   import com.tgame.shell.view.components.GeRenChengHao;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class GeRenChengHao_Mediator extends Mediator
   {
      
      public static const NAME:String = "GeRenChengHao_Mediator";
      
      private var biaoqianType:int = 1;
      
      private var sqhd:Boolean = false;
      
      private var _senderProxy:GeRenChengHao_MsgSenderProxy;
      
      public function GeRenChengHao_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : GeRenChengHao_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(GeRenChengHao_MsgSenderProxy.NAME) as GeRenChengHao_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get panel() : GeRenChengHao
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.gerenchenghaoPanel);
         }
         return viewComponent as GeRenChengHao;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
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
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(GeRenChengHao,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,handler);
            panel.addEventListener(GeRenChengHao.UI_GERENCHENGHAO_PUTONG_CLICK,handler);
            panel.addEventListener(GeRenChengHao.UI_GERENCHENGHAO_CHENGHAO_XIANSHIYINCANG_CLICK,handler);
            panel.addEventListener(GeRenChengHao.UI_GERENCHENGHAO_ZHUANSHU_CLICK,handler);
            panel.addEventListener(GeRenChengHao.UI_GERENCHENGHAO_QUANPINGTAI_ZHUANSHU_CLICK,handler);
            panel.addEventListener(GeRenChengHao.UI_GERENCHENGHAO_PUTONG_GOUXUAN_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(GeRenChengHao,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,handler);
            panel.removeEventListener(GeRenChengHao.UI_GERENCHENGHAO_PUTONG_CLICK,handler);
            panel.removeEventListener(GeRenChengHao.UI_GERENCHENGHAO_CHENGHAO_XIANSHIYINCANG_CLICK,handler);
            panel.removeEventListener(GeRenChengHao.UI_GERENCHENGHAO_ZHUANSHU_CLICK,handler);
            panel.removeEventListener(GeRenChengHao.UI_GERENCHENGHAO_QUANPINGTAI_ZHUANSHU_CLICK,handler);
            panel.removeEventListener(GeRenChengHao.UI_GERENCHENGHAO_PUTONG_GOUXUAN_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         var _loc5_:Array = null;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case GeRenChengHao.UI_GERENCHENGHAO_PUTONG_CLICK:
               this.senderProxy.send_73201();
               break;
            case GeRenChengHao.UI_GERENCHENGHAO_ZHUANSHU_CLICK:
               this.senderProxy.send_73205();
               break;
            case GeRenChengHao.UI_GERENCHENGHAO_CHENGHAO_XIANSHIYINCANG_CLICK:
               _loc3_ = _loc2_.data as Array;
               this.senderProxy.send_73207(_loc3_);
               break;
            case GeRenChengHao.UI_GERENCHENGHAO_QUANPINGTAI_ZHUANSHU_CLICK:
               _loc4_ = _loc2_.data as int;
               this.senderProxy.send_73209(_loc4_);
               break;
            case GeRenChengHao.UI_GERENCHENGHAO_PUTONG_GOUXUAN_CLICK:
               _loc5_ = _loc2_.data as Array;
               this.senderProxy.send_73211(_loc5_);
         }
      }
      
      public function setPutong(param1:Array, param2:int) : void
      {
         this.panel.setInitialize(param1,param2);
      }
      
      public function setZhuanshu(param1:Array, param2:int) : void
      {
         this.panel.setInitialize(param1,param2);
      }
      
      public function setBiaoQian() : void
      {
         this.senderProxy.send_73201();
         this.panel.setBiaoqian();
      }
      
      public function setQuanTai(param1:Array, param2:int, param3:int, param4:int) : void
      {
         this.panel.setInitialize(param1,param2,param3,param4);
      }
   }
}

