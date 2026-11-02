package com.tgame.moudels.woDeMenPai.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.woDeMenPai.WoDeMenPai_ApplicationFacade;
   import com.tgame.moudels.woDeMenPai.model.WoDeMenPai_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.MainUI;
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
   
   public class WoDeMenPai_Mediator extends Mediator
   {
      
      public static const NAME:String = "WoDeMenPai_Mediator";
      
      private var _senderProxy:WoDeMenPai_MsgSenderProxy;
      
      private var avatar_zizeng:int = 0;
      
      public function WoDeMenPai_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : WoDeMenPai_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(WoDeMenPai_MsgSenderProxy.NAME) as WoDeMenPai_MsgSenderProxy;
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
         return [WoDeMenPai_ApplicationFacade.CLICK_RIGHT];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case WoDeMenPai_ApplicationFacade.CLICK_RIGHT:
               this.senderProxy.send_72109();
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.WODEMENPAI,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUDEMENPAI_CREATE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUDEMENPAI_QIEHUAN_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUDEMENPAI_TUIBIAN_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUDEMENPAI_CHUZHAN_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUDEMENPAI_CHUANGONG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUDEMENPAI_GONGXIAN_OK_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUDEMENPAI_CHAKAN_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.WODEMENPAI,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUDEMENPAI_CREATE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUDEMENPAI_QIEHUAN_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUDEMENPAI_TUIBIAN_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUDEMENPAI_CHUZHAN_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUDEMENPAI_CHUANGONG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUDEMENPAI_GONGXIAN_OK_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUDEMENPAI_CHAKAN_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRegisterEvent(MainUI,function():void
         {
            GameInstance.uiInstance.mainUI.addEventListener(MainUI.MAINUI_FUHUO_BTN_CLICK,mainUIHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MainUI,function():void
         {
            GameInstance.uiInstance.mainUI.removeEventListener(MainUI.MAINUI_FUHUO_BTN_CLICK,mainUIHandler);
         });
      }
      
      private function mainUIHandler(param1:Event) : void
      {
         this.senderProxy.send_72113();
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:Array = null;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               break;
            case CharAttribute.WODEMENPAI:
               this.senderProxy.send_72101(-1);
               break;
            case CharAttribute.UI_WUDEMENPAI_CREATE_CLICK:
               this.senderProxy.send_72103(_loc2_.data as String);
               break;
            case CharAttribute.UI_WUDEMENPAI_TUIBIAN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_XUESHOUTUIBIAN_PANEL);
               break;
            case CharAttribute.UI_WUDEMENPAI_CHUZHAN_CLICK:
               _loc3_ = _loc2_.data as Array;
               this.senderProxy.send_72107(_loc3_);
               break;
            case CharAttribute.UI_WUDEMENPAI_CHUANGONG_CLICK:
               PipeManager.sendMsg(PipeConstants.QINGQIU_CHUANGONGWUXUE_MIANBAN);
               break;
            case CharAttribute.UI_WUDEMENPAI_GONGXIAN_OK_CLICK:
               this.senderProxy.send_72105(_loc2_.data);
               break;
            case CharAttribute.UI_WUDEMENPAI_CHAKAN_CLICK:
               GameInstance.lookPlayerID = _loc2_.data as int;
               if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               }
               PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
         }
      }
      
      public function upDataPanel(param1:MenPai) : void
      {
         this.mainCharArrtibutePlane.showWoDeMenPai();
         this.mainCharArrtibutePlane.setWoDeMenPaiInit(param1);
         if(param1)
         {
            this.setAvatar(param1.goodsId,param1.menPai);
         }
      }
      
      public function setResult() : void
      {
         this.mainCharArrtibutePlane.showWoDeMenPaiResult();
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
            mainCharArrtibutePlane.setWoDeMenPaiAvatar(param2);
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
         this.mainCharArrtibutePlane.setWoDeMenPaiAvatar(null);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar(goodsID + "_" + ++this.avatar_zizeng,callBack,apdArr,0,CharStatusType.STAND);
      }
   }
}

