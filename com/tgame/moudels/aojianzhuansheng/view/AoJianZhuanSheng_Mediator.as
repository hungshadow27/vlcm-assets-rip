package com.tgame.moudels.aojianzhuansheng.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.aojianzhuansheng.AoJianZhuanSheng_ApplicationFacade;
   import com.tgame.moudels.aojianzhuansheng.model.AoJianZhuanSheng_MsgSenderProxy;
   import com.tgame.shell.view.components.aojianzhuansheng.AoJianZhuanShengPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class AoJianZhuanSheng_Mediator extends Mediator
   {
      
      public static const NAME:String = "AoJianZhuanSheng_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var index:int = 0;
      
      private var _senderProxy:AoJianZhuanSheng_MsgSenderProxy;
      
      private var avatar_zizeng:int = 0;
      
      public function AoJianZhuanSheng_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : AoJianZhuanSheng_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(AoJianZhuanSheng_MsgSenderProxy.NAME) as AoJianZhuanSheng_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get mainCharArrtibutePlane() : AoJianZhuanShengPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.aojianzhuanshengPanel);
         }
         return viewComponent as AoJianZhuanShengPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [AoJianZhuanSheng_ApplicationFacade.SHOW_AOJIANZHUANSHENG];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case AoJianZhuanSheng_ApplicationFacade.SHOW_AOJIANZHUANSHENG:
               this.senderProxy.send_80191();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(AoJianZhuanShengPanel,function():void
         {
            mainCharArrtibutePlane.addEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.addEventListener(AoJianZhuanShengPanel.UI_AOJIANZHUANSHENG_ZHUANSHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(AoJianZhuanShengPanel.UI_AOJIANZHUANSHENG_ZHULING_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(AoJianZhuanShengPanel,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(AoJianZhuanShengPanel.UI_AOJIANZHUANSHENG_ZHUANSHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(AoJianZhuanShengPanel.UI_AOJIANZHUANSHENG_ZHULING_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               break;
            case AoJianZhuanShengPanel.UI_AOJIANZHUANSHENG_ZHUANSHENG_CLICK:
               this.senderProxy.send_80195();
               break;
            case AoJianZhuanShengPanel.UI_AOJIANZHUANSHENG_ZHULING_CLICK:
               this.senderProxy.send_80193();
         }
      }
      
      public function setPanel(param1:String, param2:int, param3:Number, param4:Boolean, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:*, param12:*) : void
      {
         if(!Fun.isVisible(this.mainCharArrtibutePlane))
         {
            this.mainCharArrtibutePlane.x = (GameConfig.sceneWidth - this.mainCharArrtibutePlane.width) / 2;
            this.mainCharArrtibutePlane.y = (GameConfig.sceneHeight - this.mainCharArrtibutePlane.height) / 2;
            GameInstance.uiInstance.uiContainer.addChild(this.mainCharArrtibutePlane);
         }
         this.mainCharArrtibutePlane.setPanel(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10);
         this.setAvatar(param12,param11);
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
            mainCharArrtibutePlane.avatar(param2);
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
         this.mainCharArrtibutePlane.avatar(null);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar(goodsID + "_" + ++this.avatar_zizeng,callBack,apdArr,0,CharStatusType.STAND);
      }
   }
}

