package com.tgame.moudels.chixuemozhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.chixuemozhen.model.ChiXueMoZhen_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ChiXueMoZhen_TargetCharPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "ChiXueMoZhen_TargetCharPlaneMediator";
      
      private var lookPlayerID:int;
      
      private var _msgSenderProxy:ChiXueMoZhen_MsgSenderProxy;
      
      private var avatar_zizeng:int = 0;
      
      public function ChiXueMoZhen_TargetCharPlaneMediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : ChiXueMoZhen_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(ChiXueMoZhen_MsgSenderProxy.NAME) as ChiXueMoZhen_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get targetArrtibutePlane() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.addEventListener(TargetAttribute.CHIXUEMOZHEN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.CHIXUEMOZHEN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.msgSenderProxy.send_59751([GameInstance.lookPlayerID,-1]);
      }
      
      public function setChiXueMoZhen(param1:int, param2:int, param3:int, param4:String, param5:int, param6:Array, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean, param13:int, param14:Boolean, param15:int, param16:Boolean, param17:int, param18:Boolean, param19:Boolean, param20:Boolean, param21:Boolean) : void
      {
         this.targetArrtibutePlane.showChiXueMoZhen();
         this.targetArrtibutePlane.set_XSJC(param15);
         this.targetArrtibutePlane.setChiXueMoZhenInit(param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param16,param17,param18,param19,param20,param21);
         this.setAvatar(param2,param1);
         this.targetArrtibutePlane.setChiXueMoZhenEnableFun();
         this.targetArrtibutePlane.set_ChiXueMoZhen(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
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
            targetArrtibutePlane.setChiXueMoZhenAvatar(param2);
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
         this.targetArrtibutePlane.setChiXueMoZhenAvatar(null);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar(goodsID + "_" + ++this.avatar_zizeng,callBack,apdArr,0,CharStatusType.SIT);
      }
   }
}

