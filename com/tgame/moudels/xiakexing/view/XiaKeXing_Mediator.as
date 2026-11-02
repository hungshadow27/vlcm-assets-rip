package com.tgame.moudels.xiakexing.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xiakexing.model.XiaKeXing_MsgSenderProxy;
   import com.tgame.moudels.xiakexing.model.info.XiaKeXingVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XiaKeXing_Mediator extends Mediator
   {
      
      public static const NAME:String = "XiaKeXing_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var index:int = 0;
      
      private var curZF:int;
      
      private var vo:XiaKeXingVO;
      
      private const MAX_ZHAOSHI_COUNT:int = 7;
      
      private var autoKnowTimer:Timer;
      
      private var _senderProxy:XiaKeXing_MsgSenderProxy;
      
      public function XiaKeXing_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : XiaKeXing_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XiaKeXing_MsgSenderProxy.NAME) as XiaKeXing_MsgSenderProxy;
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.XIAKEXING,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_XIAKEXING_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_XIAKEXING_SKILL_DRAG,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.XIAKEXING,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_XIAKEXING_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_XIAKEXING_SKILL_DRAG,handler);
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
            case CharAttribute.XIAKEXING:
               this.senderProxy.send_73561([-1,0]);
               break;
            case CharAttribute.UI_XIAKEXING_KAISHITISHENG_CLICK:
               this.senderProxy.send_73563();
               break;
            case CharAttribute.UI_XIAKEXING_SKILL_DRAG:
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
      
      public function setPanel(param1:XiaKeXingVO, param2:Array) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showXiaKeXing();
         this.mainCharArrtibutePlane.setXiaKeXingInit(param1,param2);
      }
      
      public function setYanhua() : void
      {
         this.mainCharArrtibutePlane.showlihua();
      }
   }
}

