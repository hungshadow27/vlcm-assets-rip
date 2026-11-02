package com.tgame.moudels.BeiMingShenGong.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.PartyType;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.BeiMingShenGong.BeiMingShenGong_ApplicationFacade;
   import com.tgame.moudels.BeiMingShenGong.model.BeiMingShenGong_MsgSenderProxy;
   import com.tgame.moudels.BeiMingShenGong.model.info.BeiMingShenGongVO;
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
   
   public class BeiMingShenGong_Mediator extends Mediator
   {
      
      public static const NAME:String = "BeiMingShenGong_Mediator";
      
      private var isAuto:Boolean = false;
      
      private var vo:BeiMingShenGongVO;
      
      private var autoKnowTimer:Timer;
      
      private var curZF:int;
      
      private const MAX_ZHAOSHI_COUNT:int = 18;
      
      private const ALLOW_LEARN_LEVEL:int = 72;
      
      private var _senderProxy:BeiMingShenGong_MsgSenderProxy;
      
      private var avatar_zizeng:int = 0;
      
      public function BeiMingShenGong_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : BeiMingShenGong_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(BeiMingShenGong_MsgSenderProxy.NAME) as BeiMingShenGong_MsgSenderProxy;
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
         return [BeiMingShenGong_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case BeiMingShenGong_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isBeiMingShenGongLVShow() && Boolean(this.vo))
               {
                  this.senderProxy.send_56103(this.vo.nowLookingID);
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
            mainCharArrtibutePlane.addEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETBEIMINGSHENGONG,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_BEIMINGSHENGONG_XIULIAN_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_BEIMINGSHENGONG_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_BEIMINGSHENGONG_NEXT_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_BEIMINGSHENGONG_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_BEIMINGSHENGONG_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_BEIMINGSHENGONG_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SHIFOUSHIYONGBEIMINGSHENGONG_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETBEIMINGSHENGONG,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_BEIMINGSHENGONG_XIULIAN_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_BEIMINGSHENGONG_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_BEIMINGSHENGONG_NEXT_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_BEIMINGSHENGONG_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_BEIMINGSHENGONG_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_BEIMINGSHENGONG_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SHIFOUSHIYONGBEIMINGSHENGONG_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var b:Boolean = false;
         var id:uint = 0;
         var str:String = null;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case Event.REMOVED_FROM_STAGE:
               this.mainCharArrtibutePlane.showBeiMingShenGongLingWuPanel(false);
               break;
            case CharAttribute.GETBEIMINGSHENGONG:
               if(!ReloginManager.isInKuafu && GameInstance.mainCharData.attributeInfo.lv < this.ALLOW_LEARN_LEVEL)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，只有72级及以上玩家才可以修炼北冥神功"));
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，只有72级及以上玩家才可以修炼北冥神功"));
               }
               else
               {
                  this.senderProxy.send_56101([-1,0]);
               }
               break;
            case CharAttribute.UI_BEIMINGSHENGONG_XIULIAN_CLICK:
               this.senderProxy.send_56103(this.vo.nowLookingID);
               break;
            case CharAttribute.UI_BEIMINGSHENGONG_PREVIOUS_CLICK:
               this.senderProxy.send_56101([-1,this.vo.nowLookingID - 1 <= 1 ? 1 : this.vo.nowLookingID - 1]);
               break;
            case CharAttribute.UI_BEIMINGSHENGONG_NEXT_CLICK:
               this.senderProxy.send_56101([-1,this.vo.nowLookingID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowLookingID + 1]);
               break;
            case CharAttribute.UI_BEIMINGSHENGONG_KAISHITISHENG_CLICKJ:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.senderProxy.send_56105(-1);
               }
               else
               {
                  this.senderProxy.send_56105(this.vo.nowID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowID);
               }
               this.mainCharArrtibutePlane.setBeiMingShenGongBtn(!this.isAuto);
               break;
            case CharAttribute.UI_BEIMINGSHENGONG_ZIDONGTISHENG_CLICKJ:
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
                           senderProxy.send_56105(vo.nowID + 1 >= MAX_ZHAOSHI_COUNT ? MAX_ZHAOSHI_COUNT : vo.nowID);
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setBeiMingShenGongBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setBeiMingShenGongBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_BEIMINGSHENGONG_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
               break;
            case CharAttribute.UI_SHIFOUSHIYONGBEIMINGSHENGONG_CLICK:
               this.senderProxy.send_56107(evt.data);
         }
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
               senderProxy.send_56105(vo.nowID + 1 >= MAX_ZHAOSHI_COUNT ? MAX_ZHAOSHI_COUNT : vo.nowID);
            }
         };
         if(this.isAuto)
         {
            if(this.autoKnowTimer)
            {
               return;
            }
            this.autoKnowTimer = new Timer(300,1);
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
      
      public function upDataBeiMingShenGongPanel(param1:BeiMingShenGongVO, param2:int, param3:int) : void
      {
         this.vo = new BeiMingShenGongVO();
         this.vo = param1;
         this.mainCharArrtibutePlane.showBeiMingShenGong();
         this.mainCharArrtibutePlane.initializateBmsgPanel(this.vo);
         this.setAvatar(param2,param3);
         var _loc4_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_BEIMINGSHENGONG_DIHUANGYUXI] != undefined)
         {
            _loc4_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_BEIMINGSHENGONG_DIHUANGYUXI]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_BEIMINGSHENGONG_LIUXINGLUO] != undefined)
         {
            _loc4_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_BEIMINGSHENGONG_LIUXINGLUO]);
         }
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_LIHEJUEDAFAXUNZHANG] != undefined)
         {
            _loc4_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_LIHEJUEDAFAXUNZHANG]);
         }
         this.mainCharArrtibutePlane.set_BeiMingShenGong(_loc4_);
      }
      
      public function upDataLingWuPanel(param1:String, param2:String, param3:int, param4:int, param5:String, param6:int, param7:int, param8:int) : void
      {
         var _loc9_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param6,true);
         var _loc10_:Boolean = false;
         if(_loc9_.count >= param7)
         {
            _loc10_ = true;
         }
         this.mainCharArrtibutePlane.showBeiMingShenGongLingWuPanel(true);
         this.mainCharArrtibutePlane.setBeiMingShenGongLVInitialize(param5,true,_loc9_.res.name,param7,_loc10_,param8);
         this.mainCharArrtibutePlane.setBeiMingShenGongShuoming(param1,param2);
         var _loc11_:int = 0;
         if(this.curZF != 0 && param3 > this.curZF)
         {
            _loc11_ = param3 - this.curZF;
         }
         this.mainCharArrtibutePlane.setBeiMingShenGongZhufuzhi(param3,param4,_loc11_);
         this.curZF = param3;
         this.mainCharArrtibutePlane.setBeiMingShenGongGoods(_loc9_,_loc10_);
         this.autoKnowTimerFun();
      }
      
      public function upDataBeiMingShenGongLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setBeiMingShenGongBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showBeiMingShenGongLingWuPanel(false);
            this.senderProxy.send_56101([-1,0]);
         }
         if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setBeiMingShenGongBtn(!this.isAuto);
         }
         else
         {
            this.senderProxy.send_56103(this.vo.nowLookingID);
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
            mainCharArrtibutePlane.setBeiMingShenGongAvatar(param2);
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
         this.mainCharArrtibutePlane.setBeiMingShenGongAvatar(null);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar(goodsID + "_" + ++this.avatar_zizeng,callBack,apdArr,0,CharStatusType.SIT);
      }
      
      public function upDataJiNengStatus(param1:Boolean) : void
      {
         this.mainCharArrtibutePlane.setBeiMingShenGongUse(param1);
      }
   }
}

