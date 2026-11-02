package com.tgame.moudels.tianshanliuyangzhang.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.tianshanliuyangzhang.model.TianShanLiuYangZhang_MsgSenderProxy;
   import com.tgame.moudels.tianshanliuyangzhang.model.info.TianShanLiuYangZhangVo;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TianShanLiuYangZhang_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "TianShanLiuYangZhang_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:TianShanLiuYangZhang_MsgSenderProxy;
      
      private var avatar_zizeng:int = 0;
      
      public function TianShanLiuYangZhang_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : TianShanLiuYangZhang_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(TianShanLiuYangZhang_MsgSenderProxy.NAME) as TianShanLiuYangZhang_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.TIANSHANLIUYANGZHANG,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.TIANSHANLIUYANGZHANG,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_73901([GameInstance.lookPlayerID,0]);
      }
      
      public function setPanel(param1:int, param2:TianShanLiuYangZhangVo) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showTianShanLiuYangZhang();
         this.targetArrtibutePlane.setTianShanLiuYangZhangInit(param2);
         this.targetArrtibutePlane.setTianShanLiuYangZhangEnableFun();
         this.setAvatar(param2.resId,param2.menpai);
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
            targetArrtibutePlane.setTianShanLiuYangZhangAvatar(param2);
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
         this.targetArrtibutePlane.setTianShanLiuYangZhangAvatar(null);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar(goodsID + "_" + ++this.avatar_zizeng,callBack,apdArr,0,CharStatusType.SIT);
      }
   }
}

