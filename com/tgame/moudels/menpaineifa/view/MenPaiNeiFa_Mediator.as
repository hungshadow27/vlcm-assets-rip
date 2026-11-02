package com.tgame.moudels.menpaineifa.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.menpaineifa.MenPaiNeiFa_ApplicationFacade;
   import com.tgame.moudels.menpaineifa.model.MenPaiNeiFa_MsgSendProxy;
   import com.tgame.moudels.menpaineifa.model.info.MenPaiNeiFaVo;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.MenPaiNeiFa;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class MenPaiNeiFa_Mediator extends Mediator
   {
      
      public static const NAME:String = "MenPaiNeiFa_Mediator";
      
      public var isJDreturn:Boolean = false;
      
      private var menpai:int = 0;
      
      private var _senderProxy:MenPaiNeiFa_MsgSendProxy;
      
      private var isOpen:Boolean;
      
      public function MenPaiNeiFa_Mediator()
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [MenPaiNeiFa_ApplicationFacade.SHOW_MENPAIJUEXUE_PANEL,MenPaiNeiFa_ApplicationFacade.UI_MENPAIJUEXUE_SKILL_DRAG];
      }
      
      private function get senderProxy() : MenPaiNeiFa_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(MenPaiNeiFa_MsgSendProxy.NAME) as MenPaiNeiFa_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:ItemFace = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case MenPaiNeiFa_ApplicationFacade.SHOW_MENPAIJUEXUE_PANEL:
               this.senderProxy.send_81441([-1,0]);
               break;
            case MenPaiNeiFa_ApplicationFacade.UI_MENPAIJUEXUE_SKILL_DRAG:
               _loc3_ = _loc2_ as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = _loc3_;
                  TCursorManager.showItem(_loc3_.itemBD);
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : MenPaiNeiFa
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.menpaineifaPanel);
         }
         return viewComponent as MenPaiNeiFa;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(MenPaiNeiFa,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.addEventListener(MenPaiNeiFa.UI_MENPAIJUEXUE,onHandle);
            panel.addEventListener(MenPaiNeiFa.UI_MENPAIJUEXUE_JINENG_CLICK,onHandle);
            panel.addEventListener(MenPaiNeiFa.UI_MENPAIJUEXUE_XIULIAN_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MenPaiNeiFa,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.removeEventListener(MenPaiNeiFa.UI_MENPAIJUEXUE,onHandle);
            panel.removeEventListener(MenPaiNeiFa.UI_MENPAIJUEXUE_JINENG_CLICK,onHandle);
            panel.removeEventListener(MenPaiNeiFa.UI_MENPAIJUEXUE_XIULIAN_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            GameInstance.uiInstance.charAttribute.addEventListener(CharAttribute.MENPAINEIFA,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            GameInstance.uiInstance.charAttribute.removeEventListener(CharAttribute.MENPAINEIFA,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               break;
            case CharAttribute.MENPAINEIFA:
               this.isOpen = Boolean(param1.data as int);
               this.senderProxy.send_81441([-1,0]);
               break;
            case MenPaiNeiFa.UI_MENPAIJUEXUE_JINENG_CLICK:
               this.menpai = param1.data as int;
               this.senderProxy.send_81443(this.menpai);
               break;
            case MenPaiNeiFa.UI_MENPAIJUEXUE_XIULIAN_CLICK:
               this.senderProxy.send_81445();
               break;
            case MenPaiNeiFa.UI_MENPAIJUEXUE:
               _loc2_ = param1.data as int;
               _loc3_ = [-1,_loc2_];
               this.senderProxy.send_81441(_loc3_);
         }
      }
      
      public function setPanel(param1:MenPaiNeiFaVo) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            this.panel.x = (GameConfig.sceneWidth - this.panel.width) / 2;
            this.panel.y = (GameConfig.sceneHeight - this.panel.height) / 2;
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
         }
         if(this.isOpen)
         {
            GameInstance.uiInstance.charAttribute.showMenPaiNeiFa();
         }
         this.panel.setPanel(param1);
      }
      
      public function setSkillPanel(param1:int) : void
      {
         this.panel.setSkillPanel(this.menpai,param1);
      }
   }
}

