package com.tgame.moudels.aojianshenjiangji.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.aojianshenjiangji.model.AoJianShenJiangJi_MsgSenderProxy;
   import com.tgame.moudels.aojianshenjiangji.model.info.AoJianShenJiangJiVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class AoJianShenJiangJi_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "AoJianShenJiangJi_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var index:int = 0;
      
      private var _senderProxy:AoJianShenJiangJi_MsgSenderProxy;
      
      public function AoJianShenJiangJi_TargetPanelMediator()
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
      
      protected function get targetArrtibutePlane() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
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
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.addEventListener(TargetAttribute.AOJIANSHENJIANGJI,tragetAttributeHandler);
            targetArrtibutePlane.addEventListener(TargetAttribute.UI_AOJIANSHENJIANGJI_QIEHUAN_CLICK,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.AOJIANSHENJIANGJI,tragetAttributeHandler);
            targetArrtibutePlane.removeEventListener(TargetAttribute.UI_AOJIANSHENJIANGJI_QIEHUAN_CLICK,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case TargetAttribute.AOJIANSHENJIANGJI:
               this.senderProxy.send_74061([GameInstance.lookPlayerID,0]);
               break;
            case TargetAttribute.UI_AOJIANSHENJIANGJI_QIEHUAN_CLICK:
               this.index = _loc2_.data as int;
               this.senderProxy.send_74061([GameInstance.lookPlayerID,this.index]);
         }
      }
      
      public function setPanel(param1:int, param2:AoJianShenJiangJiVO) : void
      {
         var arr:Array;
         var newArr:Array;
         var i:int;
         var sortOnResPosition:Function = null;
         var go:Goods = null;
         var lookingID:int = param1;
         var vo:AoJianShenJiangJiVO = param2;
         sortOnResPosition = function(param1:Goods, param2:Goods):int
         {
            var _loc3_:int = param1.res.position;
            var _loc4_:int = param2.res.position;
            if(_loc3_ < _loc4_)
            {
               return -1;
            }
            if(_loc3_ > _loc4_)
            {
               return 1;
            }
            return 0;
         };
         if(this.lookPlayerID != lookingID)
         {
            return;
         }
         this.targetArrtibutePlane.showAoJianShenJiangJi();
         this.targetArrtibutePlane.setAoJianShenJiangJiInit(vo);
         this.targetArrtibutePlane.setAoJianShenJiangJiEnableFun();
         arr = GameInstance.lookPlayerData.goodsInfo.goodsBagArr;
         newArr = [];
         i = 0;
         while(i < arr.length)
         {
            go = arr[i] as Goods;
            if(go.res.position > 11000 && go.res.position < 12000)
            {
               newArr.push(go);
            }
            i++;
         }
         newArr.sort(sortOnResPosition);
         this.targetArrtibutePlane.set_AoJianShenJiangJi(newArr);
         this.targetArrtibutePlane.set_MingJiaoZhangWuJi(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

