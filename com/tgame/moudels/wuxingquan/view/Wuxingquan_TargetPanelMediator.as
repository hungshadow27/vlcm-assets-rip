package com.tgame.moudels.wuxingquan.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.wuxingquan.Wuxingquan_ApplicationFacade;
   import com.tgame.moudels.wuxingquan.model.Wuxingquan_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Wuxingquan_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Wuxingquan_TargetPanelMediator";
      
      private var _senderProxy:Wuxingquan_MsgSenderProxy;
      
      public function Wuxingquan_TargetPanelMediator()
      {
         super(NAME,null);
      }
      
      private function get senderProxy() : Wuxingquan_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Wuxingquan_MsgSenderProxy.NAME) as Wuxingquan_MsgSenderProxy;
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
         switch(param1.getName())
         {
            case Wuxingquan_ApplicationFacade.REFRESH_WUXINGQUAN_INFO:
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
            targetArrtibutePlane.addEventListener(TargetAttribute.WUXINGQUAN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.WUXINGQUAN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         Wuxingquan_PlaneMediator.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_54307(GameInstance.lookPlayerID);
      }
      
      public function initTargetWXQPanel(param1:Array, param2:Skill, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean) : void
      {
         this.targetArrtibutePlane.showWuXingQuan();
         this.targetArrtibutePlane.setInitializeWxq(param1,param2,param3,param4,param5,param6);
         this.targetArrtibutePlane.setWuXingQuanEnabledFun();
         this.targetArrtibutePlane.setWuXingQuanJiHuo(GameState.dictTargetStatus[40634],GameState.dictTargetStatus[40737]);
         this.targetArrtibutePlane.set_WuXingQuan(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

