package com.tgame.moudels.lianti.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.lianti.LiantiRes;
   import com.tgame.common.res.lianti.LiantiResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Buff;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.lianti.Lianti_ApplicationFacade;
   import com.tgame.moudels.lianti.model.Lianti_MsgSenderProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.huodong.JiHuoRouShenShuXingPanel;
   import com.tgame.shell.view.components.huodong.JihuoRouShenDaJinLongShuXingPanel;
   import com.tgame.shell.view.components.huodong.JihuoRoutijinshenPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.TimerManager;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Lianti_MaincharLiantiPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Lianti_MaincharLiantiPanelMediator";
      
      private var _autoTisheng:Boolean = false;
      
      private var _currentLookLiantiID:int = 1;
      
      private var _useTishengType:int = 0;
      
      private var _jiuhoPanel:JiHuoRouShenShuXingPanel;
      
      private var _jiuhoJinlongPanel:JihuoRouShenDaJinLongShuXingPanel;
      
      private var _jihuoRoutijinshenPanell:JihuoRoutijinshenPanel;
      
      private var _msgSenderProxy:Lianti_MsgSenderProxy;
      
      public function Lianti_MaincharLiantiPanelMediator()
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
      
      private function get msgSenderProxy() : Lianti_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Lianti_MsgSenderProxy.NAME) as Lianti_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Lianti_ApplicationFacade.ROUSHEN_DINGJI_JIHUO_SHUXING,Lianti_ApplicationFacade.ROUSHEN_MOHUA];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Lianti_ApplicationFacade.ROUSHEN_DINGJI_JIHUO_SHUXING:
               if(_loc2_.type == 7)
               {
                  this.msgSenderProxy.send_53001(GameInstance.mainChar.id);
               }
               break;
            case Lianti_ApplicationFacade.ROUSHEN_MOHUA:
               this.updateLiantiUI(GameInstance.mainCharData.attributeInfo.currentLiantiID);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETDUANZAOROUSHEN,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SMITHINGBODY_MENU_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SMITHINGBODY_TISHENGROUSHENJINGJIE_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SMITHINGBODY_SHANGYIYE_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SMITHINGBODY_XIAYIYE_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_GOUMAI_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_KAISHITISHENG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_PUTIJINGCUI_CHECK_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SMITHINGBODY_JIHUO_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SMITHINGBODY_JIHUODAJINLONG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_ROUTIJINSHEN_JIHUODAJINLONG_CLICK,mainCharArrtibutePlaneHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETDUANZAOROUSHEN,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SMITHINGBODY_MENU_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SMITHINGBODY_TISHENGROUSHENJINGJIE_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SMITHINGBODY_SHANGYIYE_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SMITHINGBODY_XIAYIYE_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_GOUMAI_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_KAISHITISHENG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_PUTIJINGCUI_CHECK_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SMITHINGBODY_JIHUO_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SMITHINGBODY_JIHUODAJINLONG_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_ROUTIJINSHEN_JIHUODAJINLONG_CLICK,mainCharArrtibutePlaneHandle);
         });
      }
      
      private function mainCharArrtibutePlaneHandle(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var lookID:int = 0;
         var buff:Buff = null;
         var liantiRes:LiantiRes = null;
         var tupoGoods:Goods = null;
         var goodsPutijingcuiNum:int = 0;
         var shenqiPutidanCount:int = 0;
         var count:int = 0;
         var str:String = null;
         var e:Event = param1;
         var type:String = e.type;
         switch(type)
         {
            case Event.REMOVED_FROM_STAGE:
               this._autoTisheng = false;
               NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"已停止自动提升"),false);
               NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"已停止自动提升"),false);
               this.mainCharArrtibutePlane.setRoushenZdtsBtnLabel(true);
               break;
            case CharAttribute.GETDUANZAOROUSHEN:
               this.mainCharArrtibutePlane.setRouti(GameInstance.mainCharData.attributeInfo.isJiHuoRoutiJinshen);
               this.mainCharArrtibutePlane.showSmithingBody();
               this.updateLiantiUI(GameInstance.mainCharData.attributeInfo.currentLiantiID);
               if(GameState.gongneng157)
               {
                  this.mainCharArrtibutePlane.setSmithingBodyBuff([new Buff(OtherConst.BUFF_CJMHPTK),new Buff(OtherConst.BUFF_RSTIZFSJ)]);
               }
               else
               {
                  this.mainCharArrtibutePlane.setSmithingBodyBuff([]);
               }
               break;
            case CharAttribute.UI_SMITHINGBODY_MENU_CLICK:
               evt = e as BaseEvent;
               lookID = evt.data as int;
               if(lookID >= 1)
               {
                  this.updateLiantiUI(lookID);
               }
               break;
            case CharAttribute.UI_SMITHINGBODY_TISHENGROUSHENJINGJIE_CLICK:
               this.mainCharArrtibutePlane.onShowLv(true);
               this.mainCharArrtibutePlane.showDuantijindan(null);
               buff = GameInstance.mainCharData.buffInfo.getBuff(OtherConst.BUFF_LIANTIJINDAN);
               if(buff != null)
               {
                  this.mainCharArrtibutePlane.showDuantijindan(buff);
               }
               this.msgSenderProxy.send_53003(GameInstance.mainCharData.attributeInfo.currentLiantiID);
               break;
            case CharAttribute.UI_SMITHINGBODY_SHANGYIYE_CLICK:
               if(this._currentLookLiantiID > 1)
               {
                  this.updateLiantiUI(this._currentLookLiantiID - 1);
               }
               break;
            case CharAttribute.UI_SMITHINGBODY_XIAYIYE_CLICK:
               if(this._currentLookLiantiID < LiantiResManager.MAX_LIANTI_LV)
               {
                  this.updateLiantiUI(this._currentLookLiantiID + 1);
               }
               break;
            case CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_GOUMAI_CLICK:
               liantiRes = LiantiResManager.getLiantiRes(GameInstance.mainCharData.attributeInfo.currentLiantiID);
               if(liantiRes != null)
               {
                  PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[liantiRes.f_tupo_need_goodsmodel,0]);
               }
               break;
            case CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_PUTIJINGCUI_CHECK_CLICK:
               evt = e as BaseEvent;
               this._useTishengType = evt.data as int;
               if(this._useTishengType == 1)
               {
                  if(GameInstance.mainCharData.attributeInfo.currentLiantiID >= 4)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您选择了使用1个菩提精萃"));
                  }
                  else
                  {
                     this._useTishengType = 0;
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"菩提精萃可以代替菩提丹来进行肉身境界的提升"));
                  }
               }
               else if(this._useTishengType == 2)
               {
                  if(GameInstance.mainCharData.attributeInfo.currentLiantiID >= 4)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您选择了使用神奇菩提丹"));
                  }
                  else
                  {
                     this._useTishengType = 0;
                     this.mainCharArrtibutePlane.showPuTiDanTipCanvas(1);
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"肉身境界尚未到达4阶时无法使用神奇菩提丹"));
                  }
               }
               liantiRes = LiantiResManager.getLiantiRes(GameInstance.mainCharData.attributeInfo.currentLiantiID);
               if(liantiRes != null)
               {
                  tupoGoods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(liantiRes.f_tupo_need_goodsmodel,true);
                  goodsPutijingcuiNum = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.PUTI_JINGCUI_ID,true);
                  shenqiPutidanCount = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.SHENQI_PUTI_DAN,true);
                  count = liantiRes.f_tupo_need_goodscount;
                  if(this._useTishengType == 1)
                  {
                     count--;
                     if(goodsPutijingcuiNum <= 0)
                     {
                        this._useTishengType = 0;
                        NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您的背包中没有菩提精萃"));
                     }
                  }
                  else if(this._useTishengType == 2)
                  {
                     count = 0;
                     if(shenqiPutidanCount > 0)
                     {
                        this.mainCharArrtibutePlane.showPuTiDanTipCanvas(3);
                     }
                     else
                     {
                        this._useTishengType = 0;
                        this.mainCharArrtibutePlane.showPuTiDanTipCanvas(2);
                        NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您的背包中没有神奇菩提丹"));
                     }
                  }
                  this.mainCharArrtibutePlane.setCheck(this._useTishengType == 1);
                  this.mainCharArrtibutePlane.setIsUsePuTiDan(this._useTishengType == 2);
                  this.mainCharArrtibutePlane.setChenggonglv(count,liantiRes.f_tupo_show_probability / 10000 * 100,tupoGoods.res.name);
               }
               break;
            case CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_KAISHITISHENG_CLICK:
               this._autoTisheng = false;
               this.msgSenderProxy.send_53005([GameInstance.mainCharData.attributeInfo.currentLiantiID,this._useTishengType]);
               break;
            case CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLICK:
               evt = e as BaseEvent;
               if(evt.data != null && evt.data as Boolean == false)
               {
                  this._autoTisheng = false;
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"已停止自动提升"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"已停止自动提升"),false);
                  this.mainCharArrtibutePlane.setRoushenZdtsBtnLabel(true);
                  return;
               }
               if(this._autoTisheng != true)
               {
                  str = LanResManager.getLanTextWords(this,"您希望自动使用背包中的菩提丹提升肉体境界",[StaticValue.RED_HTML,StaticValue.YELLOW_HTML,StaticValue.BLUE_HTML]);
                  FAlert.show(str,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        if(_useTishengType != 2)
                        {
                           _autoTisheng = true;
                           NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"已开始自动提升！"),false);
                           NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"已开始自动提升!"),false);
                           msgSenderProxy.send_53005([GameInstance.mainCharData.attributeInfo.currentLiantiID,_useTishengType]);
                           mainCharArrtibutePlane.setRoushenZdtsBtnLabel(false);
                        }
                        else
                        {
                           _autoTisheng = false;
                           NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"使用神奇菩提丹只能手动提升"),false);
                           NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"使用神奇菩提丹只能手动提升"),false);
                        }
                     }
                  });
               }
               else
               {
                  this._autoTisheng = false;
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"已停止自动提升"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"已停止自动提升"),false);
                  this.mainCharArrtibutePlane.setRoushenZdtsBtnLabel(true);
               }
               break;
            case CharAttribute.UI_SMITHINGBODY_JIHUO_CLICK:
               this.showJihuoPanel();
               break;
            case CharAttribute.UI_SMITHINGBODY_JIHUODAJINLONG_CLICK:
               this.showJihuoDajinlongPanel();
               break;
            case CharAttribute.UI_ROUTIJINSHEN_JIHUODAJINLONG_CLICK:
               PipeManager.sendMsg(PipeConstants.NPC_REQ_FUNCTION,NpcFunctionType.JIHUO_ROUTIJINSHEN);
         }
      }
      
      public function f5() : void
      {
         if(this._currentLookLiantiID != GameInstance.mainCharData.attributeInfo.currentLiantiID)
         {
            return;
         }
         this.updateLiantiUI(this._currentLookLiantiID);
      }
      
      public function updateLiantiUI(param1:int, param2:Array = null, param3:Boolean = false, param4:Boolean = false, param5:Array = null) : void
      {
         var _loc9_:LiantiRes = null;
         var _loc14_:String = null;
         var _loc15_:LiantiRes = null;
         var _loc16_:LiantiRes = null;
         var _loc17_:GoodsRes = null;
         var _loc6_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ROUSHEN_LIUJINYANMO_ID] != undefined)
         {
            _loc6_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_ROUSHEN_LIUJINYANMO_ID]);
         }
         this.mainCharArrtibutePlane.set_RouShen(_loc6_);
         this.mainCharArrtibutePlane.onShowLv(false);
         this.mainCharArrtibutePlane.setIsShowUsePuTiJingCui(GameState.gongneng112);
         this.mainCharArrtibutePlane.setIsShowUsePuTiDan(GameState.gongneng113);
         this._autoTisheng = false;
         if(param2 != null)
         {
            GameInstance.mainCharData.attributeInfo.currentLiantiID = param1;
            this._currentLookLiantiID = param1;
            this.mainCharArrtibutePlane.setJindu(GameInstance.mainCharData.attributeInfo.currentLiantiID);
            this.mainCharArrtibutePlane.setJihuo(param3);
            this.mainCharArrtibutePlane.setJihuoDajinlong(param4);
            this.mainCharArrtibutePlane.setIsJihuoMohua(param5);
            this.mainCharArrtibutePlane.setICORouti(GameInstance.mainCharData.attributeInfo.isJiHuoRoutiJinshen);
            if(param4 == true)
            {
               this.mainCharArrtibutePlane.loadLongPicture();
            }
         }
         else
         {
            if(param1 < 1 || param1 > LiantiResManager.MAX_LIANTI_LV)
            {
               return;
            }
            this._currentLookLiantiID = param1;
         }
         var _loc7_:LiantiRes = LiantiResManager.getLiantiRes(this._currentLookLiantiID);
         var _loc8_:GoodsRes = GoodsResManager.getGoodsRes(_loc7_.f_tupo_need_goodsmodel);
         if(this._currentLookLiantiID != LiantiResManager.MAX_LIANTI_LV)
         {
            _loc9_ = LiantiResManager.getLiantiRes(this._currentLookLiantiID + 1);
         }
         var _loc10_:Array = [];
         var _loc11_:int = 1;
         while(_loc11_ <= LiantiResManager.MAX_LIANTI_LV)
         {
            _loc14_ = "";
            _loc15_ = LiantiResManager.getLiantiRes(_loc11_);
            _loc14_ += LanResManager.getLanTextWords(this,"肉身境界",[StaticValue.BLUE_HTML,_loc15_.f_name]);
            if(_loc11_ < GameInstance.mainCharData.attributeInfo.currentLiantiID)
            {
               _loc14_ += LanResManager.getLanTextWords(this,"铸造状态",[StaticValue.GREEN_HTML]);
            }
            else if(_loc11_ == GameInstance.mainCharData.attributeInfo.currentLiantiID)
            {
               _loc14_ += LanResManager.getLanTextWords(this,"铸造状态1",[StaticValue.ORANGE_HTML]);
            }
            else
            {
               _loc14_ += LanResManager.getLanTextWords(this,"铸造状态2",[StaticValue.RED_HTML]);
            }
            _loc14_ += LanResManager.getLanTextWords(this,"境界描述",[StaticValue.GREEN_HTML,_loc15_.f_desc]);
            if(_loc11_ != LiantiResManager.MAX_LIANTI_LV)
            {
               _loc16_ = LiantiResManager.getLiantiRes(_loc11_ + 1);
               _loc17_ = GoodsResManager.getGoodsRes(_loc15_.f_tupo_need_goodsmodel);
               _loc14_ += LanResManager.getLanTextWords(this,"境界提升",[StaticValue.ORANGE_HTML,StaticValue.BLUE_HTML,_loc17_.name,StaticValue.BLUE_HTML,_loc16_.f_name]);
            }
            _loc10_.push(_loc14_);
            _loc11_++;
         }
         this.mainCharArrtibutePlane.menuToolTip(_loc10_);
         this.mainCharArrtibutePlane.setJingjie(_loc7_.f_name);
         this.mainCharArrtibutePlane.setRouti(GameInstance.mainCharData.attributeInfo.isJiHuoRoutiJinshen);
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = false;
         if(param2 != null)
         {
            _loc12_ = param2[0] == _loc7_.f_hp && param2[1] == _loc7_.f_mp && param2[2] == _loc7_.f_sp && param2[3] == _loc7_.f_atk && param2[4] == _loc7_.f_def && param2[5] == _loc7_.f_atk_speed && param2[6] == _loc7_.f_move_speed && param2[7] == _loc7_.f_fjsh && param2[8] == _loc7_.f_shjm && param2[9] == _loc7_.f_aq_jv;
            _loc13_ = (_loc12_) && GameInstance.mainCharData.attributeInfo.currentLiantiID != LiantiResManager.MAX_LIANTI_LV;
            this.mainCharArrtibutePlane.setBar1(_loc7_.f_hp > 0,param2[0],_loc7_.f_hp);
            this.mainCharArrtibutePlane.setBar2(_loc7_.f_mp > 0,param2[1],_loc7_.f_mp);
            this.mainCharArrtibutePlane.setBar3(_loc7_.f_sp > 0,param2[2],_loc7_.f_sp);
            this.mainCharArrtibutePlane.setBar4(_loc7_.f_atk > 0,param2[3],_loc7_.f_atk);
            this.mainCharArrtibutePlane.setBar5(_loc7_.f_def > 0,param2[4],_loc7_.f_def);
            this.mainCharArrtibutePlane.setBar6(_loc7_.f_atk_speed > 0,param2[5],_loc7_.f_atk_speed);
            this.mainCharArrtibutePlane.setBar7(_loc7_.f_move_speed > 0,param2[6],_loc7_.f_move_speed);
            this.mainCharArrtibutePlane.setBar8(_loc7_.f_fjsh > 0,param2[7],_loc7_.f_fjsh);
            this.mainCharArrtibutePlane.setBar9(_loc7_.f_shjm > 0,param2[8],_loc7_.f_shjm);
            this.mainCharArrtibutePlane.setBar10(_loc7_.f_aq_jv > 0,param2[9],_loc7_.f_aq_jv);
         }
         else
         {
            _loc12_ = this._currentLookLiantiID < GameInstance.mainCharData.attributeInfo.currentLiantiID;
            _loc13_ = false;
            this.mainCharArrtibutePlane.setBar1(_loc7_.f_hp > 0,_loc12_ ? _loc7_.f_hp : 0,_loc7_.f_hp);
            this.mainCharArrtibutePlane.setBar2(_loc7_.f_mp > 0,_loc12_ ? _loc7_.f_mp : 0,_loc7_.f_mp);
            this.mainCharArrtibutePlane.setBar3(_loc7_.f_sp > 0,_loc12_ ? _loc7_.f_sp : 0,_loc7_.f_sp);
            this.mainCharArrtibutePlane.setBar4(_loc7_.f_atk > 0,_loc12_ ? _loc7_.f_atk : 0,_loc7_.f_atk);
            this.mainCharArrtibutePlane.setBar5(_loc7_.f_def > 0,_loc12_ ? _loc7_.f_def : 0,_loc7_.f_def);
            this.mainCharArrtibutePlane.setBar6(_loc7_.f_atk_speed > 0,_loc12_ ? _loc7_.f_atk_speed : 0,_loc7_.f_atk_speed);
            this.mainCharArrtibutePlane.setBar7(_loc7_.f_move_speed > 0,_loc12_ ? _loc7_.f_move_speed : 0,_loc7_.f_move_speed);
            this.mainCharArrtibutePlane.setBar8(_loc7_.f_fjsh > 0,_loc12_ ? _loc7_.f_fjsh : 0,_loc7_.f_fjsh);
            this.mainCharArrtibutePlane.setBar9(_loc7_.f_shjm > 0,_loc12_ ? _loc7_.f_shjm : 0,_loc7_.f_shjm);
            this.mainCharArrtibutePlane.setBar10(_loc7_.f_aq_jv > 0,_loc12_ ? _loc7_.f_aq_jv : 0,_loc7_.f_aq_jv);
         }
         this.mainCharArrtibutePlane.setMiaoshu(LiantiResManager.getLiantiMainDes(this._currentLookLiantiID));
         this.mainCharArrtibutePlane.setPage(this._currentLookLiantiID,LiantiResManager.MAX_LIANTI_LV,_loc12_);
         this.mainCharArrtibutePlane.setIsEnabled(_loc13_);
         this.mainCharArrtibutePlane.okBtnToolTip("");
         if(this._currentLookLiantiID != LiantiResManager.MAX_LIANTI_LV)
         {
            _loc14_ = "";
            _loc14_ = _loc14_ + LanResManager.getLanTextWords(this,"提升肉身境界以便能够获得更多的属性加成",[_loc8_.name,_loc9_.f_name]);
            if(_loc9_.f_hp > 0)
            {
               _loc14_ += "\n" + LanResManager.getLanCommonTextWords("生命") + " +" + _loc9_.f_hp;
            }
            if(_loc9_.f_mp > 0)
            {
               _loc14_ += "\n" + LanResManager.getLanCommonTextWords("内力") + " +" + _loc9_.f_mp;
            }
            if(_loc9_.f_sp > 0)
            {
               _loc14_ += "\n" + LanResManager.getLanCommonTextWords("体力") + " +" + _loc9_.f_sp;
            }
            if(_loc9_.f_atk > 0)
            {
               _loc14_ += "\n" + LanResManager.getLanCommonTextWords("攻击") + " +" + _loc9_.f_atk;
            }
            if(_loc9_.f_def > 0)
            {
               _loc14_ += "\n" + LanResManager.getLanCommonTextWords("防御") + " +" + _loc9_.f_def;
            }
            if(_loc9_.f_atk_speed > 0)
            {
               _loc14_ += "\n" + LanResManager.getLanCommonTextWords("攻击速度") + " +" + _loc9_.f_atk_speed;
            }
            if(_loc9_.f_move_speed > 0)
            {
               _loc14_ += "\n" + LanResManager.getLanCommonTextWords("移动速度") + " +" + _loc9_.f_move_speed;
            }
            if(_loc9_.f_fjsh > 0)
            {
               _loc14_ += "\n" + LanResManager.getLanCommonTextWords("反弹伤害") + " +" + _loc9_.f_fjsh;
            }
            if(_loc9_.f_shjm > 0)
            {
               _loc14_ += "\n" + LanResManager.getLanCommonTextWords("伤害减免") + " +" + _loc9_.f_shjm;
            }
            if(_loc9_.f_aq_jv > 0)
            {
               _loc14_ += "\n" + LanResManager.getLanCommonTextWords("暗器发送几率") + " +" + _loc9_.f_aq_jv;
            }
            this.mainCharArrtibutePlane.okBtnToolTip(_loc14_);
         }
         if(param2 == null && this._currentLookLiantiID == GameInstance.mainCharData.attributeInfo.currentLiantiID)
         {
            this.msgSenderProxy.send_53001(GameInstance.mainChar.id);
         }
      }
      
      public function updateTishengLiantiUI(param1:int, param2:int, param3:int) : void
      {
         var _loc5_:Goods = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         if(param1 != this._currentLookLiantiID || param1 != GameInstance.mainCharData.attributeInfo.currentLiantiID)
         {
            return;
         }
         var _loc4_:LiantiRes = LiantiResManager.getLiantiRes(GameInstance.mainCharData.attributeInfo.currentLiantiID);
         if(_loc4_ != null)
         {
            _loc5_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc4_.f_tupo_need_goodsmodel,true);
            _loc6_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.PUTI_JINGCUI_ID,true);
            _loc7_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.SHENQI_PUTI_DAN,true);
            _loc8_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(_loc4_.f_tupo_need_goodsmodel,true);
            _loc5_.count = _loc8_;
            this.mainCharArrtibutePlane.setPudidan(_loc5_);
            this.mainCharArrtibutePlane.setZhufuzhi(param2,_loc4_.f_zhufu_max);
            _loc9_ = _loc4_.f_tupo_need_goodscount;
            if(this._useTishengType == 1)
            {
               _loc9_--;
               if(_loc6_ <= 0)
               {
                  this._useTishengType = 0;
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您的背包中没有菩提精萃"));
               }
            }
            else if(this._useTishengType == 2)
            {
               _loc9_ = 0;
               if(_loc7_ > 0)
               {
                  this.mainCharArrtibutePlane.showPuTiDanTipCanvas(3);
               }
               else
               {
                  this._useTishengType = 0;
                  this.mainCharArrtibutePlane.showPuTiDanTipCanvas(2);
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您的背包中没有神奇菩提丹"));
               }
            }
            this.mainCharArrtibutePlane.setCheck(this._useTishengType == 1);
            this.mainCharArrtibutePlane.setIsUsePuTiDan(this._useTishengType == 2);
            this.mainCharArrtibutePlane.setChenggonglv(_loc9_,_loc4_.f_tupo_show_probability / 10000 * 100,_loc5_.res.name);
            this.mainCharArrtibutePlane.setCountDown(param3);
            this.mainCharArrtibutePlane.setAdvanceMiaoshu(_loc4_.f_desc_tupo);
         }
      }
      
      public function updateTishengSucc(param1:int) : void
      {
         if(param1 != GameInstance.mainCharData.attributeInfo.currentLiantiID)
         {
            return;
         }
         this.mainCharArrtibutePlane.onShowLv(false);
         this._autoTisheng = false;
         this.mainCharArrtibutePlane.setRoushenZdtsBtnLabel(true);
         NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"炼体提升成功"),false);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"炼体提升成功"),false);
         this.msgSenderProxy.send_53001(GameInstance.mainChar.id);
      }
      
      public function updateTishengFail(param1:int, param2:int, param3:String) : void
      {
         var liantiRes:LiantiRes = null;
         var goodsNum:int = 0;
         var goodsPutijingcuiNum:int = 0;
         var shenqiPutidanCount:int = 0;
         var count:int = 0;
         var enoughPutijingcui:Boolean = false;
         var failType:int = param1;
         var $liantiID:int = param2;
         var $failStr:String = param3;
         if($liantiID != GameInstance.mainCharData.attributeInfo.currentLiantiID)
         {
            return;
         }
         NoticeManager.notify(NoticeManager.FOOT,$failStr);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,$failStr);
         this.msgSenderProxy.send_53003(GameInstance.mainCharData.attributeInfo.currentLiantiID);
         if(failType == 2 && this._autoTisheng)
         {
            this._autoTisheng = false;
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您的包裹中没有足够突破道具已停止自动提升炼体"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"您的包裹中没有足够突破道具已停止自动提升炼体"),false);
            this.mainCharArrtibutePlane.setRoushenZdtsBtnLabel(true);
         }
         if(this._autoTisheng)
         {
            liantiRes = LiantiResManager.getLiantiRes($liantiID);
            goodsNum = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(liantiRes.f_tupo_need_goodsmodel,true);
            goodsPutijingcuiNum = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.PUTI_JINGCUI_ID,true);
            shenqiPutidanCount = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.SHENQI_PUTI_DAN,true);
            count = liantiRes.f_tupo_need_goodscount;
            enoughPutijingcui = true;
            if(this._useTishengType == 1)
            {
               count--;
               enoughPutijingcui = goodsPutijingcuiNum >= 1;
               if(goodsPutijingcuiNum <= 0)
               {
                  this._useTishengType = 0;
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您的背包中没有菩提精萃"));
               }
            }
            else if(this._useTishengType == 2)
            {
               count = 0;
               if(shenqiPutidanCount > 0)
               {
                  this.mainCharArrtibutePlane.showPuTiDanTipCanvas(3);
               }
               else
               {
                  this._useTishengType = 0;
                  this.mainCharArrtibutePlane.showPuTiDanTipCanvas(2);
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您的背包中没有神奇菩提丹"));
               }
            }
            this.mainCharArrtibutePlane.setCheck(this._useTishengType == 1);
            this.mainCharArrtibutePlane.setIsUsePuTiDan(this._useTishengType == 2);
            TimerManager.createOneOffTimer(300,1,function():void
            {
               if($liantiID == GameInstance.mainCharData.attributeInfo.currentLiantiID && $liantiID > 0 && $liantiID < LiantiResManager.MAX_LIANTI_LV)
               {
                  if(_useTishengType != 2)
                  {
                     msgSenderProxy.send_53005([$liantiID,_useTishengType]);
                  }
                  else
                  {
                     _autoTisheng = false;
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(Lianti_MaincharLiantiPanelMediator,"使用神奇菩提丹只能手动提升"),false);
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(Lianti_MaincharLiantiPanelMediator,"使用神奇菩提丹只能手动提升"),false);
                  }
               }
            });
         }
      }
      
      private function showJihuoPanel() : void
      {
         var goods:Goods;
         if(this._jiuhoPanel == null)
         {
            this._jiuhoPanel = new JiHuoRouShenShuXingPanel();
            this._jiuhoPanel.addEventListener(JiHuoRouShenShuXingPanel.UI_JIHUOSHUXING_CLICK,function(param1:Event):void
            {
               msgSenderProxy.send_53009();
            });
         }
         goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.WUZITIANSHU_SHANG,true);
         this._jiuhoPanel.setGoods1(goods);
         goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.WUZITIANSHU_XIA,true);
         this._jiuhoPanel.setGoods2(goods);
         this._jiuhoPanel.x = (GameConfig.sceneWidth - this._jiuhoPanel.width) / 2;
         this._jiuhoPanel.y = (GameConfig.sceneHeight - this._jiuhoPanel.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this._jiuhoPanel);
      }
      
      private function showJihuoDajinlongPanel() : void
      {
         var goods:Goods;
         if(this._jiuhoJinlongPanel == null)
         {
            this._jiuhoJinlongPanel = new JihuoRouShenDaJinLongShuXingPanel();
            this._jiuhoJinlongPanel.addEventListener(JihuoRouShenDaJinLongShuXingPanel.UI_JIHUODAJINLONGSHUXING_CLICK,function(param1:Event):void
            {
               msgSenderProxy.send_53015();
            });
         }
         goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.ROUSHENLONGHUNSHI_SHANG,true);
         this._jiuhoJinlongPanel.setGoods(goods);
         this._jiuhoJinlongPanel.x = (GameConfig.sceneWidth - this._jiuhoJinlongPanel.width) / 2;
         this._jiuhoJinlongPanel.y = (GameConfig.sceneHeight - this._jiuhoJinlongPanel.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this._jiuhoJinlongPanel);
      }
      
      private function showRoutiJinshenPanel() : void
      {
         var goods:Goods;
         if(this._jihuoRoutijinshenPanell == null)
         {
            this._jihuoRoutijinshenPanell = new JihuoRoutijinshenPanel();
            this._jihuoRoutijinshenPanell.addEventListener(JiHuoRouShenShuXingPanel.UI_JIHUOSHUXING_CLICK,function(param1:Event):void
            {
               msgSenderProxy.send_53015();
            });
         }
         goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.BUXIU_JINDAN,true);
         this._jihuoRoutijinshenPanell.setInitialize(goods,100);
         this._jihuoRoutijinshenPanell.x = (GameConfig.sceneWidth - this._jihuoRoutijinshenPanell.width) / 2;
         this._jihuoRoutijinshenPanell.y = (GameConfig.sceneHeight - this._jihuoRoutijinshenPanell.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this._jihuoRoutijinshenPanell);
      }
      
      public function initializeMainUI(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:Boolean = false;
         if(param1 >= 8)
         {
            _loc6_ = true;
         }
         else
         {
            _loc6_ = false;
         }
         this.mainCharArrtibutePlane.setRoushenJinduNum(param2,_loc6_);
         var _loc7_:String = "";
         if(param2 > 0)
         {
            _loc7_ = "<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击:") + param3 + " " + LanResManager.getLanCommonTextWords("防御:") + param4 + " " + LanResManager.getLanCommonTextWords("生命:") + param5 + "</font>";
         }
         else
         {
            _loc7_ = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("肉身顶级激活属性（未激活）") + "</font>";
         }
         this.mainCharArrtibutePlane.menuRoushenJinduToolTip(_loc7_);
      }
      
      public function zuoqi(param1:Boolean) : void
      {
         this.mainCharArrtibutePlane.roushenzuoqi(param1);
      }
   }
}

