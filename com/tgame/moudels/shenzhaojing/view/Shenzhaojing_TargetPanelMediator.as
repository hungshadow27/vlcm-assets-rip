package com.tgame.moudels.shenzhaojing.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.character.Player;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.shenzhaojing.info.ShenzhaojingVO;
   import com.tgame.moudels.shenzhaojing.model.Shenzhaojing_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.CharStatusType;
   import flash.display.BitmapData;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Shenzhaojing_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Shenzhaojing_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var avatar_zizeng:int = 0;
      
      private var _senderProxy:Shenzhaojing_MsgSenderProxy;
      
      public function Shenzhaojing_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : Shenzhaojing_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Shenzhaojing_MsgSenderProxy.NAME) as Shenzhaojing_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.SHENZHAOJING,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.SHENZHAOJING,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_57215(GameInstance.lookPlayerID);
      }
      
      public function initializeMainUI(param1:int, param2:ShenzhaojingVO) : void
      {
         var play:Player;
         var sex:int;
         var zhenId:int = 0;
         var huanzhuangArr:Array = null;
         var callBack:Function = null;
         var apdArr:Array = null;
         var lookingID:int = param1;
         var vo:ShenzhaojingVO = param2;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != GameInstance.lookPlayerData.id + "_" + avatar_zizeng)
            {
               return;
            }
            if(param2 != null)
            {
               huanzhuangArr.push(param2);
            }
            if(zhenId < 5)
            {
               SimpleAvatarSynthesizer.synthesisSimpleAvatar(GameInstance.lookPlayerData.id + "_" + ++avatar_zizeng,callBack,apdArr,++zhenId,CharStatusType.ATTACK);
               return;
            }
            vo.renwuArr = huanzhuangArr;
            targetArrtibutePlane.ShenzhaojingInit(vo);
         };
         if(this.lookPlayerID != lookingID)
         {
            return;
         }
         this.targetArrtibutePlane.showShenzhaojing();
         zhenId = 0;
         huanzhuangArr = new Array();
         play = GameInstance.lookPlayerData as Player;
         sex = play.attributeInfo.getSex();
         apdArr = play.avatarInfo.getSimpleAPDList(false,sex,false);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar(GameInstance.lookPlayerData.id + "_" + ++this.avatar_zizeng,callBack,apdArr,zhenId,CharStatusType.ATTACK);
      }
   }
}

