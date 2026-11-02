package com.tgame.moudels.zixiashengong.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.zixiashengong.ZiXia_ApplicationFacade;
   import com.tgame.moudels.zixiashengong.model.ZiXia_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ZiXia_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "ZiXia_TargetPanelMediator";
      
      private var _senderProxy:ZiXia_MsgSenderProxy;
      
      private var avatar_zizeng:int = 0;
      
      public function ZiXia_TargetPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : ZiXia_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(ZiXia_MsgSenderProxy.NAME) as ZiXia_MsgSenderProxy;
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
            case ZiXia_ApplicationFacade.REFRESH_ZIXIASHENGONG_INFO:
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
            targetArrtibutePlane.addEventListener(TargetAttribute.ZIXIASHENGONG,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.ZIXIASHENGONG,tragetAttributeHandler);
         });
      }
      
      private function setAvatar(param1:int, param2:int) : void
      {
         var apd:AvatarParamData = null;
         var callBack:Function = null;
         var sex:int = 0;
         var goodsID:int = param1;
         var menpai:int = param2;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != goodsID + "_" + avatar_zizeng)
            {
               return;
            }
            targetArrtibutePlane.setZiXiaShenGongAvatar(param2);
         };
         var apdArr:Array = [];
         if(goodsID == 0)
         {
            sex = PartyType.getSexByParty(menpai);
            if(sex == 1)
            {
               apd = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BORN_1),AvatarPartType.BODY);
            }
            else
            {
               apd = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BORN_0),AvatarPartType.BODY);
            }
         }
         else
         {
            apd = new AvatarParamData(ResPathManager.getAvatarPath_Clothes(ResPathManager.AVATAR_CLOTHES,new Goods(goodsID).res.id_m),AvatarPartType.BODY);
         }
         apdArr.push(apd);
         this.targetArrtibutePlane.setZiXiaShenGongAvatar(null);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar(goodsID + "_" + ++this.avatar_zizeng,callBack,apdArr,0,CharStatusType.SIT);
      }
      
      private function dugujiujianPlaneHandle(param1:Event) : void
      {
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         ZiXia_PlaneMediator.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_57387(GameInstance.lookPlayerID);
      }
      
      public function setZuoQi(param1:Boolean, param2:Boolean) : void
      {
         this.targetArrtibutePlane.setZuoQiDaZuo(param1,param2);
      }
      
      public function initTargetDuguPanel(param1:Boolean, param2:Array, param3:Array, param4:int, param5:int, param6:int, param7:Boolean, param8:int) : void
      {
         this.targetArrtibutePlane.showZixiashengong();
         if(param4 > 12)
         {
            param4 = 12;
         }
         if(param4 - 1 <= 0)
         {
            param4 = 1;
         }
         this.targetArrtibutePlane.setZiXiaShenGongInitialize(param3,param4 - 1);
         this.targetArrtibutePlane.setZiXiaShenGongShuxingNum(param1,param2,param7,param8);
         this.setAvatar(param6,param5);
         this.targetArrtibutePlane.setZiXiaShenGongMc(param4);
         this.targetArrtibutePlane.setZiXiaShenGongEnabledFun();
         this.targetArrtibutePlane.setZiXiaCheckEnabledFun();
      }
   }
}

