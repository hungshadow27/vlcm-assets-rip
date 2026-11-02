package com.tgame.moudels.fuWenKeHua.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.fuWenKeHua.model.FuWenKeHua_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class FuWenKeHua_Mediator extends Mediator
   {
      
      public static const NAME:String = "FuWenKeHua_Mediator";
      
      private var _senderProxy:FuWenKeHua_MsgSenderProxy;
      
      public function FuWenKeHua_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : FuWenKeHua_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(FuWenKeHua_MsgSenderProxy.NAME) as FuWenKeHua_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get mainCharArrtibutePlane() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
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
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.addEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.FUWENKEHUA,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_FUWENKEHUA_PAGE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_FUWENKEHUA_FUWENXINXI_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_FUWENKEHUA_XIANSHIWAIGUAN_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_FUWENKEHUA_SKILL_DRAG,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.FUWENKEHUA,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_FUWENKEHUA_PAGE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_FUWENKEHUA_FUWENXINXI_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_FUWENKEHUA_XIANSHIWAIGUAN_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_FUWENKEHUA_SKILL_DRAG,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:ItemFace = null;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               break;
            case CharAttribute.FUWENKEHUA:
               this.senderProxy.send_78421([-1,0]);
               break;
            case CharAttribute.UI_FUWENKEHUA_PAGE_CLICK:
               this.senderProxy.send_78421([-1,_loc2_.data as int]);
               break;
            case CharAttribute.UI_FUWENKEHUA_FUWENXINXI_CLICK:
               this.senderProxy.send_78423([-1,_loc2_.data as int]);
               break;
            case CharAttribute.UI_FUWENKEHUA_XIANSHIWAIGUAN_CLICK:
               this.senderProxy.send_78425(_loc2_.data as Array);
               break;
            case CharAttribute.UI_FUWENKEHUA_SKILL_DRAG:
               _loc3_ = _loc2_.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = _loc3_;
                  TCursorManager.showItem(_loc3_.itemBD);
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
         }
      }
      
      public function upDataPanel(param1:int, param2:int, param3:Array, param4:int, param5:int, param6:int) : void
      {
         this.mainCharArrtibutePlane.showFuWenKeHua();
         this.mainCharArrtibutePlane.initFuWenKeHuaPanel(param1,param2,param3,param4,param5,param6);
      }
      
      public function setFuWenData(param1:int, param2:int, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:int = 0, param9:int = 0) : void
      {
         this.mainCharArrtibutePlane.setFuWenData(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
   }
}

