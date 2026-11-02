package com.tgame.moudels.aojianshenjiangji.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.aojianshenjiangji.AoJianShenJiangJi_ApplicationFacade;
   import com.tgame.moudels.aojianshenjiangji.model.AoJianShenJiangJi_MsgSenderProxy;
   import com.tgame.moudels.aojianshenjiangji.model.info.AoJianShenJiangJiVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class AoJianShenJiangJi_Mediator extends Mediator
   {
      
      public static const NAME:String = "AoJianShenJiangJi_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var index:int = 0;
      
      private var vo:AoJianShenJiangJiVO;
      
      private var _senderProxy:AoJianShenJiangJi_MsgSenderProxy;
      
      public function AoJianShenJiangJi_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : AoJianShenJiangJi_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(AoJianShenJiangJi_MsgSenderProxy.NAME) as AoJianShenJiangJi_MsgSenderProxy;
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
         return [AoJianShenJiangJi_ApplicationFacade.GOODS_CHANGED];
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.AOJIANSHENJIANGJI,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_AOJIANSHENJIANGJI_QIEHUAN_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.AOJIANSHENJIANGJI,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_AOJIANSHENJIANGJI_QIEHUAN_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               this.mainCharArrtibutePlane.aojianshenjiangCl(false);
               break;
            case CharAttribute.AOJIANSHENJIANGJI:
               this.senderProxy.send_74061([-1,0]);
               break;
            case CharAttribute.UI_AOJIANSHENJIANGJI_QIEHUAN_CLICK:
               this.index = _loc2_.data as int;
               this.senderProxy.send_74061([-1,this.index]);
         }
      }
      
      public function setPanel(param1:AoJianShenJiangJiVO) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showAoJianShenJiangJi();
         this.mainCharArrtibutePlane.setAoJianShenJiangJiInit(param1);
         var _loc2_:Array = [];
         var _loc3_:int = 11001;
         while(_loc3_ < 12000)
         {
            if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc3_] != undefined)
            {
               _loc2_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[_loc3_]);
            }
            _loc3_++;
         }
         this.mainCharArrtibutePlane.set_AoJianShenJiangJi(_loc2_);
         var _loc4_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_AOJIANSHENJIANGJI_MINGJIAOJIAOZHU] != undefined)
         {
            _loc4_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_AOJIANSHENJIANGJI_MINGJIAOJIAOZHU]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_AOJIANSHENJIANGJI_TULONGDAO] != undefined)
         {
            _loc4_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_AOJIANSHENJIANGJI_TULONGDAO]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_AOJIANSHENJIANGJI_YITIANJIAN] != undefined)
         {
            _loc4_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_AOJIANSHENJIANGJI_YITIANJIAN]);
         }
         this.mainCharArrtibutePlane.set_MingJiaoZhangWuJi(_loc4_);
      }
   }
}

