package com.tgame.moudels.mingyugong.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
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
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.mingyugong.MingYuGong_ApplicationFacade;
   import com.tgame.moudels.mingyugong.model.MingYuGong_MsgSenderProxy;
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
   
   public class MingYuGong_Mediator extends Mediator
   {
      
      public static const NAME:String = "MingYuGong_Mediator";
      
      private var curZF:int = 0;
      
      private var autoKnowTimer:Timer;
      
      private var isAuto:Boolean = false;
      
      private const MAX_ZHAOSHI_COUNT:int = 9;
      
      private var nowObj:Object = new Object();
      
      private var _senderProxy:MingYuGong_MsgSenderProxy;
      
      private var avatar_zizeng:int = 0;
      
      public function MingYuGong_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : MingYuGong_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(MingYuGong_MsgSenderProxy.NAME) as MingYuGong_MsgSenderProxy;
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
         return [MingYuGong_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case MingYuGong_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.isMingYuGongTuPoShow())
               {
                  this.senderProxy.send_78603(this.nowObj.nowID);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETMINGYUGONG,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_MINGYUGONG_DENGJITUPO_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_MINGYUGONG_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_MINGYUGONG_NEXT_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_MINGYUGONG_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_MINGYUGONG_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_MINGYUGONG_SKILL_DRAG,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_MINGYUGONG_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_MINGYUGONG_SHOWWAIGUAN,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETMINGYUGONG,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_MINGYUGONG_DENGJITUPO_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_MINGYUGONG_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_MINGYUGONG_NEXT_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_MINGYUGONG_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_MINGYUGONG_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_MINGYUGONG_SKILL_DRAG,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_MINGYUGONG_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_MINGYUGONG_SHOWWAIGUAN,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var index:int = 0;
         var b:Boolean = false;
         var itemFace:ItemFace = null;
         var id:uint = 0;
         var dazuoByte:Boolean = false;
         var str:String = null;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case CharAttribute.GETMINGYUGONG:
               this.senderProxy.send_78601([-1,0]);
               break;
            case CharAttribute.UI_MINGYUGONG_DENGJITUPO_CLICKJ:
               this.senderProxy.send_78603(this.nowObj.lookID);
               break;
            case CharAttribute.UI_MINGYUGONG_PREVIOUS_CLICK:
               index = int(evt.data);
               this.senderProxy.send_78601([-1,index]);
               break;
            case CharAttribute.UI_MINGYUGONG_NEXT_CLICK:
               index = int(evt.data);
               this.senderProxy.send_78601([-1,index]);
               break;
            case CharAttribute.UI_MINGYUGONG_KAISHITISHENG_CLICKJ:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.senderProxy.send_78605(1);
               }
               else
               {
                  this.senderProxy.send_78605(0);
               }
               this.mainCharArrtibutePlane.setMingYuGongBtn(!this.isAuto);
               break;
            case CharAttribute.UI_MINGYUGONG_ZIDONGTISHENG_CLICKJ:
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
                           senderProxy.send_78605(0);
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setMingYuGongBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setMingYuGongBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_MINGYUGONG_SKILL_DRAG:
               itemFace = evt.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = itemFace;
                  TCursorManager.showItem(itemFace.itemBD);
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
               break;
            case CharAttribute.UI_MINGYUGONG_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
               break;
            case CharAttribute.UI_MINGYUGONG_SHOWWAIGUAN:
               dazuoByte = Boolean(evt.data);
               if(dazuoByte)
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_DAZUO_WAIGUAN,4);
               }
               else
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_DAZUO_WAIGUAN,0);
               }
         }
      }
      
      public function upDataMingYuGongPanel(param1:Object, param2:int, param3:int) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance._charAttribute))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ATTRIBUTE_PLANE);
         }
         this.nowObj = param1;
         this.mainCharArrtibutePlane.showMingYuGong();
         this.mainCharArrtibutePlane.initializateMingYuGong(param1);
         this.setAvatar(param2,param3);
         var _loc4_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_20171115RONGQINGAIYI] != undefined)
         {
            _loc4_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_20171115RONGQINGAIYI]);
         }
         this.mainCharArrtibutePlane.set_RongQingAiYi(_loc4_);
      }
      
      public function upDataLingWuPanel(param1:String, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int) : void
      {
         var _loc8_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param5,true);
         var _loc9_:Boolean = false;
         if(_loc8_.count >= param6)
         {
            _loc9_ = true;
         }
         this.mainCharArrtibutePlane.showMingYuGongTuPoPanel(true);
         this.mainCharArrtibutePlane.setMingYuGongTuPo(param1,param4,true,_loc8_.res.name,param6,_loc9_,param7);
         var _loc10_:int = 0;
         if(this.curZF != 0)
         {
            _loc10_ = param2 - this.curZF;
         }
         this.mainCharArrtibutePlane.setMingYuGongZhufuzhi(param2,param3,_loc10_);
         this.curZF = param2;
         this.mainCharArrtibutePlane.setMingYuGongGoods(_loc8_,_loc9_);
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
               senderProxy.send_78605(0);
            }
         };
         if(this.isAuto)
         {
            if(this.autoKnowTimer)
            {
               return;
            }
            this.autoKnowTimer = new Timer(1000,1);
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
      
      public function upDataMingYuGongLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setMingYuGongBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showMingYuGongTuPoPanel(false);
            this.senderProxy.send_78601([-1,0]);
         }
         if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setMingYuGongBtn(!this.isAuto);
         }
         else
         {
            this.senderProxy.send_78603(this.nowObj.lookID);
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
            mainCharArrtibutePlane.setMingYuGongAvatar(param2);
         };
         var apdArr:Array = [];
         if(goodsID == 0)
         {
            sex = 0;
            if(menpai == PartyType.SHAOLINPAI || menpai == PartyType.QUANZHENJIAO || menpai == PartyType.NONE)
            {
               sex = 1;
            }
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
         this.mainCharArrtibutePlane.setMingYuGongAvatar(null);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar(goodsID + "_" + ++this.avatar_zizeng,callBack,apdArr,0,CharStatusType.SIT);
      }
   }
}

