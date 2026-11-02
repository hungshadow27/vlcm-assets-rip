package com.tgame.moudels.dongxiao.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dongxiao.Dongxiao_ApplicationFacade;
   import com.tgame.moudels.dongxiao.model.Dongxiao_MsgSenderProxy;
   import com.tgame.moudels.dongxiao.model.vo.DongXiaoInfo;
   import com.tgame.moudels.fight.Fight_ApplicationFacade;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.attribute.AnqiActivationHuodong;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Dongxiao_MaincharDongxiaoPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "Dongxiao_MaincharDongxiaoPlaneMediator";
      
      private var _dongxiaoInfo:DongXiaoInfo;
      
      private var _jiuhoPanel:AnqiActivationHuodong;
      
      private var _timer:Timer;
      
      private var _msgSenderProxy:Dongxiao_MsgSenderProxy;
      
      public function Dongxiao_MaincharDongxiaoPlaneMediator()
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
      
      private function get msgSenderProxy() : Dongxiao_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Dongxiao_MsgSenderProxy.NAME) as Dongxiao_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Fight_ApplicationFacade.NPC_REQ_FUNCTION,Dongxiao_ApplicationFacade.DONGXIAO_DINGJI_JIHUO_SHUXING,Dongxiao_ApplicationFacade.UI_JIANGHUN_HUANZHUANG_CLICK];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Object = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Dongxiao_ApplicationFacade.DONGXIAO_DINGJI_JIHUO_SHUXING:
               if(_loc2_.type == 6)
               {
                  this.msgSenderProxy.send_53801([GameInstance.mainChar.id,0]);
               }
               break;
            case Dongxiao_ApplicationFacade.UI_JIANGHUN_HUANZHUANG_CLICK:
               _loc3_ = Object(_loc2_);
               if(_loc3_.type)
               {
                  this.setChiBangShowFalse();
                  this.msgSenderProxy.send_53809(_loc3_.index);
               }
               else
               {
                  this.msgSenderProxy.send_53809(0);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.DONGXIAO,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DONGXIAO_FANYE_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DONGXIAO_SHIFOUSHIYONGANQI_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DONGXIAO_TISHENGSUDU_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DONGXIAO_TUPOPINGJING_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DONGXIAO_XIULIANTISU_GOUMAI_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DONGXIAO_XIULIANTISU_KAISHITISU_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DONGXIAOTUPOPINGJING_GOUMAISHENGJIEWUPIN_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DONGXIAOTUPOPINGJING_KAISHITUPO_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DONGXIAOTUPOPINGJING_CLOSE,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_BOW_SHIFOUXIANSHI_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_DONGXIAO_SHIFOUSHIXIANSHI_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_WUXING_SHOW_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHIBANG_WAIGUAN_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CHIBANG_HUADIE_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_EMOZHIYI_WAIGUAN_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_MOLINGZHIYI_WAIGUAN_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_RIJINLUN_WAIGUAN_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_MOLINGZHIYI_XUESEYUYI_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_YUEJINLUN_WAIGUAN_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_TENGTIANYI_WAIGUAN_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_TENGTIANYI_BANIANSHENWU_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_CANGJIANXUANTIAN_HUANZHUANG_CLICK,mainCharArrtibutePlaneHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.DONGXIAO,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DONGXIAO_FANYE_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DONGXIAO_SHIFOUSHIYONGANQI_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DONGXIAO_TISHENGSUDU_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DONGXIAO_TUPOPINGJING_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DONGXIAO_XIULIANTISU_GOUMAI_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DONGXIAO_XIULIANTISU_KAISHITISU_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DONGXIAOTUPOPINGJING_GOUMAISHENGJIEWUPIN_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DONGXIAOTUPOPINGJING_KAISHITUPO_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DONGXIAOTUPOPINGJING_CLOSE,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_BOW_SHIFOUXIANSHI_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_DONGXIAO_SHIFOUSHIXIANSHI_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_WUXING_SHOW_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHIBANG_WAIGUAN_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CHIBANG_HUADIE_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_EMOZHIYI_WAIGUAN_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_MOLINGZHIYI_WAIGUAN_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_RIJINLUN_WAIGUAN_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_MOLINGZHIYI_XUESEYUYI_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_YUEJINLUN_WAIGUAN_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_TENGTIANYI_WAIGUAN_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_TENGTIANYI_BANIANSHENWU_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_CANGJIANXUANTIAN_HUANZHUANG_CLICK,mainCharArrtibutePlaneHandle);
         });
      }
      
      private function mainCharArrtibutePlaneHandle(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Goods = null;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Boolean = false;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case Event.REMOVED_FROM_STAGE:
               this.mainCharArrtibutePlane.showDongxiaoTupopingjingPanel(false);
               this.stopAutoTupo();
               break;
            case CharAttribute.UI_DONGXIAOTUPOPINGJING_CLOSE:
               this.stopAutoTupo();
               break;
            case CharAttribute.DONGXIAO:
               if(!ReloginManager.isInKuafu && GameInstance.mainCharData.attributeInfo.lv < 68)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"你的等级未满68级，不能使用本功能");
                  NoticeManager.notify(NoticeManager.FOOT,"你的等级未满68级，不能使用本功能");
                  return;
               }
               this.mainCharArrtibutePlane.showDongxiao();
               this.msgSenderProxy.send_53801([GameInstance.mainChar.id,0]);
               break;
            case CharAttribute.UI_DONGXIAO_FANYE_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc4_ = Number(_loc3_.data);
               _loc5_ = this._dongxiaoInfo ? this._dongxiaoInfo.lv : 1;
               if(_loc4_ == -1 && _loc5_ <= 1)
               {
                  return;
               }
               if(_loc4_ == 1 && _loc5_ >= 28)
               {
                  return;
               }
               _loc5_ += _loc4_;
               this.msgSenderProxy.send_53801([GameInstance.mainChar.id,_loc5_]);
               break;
            case CharAttribute.UI_DONGXIAO_SHIFOUSHIYONGANQI_CLICK:
               _loc3_ = param1 as BaseEvent;
               this.msgSenderProxy.send_53807(Number(_loc3_.data));
               break;
            case CharAttribute.UI_DONGXIAO_TISHENGSUDU_CLICK:
               _loc6_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.DONGXIAO_TISU,true);
               this.mainCharArrtibutePlane.showDongxiaoTisuPanel([this._dongxiaoInfo.name,this._dongxiaoInfo.duan,this._dongxiaoInfo.nowXiulian + "/" + this._dongxiaoInfo.maxXiulian,_loc6_]);
               break;
            case CharAttribute.UI_DONGXIAO_TUPOPINGJING_CLICK:
               this.updateTupoUI();
               this.mainCharArrtibutePlane.showDongxiaoTupopingjingPanel(true);
               break;
            case CharAttribute.UI_DONGXIAO_XIULIANTISU_GOUMAI_CLICK:
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[SpecialGoodsID.DONGXIAO_TISU,0]);
               break;
            case CharAttribute.UI_DONGXIAOTUPOPINGJING_GOUMAISHENGJIEWUPIN_CLICK:
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[this._dongxiaoInfo.tupoGoodsID,0]);
               break;
            case CharAttribute.UI_DONGXIAO_XIULIANTISU_KAISHITISU_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc7_ = Number(_loc3_.data);
               if(_loc7_ == 1)
               {
                  _loc8_ = 1;
               }
               else
               {
                  _loc8_ = Math.max(1,GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.DONGXIAO_TISU,true));
               }
               this.mainCharArrtibutePlane.CloseDongxiaoXiuliantisuPanel();
               this.msgSenderProxy.send_53803(_loc8_);
               break;
            case CharAttribute.UI_DONGXIAOTUPOPINGJING_KAISHITUPO_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc9_ = Number(_loc3_.data);
               if(_loc9_ == 1)
               {
                  this.stopAutoTupo();
                  this.sendTupo();
               }
               else if(_loc9_ == 2)
               {
                  if(this._timer != null)
                  {
                     this.stopAutoTupo();
                  }
                  else
                  {
                     this.startAutoTupo();
                  }
               }
               else
               {
                  this.stopAutoTupo();
               }
               break;
            case CharAttribute.UI_BOW_SHIFOUXIANSHI_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc10_ = Boolean(_loc3_.data);
               if(_loc10_)
               {
                  this.mainCharArrtibutePlane.DongxiaoShow(false);
                  this.mainCharArrtibutePlane.WuXingZhiRenShow(false);
                  this.mainCharArrtibutePlane.ChiBangShow(0);
                  this.mainCharArrtibutePlane.EMoZhiYiShow(false);
                  this.mainCharArrtibutePlane.MoLingZhiYiShow(false);
                  this.mainCharArrtibutePlane.RijinlunShow(0);
                  this.mainCharArrtibutePlane.YuejinlunShow(0);
                  this.msgSenderProxy.send_53809(1);
               }
               else
               {
                  this.msgSenderProxy.send_53809(0);
               }
               break;
            case CharAttribute.UI_DONGXIAO_SHIFOUSHIXIANSHI_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc10_ = Boolean(_loc3_.data);
               if(_loc10_)
               {
                  this.mainCharArrtibutePlane.BowShow(false);
                  this.mainCharArrtibutePlane.WuXingZhiRenShow(false);
                  this.mainCharArrtibutePlane.ChiBangShow(0);
                  this.mainCharArrtibutePlane.EMoZhiYiShow(false);
                  this.mainCharArrtibutePlane.MoLingZhiYiShow(false);
                  this.mainCharArrtibutePlane.RijinlunShow(0);
                  this.mainCharArrtibutePlane.YuejinlunShow(0);
                  this.msgSenderProxy.send_53809(2);
               }
               else
               {
                  this.msgSenderProxy.send_53809(0);
               }
               break;
            case CharAttribute.UI_WUXING_SHOW_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc10_ = Boolean(_loc3_.data);
               if(_loc10_)
               {
                  this.mainCharArrtibutePlane.DongxiaoShow(false);
                  this.mainCharArrtibutePlane.BowShow(false);
                  this.mainCharArrtibutePlane.ChiBangShow(0);
                  this.mainCharArrtibutePlane.EMoZhiYiShow(false);
                  this.mainCharArrtibutePlane.MoLingZhiYiShow(false);
                  this.mainCharArrtibutePlane.RijinlunShow(0);
                  this.mainCharArrtibutePlane.YuejinlunShow(0);
                  this.msgSenderProxy.send_53809(3);
               }
               else
               {
                  this.msgSenderProxy.send_53809(0);
               }
               break;
            case CharAttribute.UI_CHIBANG_WAIGUAN_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc10_ = Boolean(_loc3_.data);
               if(_loc10_)
               {
                  this.mainCharArrtibutePlane.DongxiaoShow(false);
                  this.mainCharArrtibutePlane.BowShow(false);
                  this.mainCharArrtibutePlane.WuXingZhiRenShow(false);
                  this.mainCharArrtibutePlane.EMoZhiYiShow(false);
                  this.mainCharArrtibutePlane.MoLingZhiYiShow(false);
                  this.mainCharArrtibutePlane.ChiBangShow(1);
                  this.mainCharArrtibutePlane.RijinlunShow(0);
                  this.mainCharArrtibutePlane.YuejinlunShow(0);
                  this.msgSenderProxy.send_53809(4);
               }
               else
               {
                  this.msgSenderProxy.send_53809(0);
               }
               break;
            case CharAttribute.UI_CHIBANG_HUADIE_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc10_ = Boolean(_loc3_.data);
               if(_loc10_)
               {
                  this.mainCharArrtibutePlane.DongxiaoShow(false);
                  this.mainCharArrtibutePlane.BowShow(false);
                  this.mainCharArrtibutePlane.WuXingZhiRenShow(false);
                  this.mainCharArrtibutePlane.EMoZhiYiShow(false);
                  this.mainCharArrtibutePlane.MoLingZhiYiShow(false);
                  this.mainCharArrtibutePlane.ChiBangShow(2);
                  this.mainCharArrtibutePlane.RijinlunShow(0);
                  this.mainCharArrtibutePlane.YuejinlunShow(0);
                  this.msgSenderProxy.send_53809(7);
               }
               else
               {
                  this.msgSenderProxy.send_53809(0);
               }
               break;
            case CharAttribute.UI_EMOZHIYI_WAIGUAN_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc10_ = Boolean(_loc3_.data);
               if(_loc10_)
               {
                  this.mainCharArrtibutePlane.DongxiaoShow(false);
                  this.mainCharArrtibutePlane.BowShow(false);
                  this.mainCharArrtibutePlane.WuXingZhiRenShow(false);
                  this.mainCharArrtibutePlane.ChiBangShow(0);
                  this.mainCharArrtibutePlane.MoLingZhiYiShow(false);
                  this.mainCharArrtibutePlane.RijinlunShow(0);
                  this.mainCharArrtibutePlane.YuejinlunShow(0);
                  this.msgSenderProxy.send_53809(5);
               }
               else
               {
                  this.msgSenderProxy.send_53809(0);
               }
               break;
            case CharAttribute.UI_MOLINGZHIYI_WAIGUAN_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc10_ = Boolean(_loc3_.data);
               if(_loc10_)
               {
                  this.mainCharArrtibutePlane.DongxiaoShow(false);
                  this.mainCharArrtibutePlane.BowShow(false);
                  this.mainCharArrtibutePlane.WuXingZhiRenShow(false);
                  this.mainCharArrtibutePlane.ChiBangShow(0);
                  this.mainCharArrtibutePlane.EMoZhiYiShow(false);
                  this.mainCharArrtibutePlane.RijinlunShow(0);
                  this.mainCharArrtibutePlane.YuejinlunShow(0);
                  this.msgSenderProxy.send_53809(6);
               }
               else
               {
                  this.msgSenderProxy.send_53809(0);
               }
               break;
            case CharAttribute.UI_RIJINLUN_WAIGUAN_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc10_ = Boolean(_loc3_.data);
               if(_loc10_)
               {
                  this.mainCharArrtibutePlane.DongxiaoShow(false);
                  this.mainCharArrtibutePlane.BowShow(false);
                  this.mainCharArrtibutePlane.WuXingZhiRenShow(false);
                  this.mainCharArrtibutePlane.EMoZhiYiShow(false);
                  this.mainCharArrtibutePlane.MoLingZhiYiShow(false);
                  this.mainCharArrtibutePlane.ChiBangShow(0);
                  this.mainCharArrtibutePlane.RijinlunShow(1);
                  this.mainCharArrtibutePlane.YuejinlunShow(0);
                  this.msgSenderProxy.send_53809(8);
               }
               else
               {
                  this.msgSenderProxy.send_53809(0);
               }
               break;
            case CharAttribute.UI_YUEJINLUN_WAIGUAN_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc10_ = Boolean(_loc3_.data);
               if(_loc10_)
               {
                  this.mainCharArrtibutePlane.DongxiaoShow(false);
                  this.mainCharArrtibutePlane.BowShow(false);
                  this.mainCharArrtibutePlane.WuXingZhiRenShow(false);
                  this.mainCharArrtibutePlane.EMoZhiYiShow(false);
                  this.mainCharArrtibutePlane.MoLingZhiYiShow(false);
                  this.mainCharArrtibutePlane.ChiBangShow(0);
                  this.mainCharArrtibutePlane.RijinlunShow(0);
                  this.mainCharArrtibutePlane.YuejinlunShow(1);
                  this.msgSenderProxy.send_53809(9);
               }
               else
               {
                  this.msgSenderProxy.send_53809(0);
               }
               break;
            case CharAttribute.UI_TENGTIANYI_WAIGUAN_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc10_ = Boolean(_loc3_.data);
               if(_loc10_)
               {
                  this.mainCharArrtibutePlane.DongxiaoShow(false);
                  this.mainCharArrtibutePlane.BowShow(false);
                  this.mainCharArrtibutePlane.WuXingZhiRenShow(false);
                  this.mainCharArrtibutePlane.EMoZhiYiShow(false);
                  this.mainCharArrtibutePlane.MoLingZhiYiShow(false);
                  this.mainCharArrtibutePlane.ChiBangShow(0);
                  this.mainCharArrtibutePlane.RijinlunShow(0);
                  this.mainCharArrtibutePlane.YuejinlunShow(0);
                  this.msgSenderProxy.send_53809(101);
               }
               else
               {
                  this.msgSenderProxy.send_53809(0);
               }
               break;
            case CharAttribute.UI_TENGTIANYI_BANIANSHENWU_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc10_ = Boolean(_loc3_.data);
               if(_loc10_)
               {
                  this.mainCharArrtibutePlane.DongxiaoShow(false);
                  this.mainCharArrtibutePlane.BowShow(false);
                  this.mainCharArrtibutePlane.WuXingZhiRenShow(false);
                  this.mainCharArrtibutePlane.EMoZhiYiShow(false);
                  this.mainCharArrtibutePlane.MoLingZhiYiShow(false);
                  this.mainCharArrtibutePlane.ChiBangShow(0);
                  this.mainCharArrtibutePlane.RijinlunShow(0);
                  this.mainCharArrtibutePlane.YuejinlunShow(0);
                  this.msgSenderProxy.send_53809(102);
               }
               else
               {
                  this.msgSenderProxy.send_53809(0);
               }
               break;
            case CharAttribute.UI_CANGJIANXUANTIAN_HUANZHUANG_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc10_ = Boolean(_loc3_.data);
               if(_loc10_)
               {
                  this.mainCharArrtibutePlane.DongxiaoShow(false);
                  this.mainCharArrtibutePlane.WuXingZhiRenShow(false);
                  this.msgSenderProxy.send_53809(106);
               }
               else
               {
                  this.msgSenderProxy.send_53809(0);
               }
         }
      }
      
      private function updateTupoUI() : void
      {
         var _loc1_:Goods = new Goods(this._dongxiaoInfo.tupoGoodsID);
         _loc1_.count = this._dongxiaoInfo.tupoGoodsCount;
         var _loc2_:Boolean = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(this._dongxiaoInfo.tupoGoodsID,true) >= this._dongxiaoInfo.tupoGoodsCount;
         this.mainCharArrtibutePlane.setDongxiaoTupopingjingInitializeFun([this._dongxiaoInfo.name,this._dongxiaoInfo.duan,this._dongxiaoInfo.nowXiulian,this._dongxiaoInfo.maxXiulian,0,0,_loc1_,this._dongxiaoInfo.jilv,10000,this._dongxiaoInfo.nowXingyun,this._dongxiaoInfo.maxXingyun,this._dongxiaoInfo.nextXiaoName,this._dongxiaoInfo.duan + 1,null,null,true,true,_loc2_]);
      }
      
      private function startAutoTupo() : void
      {
         var str:String = LanResManager.getLanTextWords(this,"您希望自动使用背包中的道具提升洞箫境界",[StaticValue.RED_HTML,StaticValue.YELLOW_HTML]);
         FAlert.show(str,"",2,function(param1:FAlertEvent):void
         {
            if(param1.eventData == FAlert.OK)
            {
               sendTupo();
               if(_timer != null)
               {
                  _timer.stop();
                  _timer.removeEventListener(TimerEvent.TIMER,autoSendTupo);
               }
               _timer = new Timer(100);
               _timer.addEventListener(TimerEvent.TIMER,autoSendTupo);
               _timer.start();
               NoticeManager.notify(NoticeManager.FOOT,"已开始自动突破");
               mainCharArrtibutePlane.setDongXiaoZdtsBtnLabel(false);
            }
         });
      }
      
      private function stopAutoTupo(param1:String = null) : void
      {
         if(this._timer != null)
         {
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER,this.autoSendTupo);
            this._timer = null;
            NoticeManager.notify(NoticeManager.FOOT,param1 != null ? param1 : LanResManager.getLanCommonTextWords("已停止自动突破"),false);
            this.mainCharArrtibutePlane.setDongXiaoZdtsBtnLabel(true);
         }
      }
      
      private function autoSendTupo(param1:TimerEvent = null) : void
      {
         this.sendTupo();
      }
      
      private function sendTupo() : void
      {
         this.msgSenderProxy.send_53805(this.mainCharArrtibutePlane.useDongxiaoGoodsType);
      }
      
      public function received_dongxiaoInfo(param1:DongXiaoInfo, param2:int) : void
      {
         this._dongxiaoInfo = param1;
         this.mainCharArrtibutePlane.setDongxiaoDengji(this._dongxiaoInfo.duan + LanResManager.getLanCommonTextWords("段") + "(" + DongXiaoInfo.getShowLv(this._dongxiaoInfo.lv) + "/" + 4 + ")");
         this.mainCharArrtibutePlane.setDongxiaoJindu(this._dongxiaoInfo.nowXiulian,this._dongxiaoInfo.maxXiulian,this._dongxiaoInfo.nowXiulian == this._dongxiaoInfo.maxXiulian ? this._dongxiaoInfo.status == 2 : this._dongxiaoInfo.status == 1);
         this.mainCharArrtibutePlane.setDongxiaoJianshu(this._dongxiaoInfo.skillArr);
         this.mainCharArrtibutePlane.setDongxiaoShuxing(this._dongxiaoInfo.name,this._dongxiaoInfo.duan,DongXiaoInfo.getShowLv(this._dongxiaoInfo.lv),[this._dongxiaoInfo.add_ap,this._dongxiaoInfo.add_dp,this._dongxiaoInfo.add_hp,this._dongxiaoInfo.add_mp,this._dongxiaoInfo.add_pp]);
         this.mainCharArrtibutePlane.setYCSX(this._dongxiaoInfo.isJihuo);
         this.mainCharArrtibutePlane.setDongxiaoMiaoshu(this._dongxiaoInfo.des);
         this.mainCharArrtibutePlane.setUse(this._dongxiaoInfo.isOpen);
         if(this._dongxiaoInfo.status != 2)
         {
            this.mainCharArrtibutePlane.showDongxiaoTupopingjingPanel(false);
            this.stopAutoTupo();
         }
         else
         {
            if(param2 == 2 && this._timer != null)
            {
               this.stopAutoTupo();
            }
            this.updateTupoUI();
         }
         this.mainCharArrtibutePlane.DongxiaoShow(this._dongxiaoInfo.visible);
         this.mainCharArrtibutePlane.setZhanyin(this._dongxiaoInfo.isZhanyin);
      }
      
      public function received_canTupo() : void
      {
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_CHUI_XIAO_UP,this.msgSenderProxy.send_53801);
      }
      
      public function initializeMainUI(param1:DongXiaoInfo) : void
      {
         var _loc2_:Boolean = false;
         if(param1.duan >= 7 && DongXiaoInfo.getShowLv(param1.lv) >= 4)
         {
            _loc2_ = true;
         }
         else
         {
            _loc2_ = false;
         }
         this.mainCharArrtibutePlane.setDongxiaoJinduNum(param1.jihuoJindu,_loc2_);
         var _loc3_:String = "";
         if(param1.jihuoJindu > 0)
         {
            _loc3_ = "<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击:") + param1.addJihuoGongji + " " + LanResManager.getLanCommonTextWords("防御:") + param1.addJihuoFangyu + " " + LanResManager.getLanCommonTextWords("生命:") + param1.addJihuoShengming + "</font>";
         }
         else
         {
            _loc3_ = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("洞箫顶级激活属性（未激活）") + "</font>";
         }
         this.mainCharArrtibutePlane.menuDongxiaoToolTip(_loc3_);
      }
      
      private function setChiBangShowFalse() : void
      {
         this.mainCharArrtibutePlane.DongxiaoShow(false);
         this.mainCharArrtibutePlane.BowShow(false);
         this.mainCharArrtibutePlane.WuXingZhiRenShow(false);
         this.mainCharArrtibutePlane.EMoZhiYiShow(false);
         this.mainCharArrtibutePlane.MoLingZhiYiShow(false);
         this.mainCharArrtibutePlane.ChiBangShow(0);
         this.mainCharArrtibutePlane.RijinlunShow(0);
         this.mainCharArrtibutePlane.YuejinlunShow(0);
      }
   }
}

