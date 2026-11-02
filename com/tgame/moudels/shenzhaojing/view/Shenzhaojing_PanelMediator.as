package com.tgame.moudels.shenzhaojing.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.Player;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.shenzhaojing.Shenzhaojing_ApplicationFacade;
   import com.tgame.moudels.shenzhaojing.info.ShenzhaojingVO;
   import com.tgame.moudels.shenzhaojing.model.Shenzhaojing_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.CharStatusType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Shenzhaojing_PanelMediator extends Mediator
   {
      
      public static const NAME:String = "Shenzhaojing_PanelMediator";
      
      public var nowCkCsNum:int;
      
      public var nowCkCsDsNum:int;
      
      public var nowLwCsNum:int;
      
      public var nowCkCsLwDsNum:int;
      
      private var avatar_zizeng:int = 0;
      
      private var typeZF:int;
      
      private var isAuto:Boolean = false;
      
      private var autoKnowTimer:Timer;
      
      private var _senderProxy:Shenzhaojing_MsgSenderProxy;
      
      public function Shenzhaojing_PanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : Shenzhaojing_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Shenzhaojing_MsgSenderProxy.NAME) as Shenzhaojing_MsgSenderProxy;
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
         return [Shenzhaojing_ApplicationFacade.GOODS_CHANGED];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Shenzhaojing_ApplicationFacade.GOODS_CHANGED:
               if(Fun.isVisible(this.mainCharArrtibutePlane) && this.mainCharArrtibutePlane.IsShow())
               {
                  this.senderProxy.send_57209(this.nowCkCsNum);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.SHENZHAOJING,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SHENZHAOJING_TISHENGSUDU_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SHENZHAOJING_XIULIANTISU_ONE_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SHENZHAOJING_XIULIANTISU_ALL_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SHENZHAOJING_TUPOPINGJING_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SHENZHAOJING_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SHENZHAOJING_NEXT_CLICK,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SHENZHAOJING_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SHENZHAOJING_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SHENZHAOJING_SKILL_DRAG,handler);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SHENZHAOJING_XIULIANTISU_GOUMAI_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.SHENZHAOJING,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SHENZHAOJING_TISHENGSUDU_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SHENZHAOJING_XIULIANTISU_ONE_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SHENZHAOJING_XIULIANTISU_ALL_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SHENZHAOJING_TUPOPINGJING_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SHENZHAOJING_PREVIOUS_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SHENZHAOJING_NEXT_CLICK,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SHENZHAOJING_KAISHITISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SHENZHAOJING_ZIDONGTISHENG_CLICKJ,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SHENZHAOJING_SKILL_DRAG,handler);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SHENZHAOJING_XIULIANTISU_GOUMAI_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
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
               this.mainCharArrtibutePlane.setShenZhaoJingonShowLv(false);
               break;
            case CharAttribute.SHENZHAOJING:
               if(!ReloginManager.isInKuafu && GameInstance.mainCharData.attributeInfo.lv < 30)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("很抱歉，只有30级及以上玩家才可以修炼神照经"));
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("很抱歉，只有30级及以上玩家才可以修炼神照经"));
               }
               else
               {
                  this.senderProxy.send_57201(0);
               }
               break;
            case CharAttribute.UI_SHENZHAOJING_TISHENGSUDU_CLICK:
               this.senderProxy.send_57203([this.nowCkCsNum,this.nowCkCsDsNum]);
               break;
            case CharAttribute.UI_SHENZHAOJING_XIULIANTISU_ONE_CLICK:
               this.senderProxy.send_57205([this.nowCkCsNum,this.nowCkCsLwDsNum + 1 >= 5 ? 5 : this.nowCkCsLwDsNum + 1]);
               break;
            case CharAttribute.UI_SHENZHAOJING_XIULIANTISU_ALL_CLICK:
               this.senderProxy.send_57207([this.nowCkCsNum,this.nowCkCsLwDsNum + 1 >= 5 ? 5 : this.nowCkCsLwDsNum + 1]);
               break;
            case CharAttribute.UI_SHENZHAOJING_TUPOPINGJING_CLICK:
               this.mainCharArrtibutePlane.setShenZhaoJingonShowLv(true);
               this.isAuto = false;
               this.autoKnowTimerFun();
               this.senderProxy.send_57209(this.nowCkCsNum);
               break;
            case CharAttribute.UI_SHENZHAOJING_PREVIOUS_CLICK:
               this.senderProxy.send_57213([this.nowCkCsDsNum - 1 < 1 ? this.nowCkCsNum - 1 : this.nowCkCsNum,this.nowCkCsDsNum - 1 < 1 ? 5 : this.nowCkCsDsNum - 1]);
               break;
            case CharAttribute.UI_SHENZHAOJING_NEXT_CLICK:
               this.senderProxy.send_57213([this.nowCkCsDsNum + 1 > 5 ? this.nowCkCsNum + 1 : this.nowCkCsNum,this.nowCkCsDsNum + 1 > 5 ? 1 : this.nowCkCsDsNum + 1]);
               break;
            case CharAttribute.UI_SHENZHAOJING_KAISHITISHENG_CLICKJ:
               b = evt.data as Boolean;
               this.isAuto = false;
               this.autoKnowTimerFun();
               if(b)
               {
                  this.senderProxy.send_57211(-1);
               }
               else
               {
                  this.senderProxy.send_57211(this.nowLwCsNum + 1 >= 20 ? 20 : this.nowLwCsNum + 1);
               }
               this.mainCharArrtibutePlane.setShenZhaoJingnLingwuBtn(!this.isAuto);
               break;
            case CharAttribute.UI_SHENZHAOJING_ZIDONGTISHENG_CLICKJ:
               b = evt.data as Boolean;
               if(b)
               {
                  str = "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("您希望自动使用背包中的修炼道具修炼本阶招式？") + "</font>\n\n" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("当遇到以下情况时系统会中止自动提升过程：") + "\n" + LanResManager.getLanCommonTextWords("1.背包中剩余的修炼道具已全部使用完毕") + "\n" + LanResManager.getLanCommonTextWords("2.成功修炼了本式") + "\n" + LanResManager.getLanCommonTextWords("3.您点击了停止修炼按钮或关闭了修炼面板") + "</font>";
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("开始自动修炼");
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
                  FAlert.show(str,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        isAuto = evt.data as Boolean;
                        if(isAuto)
                        {
                           senderProxy.send_57211(nowLwCsNum + 1 >= 20 ? 20 : nowLwCsNum + 1);
                        }
                        autoKnowTimerFun();
                        mainCharArrtibutePlane.setShenZhaoJingnLingwuBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharArrtibutePlane.setShenZhaoJingnLingwuBtn(!this.isAuto);
               }
               break;
            case CharAttribute.UI_SHENZHAOJING_SKILL_DRAG:
               itemFace = evt.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = itemFace;
                  TCursorManager.showItem(itemFace.itemBD);
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
               break;
            case CharAttribute.UI_SHENZHAOJING_XIULIANTISU_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
         }
      }
      
      public function initializeMainUI(param1:ShenzhaojingVO) : void
      {
         var play:Player;
         var sex:int;
         var zhenId:int = 0;
         var huanzhuangArr:Array = null;
         var callBack:Function = null;
         var apdArr:Array = null;
         var vo:ShenzhaojingVO = param1;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != GameInstance.mainChar.id + "_" + avatar_zizeng)
            {
               return;
            }
            if(param2 != null)
            {
               huanzhuangArr.push(param2);
            }
            if(zhenId < 5)
            {
               SimpleAvatarSynthesizer.synthesisSimpleAvatar(GameInstance.mainChar.id + "_" + ++avatar_zizeng,callBack,apdArr,++zhenId,CharStatusType.ATTACK);
               return;
            }
            vo.renwuArr = huanzhuangArr;
            mainCharArrtibutePlane.setShenZhaoJingInit(vo);
         };
         this.mainCharArrtibutePlane.showShenzhaojing();
         zhenId = 0;
         huanzhuangArr = new Array();
         play = GameInstance.mainChar.data as Player;
         sex = play.attributeInfo.getSex();
         apdArr = play.avatarInfo.getSimpleAPDList(false,sex,false);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar(GameInstance.mainChar.id + "_" + ++this.avatar_zizeng,callBack,apdArr,zhenId,CharStatusType.ATTACK);
      }
      
      public function initializeTisuPanel(param1:String, param2:int, param3:int, param4:int, param5:Goods, param6:int, param7:int) : void
      {
         var _loc8_:String = param3 + "/" + param4;
         var _loc9_:String = String(param2);
         this.mainCharArrtibutePlane.showShenZhaoJingTisuPanel(_loc9_,_loc8_,param6,param7,param5);
      }
      
      public function updateTisuPanel(param1:int) : void
      {
         if(param1 == 1)
         {
            this.senderProxy.send_57203([this.nowCkCsNum,this.nowCkCsDsNum]);
            if(Fun.isVisible(this.mainCharArrtibutePlane))
            {
               this.senderProxy.send_57201(0);
            }
         }
         else if(param1 == 2)
         {
            this.mainCharArrtibutePlane.CloseShenZhaoJingXiuliantisuPanel();
            this.senderProxy.send_57201(0);
         }
      }
      
      public function upDataShenzhaojingTupoPanel(param1:String, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int) : void
      {
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc8_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param5,true);
         var _loc9_:Boolean = false;
         if(_loc8_.count >= param6)
         {
            _loc9_ = true;
         }
         this.mainCharArrtibutePlane.setShenZhaoJingLingwuInitialize(param4,true,_loc8_.res.name,param6,_loc9_,param7);
         this.mainCharArrtibutePlane.setShenZhaoJingLingwuShuoming(param1);
         if(this.typeZF != 0)
         {
            _loc11_ = param2 - this.typeZF;
         }
         this.mainCharArrtibutePlane.setShenZhaoJingLingwuZhufuzhi(param2,param3,_loc11_);
         this.typeZF = param2;
         this.mainCharArrtibutePlane.setShenZhaoJingLingwuGoods(_loc8_);
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
               senderProxy.send_57211(nowLwCsNum + 1 >= 20 ? 20 : nowLwCsNum + 1);
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
            this.mainCharArrtibutePlane.setShenZhaoJingnLingwuBtn(this.isAuto);
         }
      }
      
      public function upDataLiumaishenjianLVComplete(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setShenZhaoJingnLingwuBtn(!this.isAuto);
            this.mainCharArrtibutePlane.setShenZhaoJingonShowLv(false);
            this.typeZF = 0;
            this.senderProxy.send_57201(0);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharArrtibutePlane.setShenZhaoJingnLingwuBtn(!this.isAuto);
            this.senderProxy.send_57209(this.nowCkCsNum);
         }
         else
         {
            this.senderProxy.send_57209(this.nowCkCsNum);
         }
      }
   }
}

