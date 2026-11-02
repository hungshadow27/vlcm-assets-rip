package com.tgame.moudels.attribute.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.vo.character.Player;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.attribute.model.Attribute_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import flash.events.Event;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ZhanQi_Mediator extends Mediator
   {
      
      public static const NAME:String = "ZhanQi_Mediator";
      
      private var _senderProxy:Attribute_MsgSenderProxy;
      
      public function ZhanQi_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : Attribute_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Attribute_MsgSenderProxy.NAME) as Attribute_MsgSenderProxy;
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
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETZHANQI,mainCharArrtibutePlaneHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETZHANQI,mainCharArrtibutePlaneHandle);
         });
      }
      
      private function mainCharArrtibutePlaneHandle(param1:Event) : void
      {
         var _loc3_:Player = null;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case CharAttribute.GETZHANQI:
               _loc3_ = GameInstance.mainCharData;
               this.setShowItem(_loc3_.goodsInfo.goodsBodyArr);
               this.mainCharArrtibutePlane.showZhanqi();
               this.setTotalZhanQi();
               this.senderProxy.send_57501(-1);
         }
      }
      
      public function setShowItem(param1:Array) : void
      {
         this.mainCharArrtibutePlane.setZhanqiItems(param1);
      }
      
      public function setTotalZhanQi() : void
      {
         this.mainCharArrtibutePlane.setTotalZhanQi(GameState.dictMainStatus[40626]);
      }
      
      public function isHuanZ(param1:Boolean) : void
      {
         this.mainCharArrtibutePlane.setZhanQiHuanZ(param1);
      }
   }
}

