package com.tgame.moudels.attribute.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.character.Player;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.attribute.model.Attribute_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import flash.events.Event;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XunzhangMediator extends Mediator
   {
      
      public static const NAME:String = "XunzhangMediator";
      
      private var _senderProxy:Attribute_MsgSenderProxy;
      
      public function XunzhangMediator()
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETWULIZHI,mainCharArrtibutePlaneHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETWULIZHI,mainCharArrtibutePlaneHandle);
         });
      }
      
      private function mainCharArrtibutePlaneHandle(param1:Event) : void
      {
         var _loc3_:Player = null;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case CharAttribute.GETWULIZHI:
               _loc3_ = GameInstance.mainCharData;
               this.setShowItem(_loc3_.goodsInfo.goodsBodyArr);
               this.senderProxy.send_53813(-1);
               this.mainCharArrtibutePlane.showWulizhi();
         }
      }
      
      public function setShowItem(param1:Array) : void
      {
         this.mainCharArrtibutePlane.setWuliItems(param1);
      }
      
      public function setTotalXunzhang(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : void
      {
         this.mainCharArrtibutePlane.setTotalXunzhang(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setXunZhangZuoQi(param1:Boolean) : void
      {
         this.mainCharArrtibutePlane.setXunZhangZuoQi(param1);
      }
   }
}

