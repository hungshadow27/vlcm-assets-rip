package com.tgame.moudels.jiuyinzhenjing.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.JiuYangShenGong.JiuYangShenGong_ApplicationFacade;
   import com.tgame.moudels.jiuyinzhenjing.model.JiuYinZhenJing_MsgSenderProxy;
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
   
   public class JiuYinZhenJing_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "JiuYinZhenJing_TargetPanelMediator";
      
      private var _senderProxy:JiuYinZhenJing_MsgSenderProxy;
      
      private var avatar_zizeng:int = 0;
      
      public function JiuYinZhenJing_TargetPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : JiuYinZhenJing_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(JiuYinZhenJing_MsgSenderProxy.NAME) as JiuYinZhenJing_MsgSenderProxy;
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
            case JiuYangShenGong_ApplicationFacade.REFRESH_JIUYANGSHENGONG_INFO:
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
            targetArrtibutePlane.addEventListener(TargetAttribute.JIUYINZHENJING,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.JIUYINZHENJING,tragetAttributeHandler);
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
            targetArrtibutePlane.setDuguJiujianAvatarJ(param2);
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
         this.targetArrtibutePlane.setDuguJiujianAvatarJ(null);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar(goodsID + "_" + ++this.avatar_zizeng,callBack,apdArr,0,CharStatusType.SIT);
      }
      
      private function dugujiujianPlaneHandle(param1:Event) : void
      {
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         JiuYinZhenJing_PlaneMediator.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_54107(GameInstance.lookPlayerID);
      }
      
      public function initTargetDuguPanel(param1:Array, param2:int, param3:String, param4:int, param5:int, param6:Boolean) : void
      {
         this.targetArrtibutePlane.showJiuyinzhenjing();
         this.targetArrtibutePlane.setJiuyinzhenjingInitialize(param1);
         var _loc7_:Skill = new Skill(param2);
         if(param4 == 1)
         {
            _loc7_.isLearn = 1;
         }
         this.targetArrtibutePlane.setJiuyinzhenjingBuff(_loc7_,param3,param4);
         this.targetArrtibutePlane.setJiuyinzhenjingQiu(param5);
         this.targetArrtibutePlane.setJiuyinzhenjingEnabledFun();
         this.targetArrtibutePlane.isHuanZHuang(param6);
         this.targetArrtibutePlane.set_DuGuJiuJian(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
      
      public function setDuguJiujianAvatar(param1:BitmapData) : void
      {
      }
      
      public function setDugujiujianMc(param1:int) : void
      {
      }
      
      public function setJiujianEnabledFun() : void
      {
      }
      
      public function setJihuo(param1:Boolean) : void
      {
         this.targetArrtibutePlane.setJiuYangJihuo(param1);
      }
   }
}

