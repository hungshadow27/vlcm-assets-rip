package com.tgame.moudels.shendiaoxialv.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.shendiaoxialv.ShenDiaoXiaLv_ApplicationFacade;
   import com.tgame.moudels.shendiaoxialv.model.ShenDiaoXiaLv_MsgSenderProxy;
   import com.tgame.shell.view.components.ShenDiaoXiaLv;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ShenDiaoXiaLv_Mediator extends Mediator
   {
      
      public static const NAME:String = "ShenDiaoXiaLv_Mediator";
      
      private var mySP:int = 0;
      
      private var sqhd:Boolean = false;
      
      private var _senderProxy:ShenDiaoXiaLv_MsgSenderProxy;
      
      public function ShenDiaoXiaLv_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : ShenDiaoXiaLv_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(ShenDiaoXiaLv_MsgSenderProxy.NAME) as ShenDiaoXiaLv_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get panel() : ShenDiaoXiaLv
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.shendiaoPanel);
         }
         return viewComponent as ShenDiaoXiaLv;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ShenDiaoXiaLv_ApplicationFacade.KUAFU_STATUS];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Boolean = false;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case ShenDiaoXiaLv_ApplicationFacade.KUAFU_STATUS:
               _loc3_ = Boolean(_loc2_);
               if(!_loc3_)
               {
                  if(this.sqhd)
                  {
                     POPWindowManager.closeWindow();
                  }
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ShenDiaoXiaLv,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,handler);
            panel.addEventListener(ShenDiaoXiaLv.UI_SHENDIAOXIALV_REFRESHBTN_CLICK,handler);
            panel.addEventListener(ShenDiaoXiaLv.UI_SHENDIAOXIALV_LINGQUBTN_CLICK,handler);
            panel.addEventListener(ShenDiaoXiaLv.UI_SHENDIAOXIALV_TUIHUIUBTN_CLICK,handler);
            panel.addEventListener(ShenDiaoXiaLv.UI_SHENDIAOXIALV_SHENQING_CLICK,handler);
            panel.addEventListener(ShenDiaoXiaLv.UI_SHENDIAOXIALV_SHANGJIAOSUIPIAN_CLICK,handler);
            panel.addEventListener(ShenDiaoXiaLv.UI_SHENDIAOXIALV_PREVIOUS_CLICK,handler);
            panel.addEventListener(ShenDiaoXiaLv.UI_SHENDIAOXIALV_NEXT_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ShenDiaoXiaLv,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,handler);
            panel.removeEventListener(ShenDiaoXiaLv.UI_SHENDIAOXIALV_REFRESHBTN_CLICK,handler);
            panel.removeEventListener(ShenDiaoXiaLv.UI_SHENDIAOXIALV_LINGQUBTN_CLICK,handler);
            panel.removeEventListener(ShenDiaoXiaLv.UI_SHENDIAOXIALV_TUIHUIUBTN_CLICK,handler);
            panel.removeEventListener(ShenDiaoXiaLv.UI_SHENDIAOXIALV_SHENQING_CLICK,handler);
            panel.removeEventListener(ShenDiaoXiaLv.UI_SHENDIAOXIALV_SHANGJIAOSUIPIAN_CLICK,handler);
            panel.removeEventListener(ShenDiaoXiaLv.UI_SHENDIAOXIALV_PREVIOUS_CLICK,handler);
            panel.removeEventListener(ShenDiaoXiaLv.UI_SHENDIAOXIALV_NEXT_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:Array = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               this.senderProxy.send_61021(1);
               break;
            case ShenDiaoXiaLv.UI_SHENDIAOXIALV_REFRESHBTN_CLICK:
               this.senderProxy.send_61021(1);
               break;
            case ShenDiaoXiaLv.UI_SHENDIAOXIALV_SHANGJIAOSUIPIAN_CLICK:
               _loc3_ = _loc2_.data as Array;
               _loc3_.push(this.mySP);
               this.senderProxy.send_61027(_loc3_);
               this.senderProxy.send_61021(1);
               break;
            case ShenDiaoXiaLv.UI_SHENDIAOXIALV_LINGQUBTN_CLICK:
               this.senderProxy.send_61023();
               break;
            case ShenDiaoXiaLv.UI_SHENDIAOXIALV_TUIHUIUBTN_CLICK:
               this.senderProxy.send_61025();
               break;
            case ShenDiaoXiaLv.UI_SHENDIAOXIALV_SHENQING_CLICK:
               _loc4_ = _loc2_.data as Array;
               _loc5_ = int(_loc4_[0]);
               this.mySP = _loc4_[1];
               if(this.mySP != 0)
               {
                  this.mySP = 1;
               }
               this.panel.showshendiaohuodong(_loc5_);
               this.sqhd = true;
               break;
            case ShenDiaoXiaLv.UI_SHENDIAOXIALV_PREVIOUS_CLICK:
               this.senderProxy.send_61021(_loc2_.data);
               break;
            case ShenDiaoXiaLv.UI_SHENDIAOXIALV_NEXT_CLICK:
               this.senderProxy.send_61021(_loc2_.data);
               break;
            case ShenDiaoXiaLv.UI_SHENDIAOXIALV_CLOSE:
               this.sqhd = false;
         }
      }
      
      public function setPanel(param1:Array, param2:int, param3:int, param4:int) : void
      {
         this.panel.setInitialize(param1,param2,param3,param4);
      }
      
      public function upShenQing(param1:int) : void
      {
         if(param1 == 1)
         {
            this.senderProxy.send_61021(1);
         }
      }
   }
}

