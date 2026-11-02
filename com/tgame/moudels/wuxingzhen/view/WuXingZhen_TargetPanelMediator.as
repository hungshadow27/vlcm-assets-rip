package com.tgame.moudels.wuxingzhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.wuxingzhen.model.WuXingZhen_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class WuXingZhen_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "WuXingZhen_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:WuXingZhen_MsgSenderProxy;
      
      public function WuXingZhen_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : WuXingZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(WuXingZhen_MsgSenderProxy.NAME) as WuXingZhen_MsgSenderProxy;
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
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.addEventListener(TargetAttribute.WUXINGZHEN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.WUXINGZHEN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_59301([GameInstance.lookPlayerID,-1,-1]);
      }
      
      public function setPanel(param1:int, param2:Array, param3:int, param4:int, param5:int, param6:int, param7:int, param8:Boolean, param9:Boolean, param10:Boolean) : void
      {
         this.targetArrtibutePlane.set_ZhuXunzhang(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
         this.targetArrtibutePlane.set_WuXingZhen(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
         this.targetArrtibutePlane.showWuXingZhen();
         this.targetArrtibutePlane.setWuXingZhenInit(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         this.targetArrtibutePlane.setWuXingZhenEnableFun();
         this.targetArrtibutePlane.setWuXingZhenJiHuo(GameState.dictTargetStatus[40711]);
      }
      
      public function setGouXuan(param1:Boolean, param2:Boolean, param3:Boolean, param4:Boolean, param5:Boolean) : void
      {
         this.targetArrtibutePlane.wuxingzhenGouXuan(param1,param2,param3,param4,param5);
      }
   }
}

