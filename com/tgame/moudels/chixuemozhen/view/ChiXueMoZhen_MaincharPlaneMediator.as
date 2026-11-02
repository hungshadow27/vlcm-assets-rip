package com.tgame.moudels.chixuemozhen.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.chixuemozhen.ChiXueMoZhen_ApplicationFacade;
   import com.tgame.moudels.chixuemozhen.model.ChiXueMoZhen_MsgSenderProxy;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ChiXueMoZhen_MaincharPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "ChiXueMoZhen_MaincharPlaneMediator";
      
      private var isAuto:Boolean = false;
      
      private var autoKnowTimer:Timer;
      
      private var item:Goods;
      
      private var curZF:int;
      
      private var _msgSenderProxy:ChiXueMoZhen_MsgSenderProxy;
      
      private var avatar_zizeng:int = 0;
      
      public function ChiXueMoZhen_MaincharPlaneMediator()
      {
         super(NAME);
      }
      
      protected function get mainCharArrtibutePlane() : CharAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.charAttribute);
         }
         return viewComponent as CharAttribute;
      }
      
      private function get msgSenderProxy() : ChiXueMoZhen_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(ChiXueMoZhen_MsgSenderProxy.NAME) as ChiXueMoZhen_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ChiXueMoZhen_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case ChiXueMoZhen_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isChiXueMoZhenShow() && GameState.gongneng2013)
               {
                  this.msgSenderProxy.send_59751([-1,-1]);
               }
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
            mainCharArrtibutePlane.addEventListener(Event.REMOVED_FROM_STAGE,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.CHIXUEMOZHEN,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHIXUEMOZHEN_TUPO_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHIXUEMOZHEN_KAISHITISHENG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHIXUEMOZHEN_ZIDONGTISHENG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHIXUEMOZHEN_PREVIOUS_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHIXUEMOZHEN_NEXT_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHIXUEMOZHEN_ADDITEM,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHIXUEMOZHEN_SKILL_DRAG,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHIXUEMOZHEN_GOUMAI_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHIXUEMOZHEN_MOXUE_TISHENG,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHIXUEMOZHEN_MOXUE_GUANZHU,mainCharArrtibutePlaneHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.CHIXUEMOZHEN,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHIXUEMOZHEN_TUPO_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHIXUEMOZHEN_KAISHITISHENG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHIXUEMOZHEN_ZIDONGTISHENG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHIXUEMOZHEN_PREVIOUS_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHIXUEMOZHEN_NEXT_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHIXUEMOZHEN_ADDITEM,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHIXUEMOZHEN_SKILL_DRAG,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHIXUEMOZHEN_GOUMAI_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHIXUEMOZHEN_MOXUE_TISHENG,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHIXUEMOZHEN_MOXUE_GUANZHU,mainCharArrtibutePlaneHandle);
         });
      }
      
      private function mainCharArrtibutePlaneHandle(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var b:Boolean = false;
         var itemFace:ItemFace = null;
         var id:uint = 0;
         var str:String = null;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case Event.REMOVED_FROM_STAGE:
               this.mainCharArrtibutePlane.showChiXueMoZhenTupoPanel(false);
               break;
            case CharAttribute.CHIXUEMOZHEN:
               this.msgSenderProxy.send_59751([-1,-1]);
               break;
            case CharAttribute.UI_CHIXUEMOZHEN_TUPO_CLICK:
               this.msgSenderProxy.send_59753();
               break;
            case CharAttribute.UI_CHIXUEMOZHEN_KAISHITISHENG_CLICK:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.msgSenderProxy.send_59755(1);
               }
               else
               {
                  this.msgSenderProxy.send_59755(0);
               }
               this.mainCharArrtibutePlane.setChiXueMoZhenBtn(!this.isAuto);
               break;
            case CharAttribute.UI_CHIXUEMOZHEN_ZIDONGTISHENG_CLICK:
               b = evt.data as Boolean;
               if(b)
               {
                  str = LanResManager.getLanTextWords(Dugujiujian_LingwuPanelMediator,"您希望自动使用背包中的领悟道具领悟本阶招式1",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("开始自动领悟");
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                  FAlert.show(str,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        isAuto = evt.data as Boolean;
                        if(isAuto)
                        {
                           msgSenderProxy.send_59755(0);
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setChiXueMoZhenBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = b;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setChiXueMoZhenBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_CHIXUEMOZHEN_PREVIOUS_CLICK:
               this.msgSenderProxy.send_59751([-1,evt.data as int]);
               break;
            case CharAttribute.UI_CHIXUEMOZHEN_NEXT_CLICK:
               this.msgSenderProxy.send_59751([-1,evt.data as int]);
               break;
            case CharAttribute.UI_CHIXUEMOZHEN_ADDITEM:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  this.item = TCursorManager.currentItemFace.getBaseItem() as Goods;
                  this.msgSenderProxy.send_59759([this.item.position,evt.data as int]);
               }
               break;
            case CharAttribute.UI_CHIXUEMOZHEN_SKILL_DRAG:
               itemFace = evt.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = itemFace;
                  TCursorManager.showItem(itemFace.itemBD);
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
               break;
            case CharAttribute.UI_CHIXUEMOZHEN_MOXUE_TISHENG:
               this.msgSenderProxy.send_59757();
               break;
            case CharAttribute.UI_CHIXUEMOZHEN_MOXUE_GUANZHU:
               PipeManager.sendMsg(PipeConstants.SHOW_MOXUE_DOLL_PANEL);
               break;
            case CharAttribute.UI_CHIXUEMOZHEN_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
         }
      }
      
      public function setChiXueMoZhen(param1:int, param2:int, param3:int, param4:String, param5:int, param6:Array, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean, param13:int, param14:Boolean, param15:int, param16:Boolean, param17:int, param18:Boolean, param19:Boolean, param20:Boolean, param21:Boolean) : void
      {
         this.mainCharArrtibutePlane.showChiXueMoZhen();
         this.mainCharArrtibutePlane.set_XSJC(param15);
         this.mainCharArrtibutePlane.setChiXueMoZhenInit(param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param16,param17,param18,param19,param20,param21);
         this.setAvatar(param2,param1);
         var _loc22_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_CHIXUEMOZHEN_MOJIAN_ID] != undefined)
         {
            _loc22_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_CHIXUEMOZHEN_MOJIAN_ID]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_CHIXUEMOZHEN_XIELONGMOJIAN_ID] != undefined)
         {
            _loc22_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_CHIXUEMOZHEN_XIELONGMOJIAN_ID]);
         }
         this.mainCharArrtibutePlane.set_ChiXueMoZhen(_loc22_);
      }
      
      public function setTupoPanel(param1:String, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         var _loc7_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param2,true);
         var _loc8_:Boolean = false;
         if(_loc7_.count >= param3)
         {
            _loc8_ = true;
         }
         this.mainCharArrtibutePlane.showChiXueMoZhenTupoPanel(true);
         this.mainCharArrtibutePlane.setChiXueMoZhenTupoPanel(param1,true,_loc7_.res.name,param3,_loc8_,param6);
         var _loc9_:int = 0;
         if(this.curZF != 0 && param4 > this.curZF)
         {
            _loc9_ = param4 - this.curZF;
         }
         this.mainCharArrtibutePlane.setChiXueMoZhenZhufuzhi(param4,param5,_loc9_);
         this.curZF = param4;
         this.mainCharArrtibutePlane.setChiXueMoZhenGoods(_loc7_,_loc8_);
         this.autoKnowTimerFun();
      }
      
      private function autoKnowTimerFun() : void
      {
         var fun:Function = null;
         fun = function(param1:TimerEvent):void
         {
            autoKnowTimer.removeEventListener(TimerEvent.TIMER,fun);
            autoKnowTimer = null;
            if(isAuto)
            {
               msgSenderProxy.send_59755(0);
            }
         };
         if(this.isAuto)
         {
            if(this.autoKnowTimer)
            {
               return;
            }
            this.autoKnowTimer = new Timer(200,1);
            this.autoKnowTimer.start();
            this.autoKnowTimer.addEventListener(TimerEvent.TIMER,fun);
         }
         else
         {
            if(!this.autoKnowTimer)
            {
               return;
            }
            this.autoKnowTimer.stop();
            this.autoKnowTimer.removeEventListener(TimerEvent.TIMER,fun);
            this.autoKnowTimer = null;
         }
      }
      
      public function setTupoResult(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setChiXueMoZhenBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showChiXueMoZhenTupoPanel(false);
         }
         else if(param1 == 3)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setChiXueMoZhenBtn(!this.isAuto);
         }
         else
         {
            this.msgSenderProxy.send_59753();
         }
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
            mainCharArrtibutePlane.setChiXueMoZhenAvatar(param2);
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
         this.mainCharArrtibutePlane.setChiXueMoZhenAvatar(null);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar(goodsID + "_" + ++this.avatar_zizeng,callBack,apdArr,0,CharStatusType.SIT);
      }
   }
}

