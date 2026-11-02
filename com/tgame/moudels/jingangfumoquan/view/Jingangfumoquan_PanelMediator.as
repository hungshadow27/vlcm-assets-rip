package com.tgame.moudels.jingangfumoquan.view
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
   import com.tgame.moudels.jingangfumoquan.Jingangfumoquan_ApplicationFacade;
   import com.tgame.moudels.jingangfumoquan.model.Jingangfumoquan_MsgSenderProxy;
   import com.tgame.moudels.jingangfumoquan.model.info.JingangfumoquanVo;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
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
   
   public class Jingangfumoquan_PanelMediator extends Mediator
   {
      
      public static const NAME:String = "Jingangfumoquan_PanelMediator";
      
      private var vo:JingangfumoquanVo;
      
      private const MAX_ZHAOSHI_COUNT:int = 5;
      
      private var isAuto:Boolean = false;
      
      private var autoKnowTimer:Timer;
      
      private var typeZF:int;
      
      private var _senderProxy:Jingangfumoquan_MsgSenderProxy;
      
      private var avatar_zizeng:int = 0;
      
      public function Jingangfumoquan_PanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : Jingangfumoquan_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Jingangfumoquan_MsgSenderProxy.NAME) as Jingangfumoquan_MsgSenderProxy;
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
         return [Jingangfumoquan_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Jingangfumoquan_ApplicationFacade.GOODS_CHANGED:
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.JINGANGFUMOQUAN,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_JINGANGFUMOQUAN_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_JINGANGFUMOQUAN_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_JINGANGFUMOQUAN_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_JINGANGFUMOQUAN_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_JINGANGFUMOQUAN_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_JINGANGFUMOQUAN_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_JINGANGFUMOQUAN_SKILL_DRAG,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.JINGANGFUMOQUAN,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_JINGANGFUMOQUAN_LINGWU_SHOW,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_JINGANGFUMOQUAN_SHANGYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_JINGANGFUMOQUAN_XIAYIYE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_JINGANGFUMOQUAN_KAISHITISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_JINGANGFUMOQUAN_ZIDONGTISHENG_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_JINGANGFUMOQUAN_GOUMAI_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_JINGANGFUMOQUAN_SKILL_DRAG,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var b:Boolean = false;
         var id:uint = 0;
         var itemFace:ItemFace = null;
         var str:String = null;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case Event.REMOVED_FROM_STAGE:
               this.mainCharArrtibutePlane.showJinGangFuMoQuanLingWuPanel(false);
               break;
            case CharAttribute.JINGANGFUMOQUAN:
               this.senderProxy.send_61661([-1,0]);
               break;
            case CharAttribute.UI_JINGANGFUMOQUAN_LINGWU_SHOW:
               this.senderProxy.send_61663(this.vo.nowLookingID);
               break;
            case CharAttribute.UI_JINGANGFUMOQUAN_SHANGYIYE_CLICK:
               this.senderProxy.send_61661([-1,this.vo.nowLookingID - 1 <= 1 ? 1 : this.vo.nowLookingID - 1]);
               break;
            case CharAttribute.UI_JINGANGFUMOQUAN_XIAYIYE_CLICK:
               this.senderProxy.send_61661([-1,this.vo.nowLookingID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowLookingID + 1]);
               break;
            case CharAttribute.UI_JINGANGFUMOQUAN_KAISHITISHENG_CLICK:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.senderProxy.send_61665([this.vo.nowID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowID + 1,1]);
               }
               else
               {
                  this.senderProxy.send_61665([this.vo.nowID + 1 >= this.MAX_ZHAOSHI_COUNT ? this.MAX_ZHAOSHI_COUNT : this.vo.nowID + 1,0]);
               }
               this.mainCharArrtibutePlane.setJinGangFuMoQuanLingwuBtn(!this.isAuto);
               break;
            case CharAttribute.UI_JINGANGFUMOQUAN_ZIDONGTISHENG_CLICK:
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
                           senderProxy.send_61665([vo.nowID + 1 >= MAX_ZHAOSHI_COUNT ? MAX_ZHAOSHI_COUNT : vo.nowID + 1,0]);
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setJinGangFuMoQuanLingwuBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setJinGangFuMoQuanLingwuBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_JINGANGFUMOQUAN_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
               break;
            case CharAttribute.UI_JINGANGFUMOQUAN_SKILL_DRAG:
               itemFace = evt.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = itemFace;
                  TCursorManager.showItem(itemFace.itemBD);
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
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
               senderProxy.send_61665([vo.nowID + 1 >= MAX_ZHAOSHI_COUNT ? MAX_ZHAOSHI_COUNT : vo.nowID + 1,0]);
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
      
      public function upDataPanel(param1:JingangfumoquanVo, param2:int, param3:int) : void
      {
         this.vo = param1;
         this.mainCharArrtibutePlane.showJinGangFuMoQuan();
         this.mainCharArrtibutePlane.setJinGangFuMoQuanInitialize(this.vo);
         this.setAvatar(param3,param2);
         var _loc4_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_JINGANGFUMOQUAN_FENGLEI] != undefined)
         {
            _loc4_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_JINGANGFUMOQUAN_FENGLEI]);
         }
         this.mainCharArrtibutePlane.set_JinGangFuMoQuan(_loc4_);
         this.mainCharArrtibutePlane.set_JinGangFuMoQuan1(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
      }
      
      public function upDateDouZhuanXingYiLV(param1:int, param2:int, param3:int, param4:int, param5:int, param6:String) : void
      {
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc7_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param3,true);
         var _loc8_:Boolean = false;
         if(_loc7_.count >= param4)
         {
            _loc8_ = true;
         }
         this.mainCharArrtibutePlane.setJinGangFuMoQuanLingwuInitialize(param6,true,_loc7_.res.name,param4,_loc8_,param5);
         if(this.typeZF != 0)
         {
            _loc10_ = param1 - this.typeZF;
         }
         this.mainCharArrtibutePlane.setJinGangFuMoQuanLingwuZhufuzhi(param1,param2,_loc10_);
         this.typeZF = param1;
         this.mainCharArrtibutePlane.setJinGangFuMoQuanLingwuGoods(_loc7_,_loc8_);
         this.autoKnowTimerFun();
      }
      
      public function upDateDouZhuanXingYiLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setJinGangFuMoQuanLingwuBtn(!this.isAuto);
            this.mainCharArrtibutePlane.showJinGangFuMoQuanLingWuPanel(false);
            this.typeZF = 0;
            this.senderProxy.send_61661([-1,0]);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setJinGangFuMoQuanLingwuBtn(!this.isAuto);
         }
         else
         {
            this.mainCharArrtibutePlane.showJinGangFuMoQuanLingWuPanel(true);
            this.senderProxy.send_61663(this.vo.nowLookingID);
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
            mainCharArrtibutePlane.setJinGangFuMoQuanAvatar(param2);
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
         this.mainCharArrtibutePlane.setJinGangFuMoQuanAvatar(null);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar(goodsID + "_" + ++this.avatar_zizeng,callBack,apdArr,0,CharStatusType.STAND);
      }
   }
}

