package com.tgame.moudels.baguazhang.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.baguazhang.BaGuaZhangRESManager;
   import com.tgame.common.res.baguazhang.BaGuaZhangRes;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.baguazhang.BaGuaZhang_ApplicationFacade;
   import com.tgame.moudels.baguazhang.model.BaGuaZhang_MsgSendProxy;
   import com.tgame.shell.view.components.CharAttribute;
   import com.tgame.shell.view.components.huodong.JiHuoRouShenShuXingPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import com.zcp.manager.TimerManager;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class BaGuaZhang_Mediator extends Mediator
   {
      
      public static const NAME:String = "BaGuaZhang_Mediator";
      
      private var _autoTisheng:Boolean = false;
      
      private var _currentLookLiantiID:int = 1;
      
      private var _useTishengType:int = 0;
      
      private var _jiuhoPanel:JiHuoRouShenShuXingPanel;
      
      private var _msgSenderProxy:BaGuaZhang_MsgSendProxy;
      
      public function BaGuaZhang_Mediator(param1:String = null, param2:Object = null)
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
      
      private function get msgSenderProxy() : BaGuaZhang_MsgSendProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(BaGuaZhang_MsgSendProxy.NAME) as BaGuaZhang_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [BaGuaZhang_ApplicationFacade.BAGUAZHANG_DINGJI_JIHUO_SHUXING];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case BaGuaZhang_ApplicationFacade.BAGUAZHANG_DINGJI_JIHUO_SHUXING:
               if(_loc2_.type == 8)
               {
                  this.msgSenderProxy.send_53901(GameInstance.mainChar.id);
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
            mainCharArrtibutePlane.addEventListener(CharAttribute.GETDUANZAOROUSHENB,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SMITHINGBODY_MENU_CLICKB,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SMITHINGBODY_TISHENGROUSHENJINGJIE_CLICKB,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SMITHINGBODY_SHANGYIYE_CLICKB,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SMITHINGBODY_XIAYIYE_CLICK,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_GOUMAI_CLICKB,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_KAISHITISHENG_CLICKB,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLICKB,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_PUTIJINGCUI_CHECK_CLICKB,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLOSE,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.addEventListener(CharAttribute.UI_SMITHINGBODY_JIHUO_CLICKB,mainCharArrtibutePlaneHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CharAttribute,function():void
         {
            mainCharArrtibutePlane.removeEventListener(Event.REMOVED_FROM_STAGE,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.GETDUANZAOROUSHENB,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SMITHINGBODY_MENU_CLICKB,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SMITHINGBODY_TISHENGROUSHENJINGJIE_CLICKB,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SMITHINGBODY_SHANGYIYE_CLICKB,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SMITHINGBODY_XIAYIYE_CLICKB,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_GOUMAI_CLICKB,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_KAISHITISHENG_CLICKB,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLICKB,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_PUTIJINGCUI_CHECK_CLICKB,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLOSE,mainCharArrtibutePlaneHandle);
            mainCharArrtibutePlane.removeEventListener(CharAttribute.UI_SMITHINGBODY_JIHUO_CLICKB,mainCharArrtibutePlaneHandle);
         });
      }
      
      private function mainCharArrtibutePlaneHandle(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var lookID:int = 0;
         var liantiRes:BaGuaZhangRes = null;
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
               this.mainCharArrtibutePlane.setBaguazhangZdtsBtnLabel(true);
               break;
            case CharAttribute.GETDUANZAOROUSHENB:
               this.mainCharArrtibutePlane.showSmithingBodyB();
               this.updateLiantiUI(GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID);
               if(GameState.gongneng157)
               {
               }
               break;
            case CharAttribute.UI_SMITHINGBODY_MENU_CLICKB:
               evt = e as BaseEvent;
               lookID = evt.data as int;
               if(lookID >= 1)
               {
                  this.updateLiantiUI(lookID);
               }
               break;
            case CharAttribute.UI_SMITHINGBODY_TISHENGROUSHENJINGJIE_CLICKB:
               this.mainCharArrtibutePlane.onShowLvB(true);
               this.mainCharArrtibutePlane.showDuantijindanB(null);
               this.msgSenderProxy.send_53903(GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID);
               break;
            case CharAttribute.UI_SMITHINGBODY_SHANGYIYE_CLICKB:
               if(this._currentLookLiantiID > 1)
               {
                  this.updateLiantiUI(this._currentLookLiantiID - 1);
               }
               break;
            case CharAttribute.UI_SMITHINGBODY_XIAYIYE_CLICKB:
               if(this._currentLookLiantiID < BaGuaZhangRESManager.MAX_LIANTI_LV)
               {
                  this.updateLiantiUI(this._currentLookLiantiID + 1);
               }
               break;
            case CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_GOUMAI_CLICKB:
               liantiRes = BaGuaZhangRESManager.getLiantiRes(GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID);
               if(liantiRes != null)
               {
                  PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[liantiRes.f_tupo_need_goodsmodel,0]);
               }
               break;
            case CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_PUTIJINGCUI_CHECK_CLICKB:
               evt = e as BaseEvent;
               this._useTishengType = evt.data as int;
               if(this._useTishengType == 1)
               {
                  if(GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID >= 4)
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
                  if(GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID >= 4)
                  {
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您选择了使用神奇菩提丹"));
                  }
                  else
                  {
                     this._useTishengType = 0;
                     this.mainCharArrtibutePlane.showPuTiDanTipCanvasB(1);
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"肉身境界尚未到达4阶时无法使用神奇菩提丹"));
                  }
               }
               liantiRes = BaGuaZhangRESManager.getLiantiRes(GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID);
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
                        this.mainCharArrtibutePlane.showPuTiDanTipCanvasB(3);
                     }
                     else
                     {
                        this._useTishengType = 0;
                        this.mainCharArrtibutePlane.showPuTiDanTipCanvasB(2);
                        NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您的背包中没有神奇菩提丹"));
                     }
                  }
                  this.mainCharArrtibutePlane.setCheckB(this._useTishengType == 1);
                  this.mainCharArrtibutePlane.setIsUsePuTiDanB(this._useTishengType == 2);
                  this.mainCharArrtibutePlane.setChenggonglvB(count,liantiRes.f_tupo_show_probability / 10000 * 100,tupoGoods.res.name);
               }
               break;
            case CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_KAISHITISHENG_CLICKB:
               this._autoTisheng = false;
               this.msgSenderProxy.send_53905([GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID,this._useTishengType]);
               break;
            case CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLICKB:
               evt = e as BaseEvent;
               if(evt.data != null && evt.data as Boolean == false)
               {
                  this._autoTisheng = false;
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"已停止自动提升"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"已停止自动提升"),false);
                  this.mainCharArrtibutePlane.setBaguazhangZdtsBtnLabel(true);
                  return;
               }
               if(this._autoTisheng != true)
               {
                  str = LanResManager.getLanTextWords(this,"您希望自动使用背包中的八骨丹提升八卦掌境界1",[StaticValue.RED_HTML,StaticValue.YELLOW_HTML,StaticValue.BLUE_HTML]);
                  FAlert.show(str,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        if(_useTishengType != 2)
                        {
                           _autoTisheng = true;
                           NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("已开始自动提升！"),false);
                           NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("已开始自动提升!"),false);
                           mainCharArrtibutePlane.setBaguazhangZdtsBtnLabel(false);
                           msgSenderProxy.send_53905([GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID,_useTishengType]);
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
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("已停止自动提升"),false);
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("已停止自动提升"),false);
                  this.mainCharArrtibutePlane.setBaguazhangZdtsBtnLabel(true);
               }
               break;
            case CharAttribute.UI_SMITHINGBODY_JIHUO_CLICKB:
               this.showJihuoPanel();
               break;
            case CharAttribute.UI_SMITHINGBODYADVANCEACNVAS_ZIDONGTISHENG_CLOSE:
               this._autoTisheng = false;
         }
      }
      
      public function f5() : void
      {
         if(this._currentLookLiantiID != GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID)
         {
            return;
         }
         this.updateLiantiUI(this._currentLookLiantiID);
      }
      
      public function updateSXFB(param1:Boolean, param2:int, param3:int = 500) : void
      {
         this.mainCharArrtibutePlane.setBar(param1,param2,param3);
      }
      
      public function updateLiantiUI(param1:int, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc6_:BaGuaZhangRes = null;
         var _loc12_:BaGuaZhangRes = null;
         var _loc13_:Goods = null;
         var _loc14_:String = null;
         var _loc15_:BaGuaZhangRes = null;
         var _loc16_:GoodsRes = null;
         this.mainCharArrtibutePlane.onShowLvB(false);
         this._autoTisheng = false;
         if(param2 != null)
         {
            GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID = param1;
            this._currentLookLiantiID = param1;
            this.mainCharArrtibutePlane.setJinduB(GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID);
            this.mainCharArrtibutePlane.setJihuoB(param3);
            _loc12_ = BaGuaZhangRESManager.getLiantiRes(GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID);
            if(_loc12_ != null)
            {
               if(_loc12_.f_tupo_need_goodsmodel > 0)
               {
                  _loc13_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc12_.f_tupo_need_goodsmodel,true);
                  this.mainCharArrtibutePlane.setPudidanB(_loc13_);
               }
            }
         }
         else
         {
            if(param1 < 1 || param1 > BaGuaZhangRESManager.MAX_LIANTI_LV)
            {
               return;
            }
            this._currentLookLiantiID = param1;
         }
         var _loc4_:BaGuaZhangRes = BaGuaZhangRESManager.getLiantiRes(this._currentLookLiantiID);
         var _loc5_:GoodsRes = GoodsResManager.getGoodsRes(_loc4_.f_tupo_need_goodsmodel);
         if(this._currentLookLiantiID != BaGuaZhangRESManager.MAX_LIANTI_LV)
         {
            _loc6_ = BaGuaZhangRESManager.getLiantiRes(this._currentLookLiantiID + 1);
         }
         var _loc7_:Array = [];
         var _loc8_:int = 1;
         while(_loc8_ <= BaGuaZhangRESManager.MAX_LIANTI_LV)
         {
            _loc14_ = "";
            _loc12_ = BaGuaZhangRESManager.getLiantiRes(_loc8_);
            _loc14_ += "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + BaGuaZhangRESManager.nameArr[_loc8_ - 1] + "：</font>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + _loc12_.f_name + "</font><br>";
            if(_loc8_ < GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID)
            {
               _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("武功状态：已达成") + "</font>";
            }
            else if(_loc8_ == GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID)
            {
               _loc14_ += "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("武功状态：修炼中") + "</font>";
            }
            else
            {
               _loc14_ += "<font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("武功状态：尚未到达") + "</font>";
            }
            _loc14_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"境界描述",[StaticValue.GREEN_HTML,_loc12_.f_desc]) + "</font>";
            if(_loc8_ != BaGuaZhangRESManager.MAX_LIANTI_LV)
            {
               _loc15_ = BaGuaZhangRESManager.getLiantiRes(_loc8_ + 1);
               _loc16_ = GoodsResManager.getGoodsRes(_loc12_.f_tupo_need_goodsmodel);
               _loc14_ += "<br>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("境界提升：全部属性加成到顶后可以通过使用") + _loc16_.name + LanResManager.getLanCommonTextWords("将八卦掌境界提升到") + _loc15_.f_name + LanResManager.getLanCommonTextWords("境界") + "</font>";
            }
            _loc7_.push(_loc14_);
            _loc8_++;
         }
         this.mainCharArrtibutePlane.menuToolTipB(_loc7_);
         this.mainCharArrtibutePlane.setJingjieB(_loc4_.f_desc2,GoodsResManager.getGoodsRes(_loc4_.f_food_goodsid).name);
         var _loc9_:Array = [];
         if(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_BAGUAHULU] != undefined)
         {
            _loc9_.push(GameInstance.mainCharData.goodsInfo.goodsBodyDict[ItemPositionRange.POSTION_BAGUAHULU]);
         }
         this.mainCharArrtibutePlane.set_BGHL(_loc9_);
         var _loc10_:Boolean = false;
         var _loc11_:Boolean = false;
         if(param2 != null)
         {
            _loc10_ = param2[0] == _loc4_.f_hp && param2[1] == _loc4_.f_mp && param2[2] == _loc4_.f_sp && param2[3] == _loc4_.f_atk && param2[4] == _loc4_.f_def && param2[5] == _loc4_.f_move_speed && param2[6] == _loc4_.f_atk_speed && param2[7] == _loc4_.f_fjsh && param2[8] == _loc4_.f_shjm && param2[9] == _loc4_.f_aq_jv;
            _loc11_ = (_loc10_) && GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID != BaGuaZhangRESManager.MAX_LIANTI_LV;
            this.mainCharArrtibutePlane.setBar1B(_loc4_.f_hp > 0,param2[0],_loc4_.f_hp);
            this.mainCharArrtibutePlane.setBar2B(_loc4_.f_mp > 0,param2[1],_loc4_.f_mp);
            this.mainCharArrtibutePlane.setBar3B(_loc4_.f_sp > 0,param2[2],_loc4_.f_sp);
            this.mainCharArrtibutePlane.setBar4B(_loc4_.f_atk > 0,param2[3],_loc4_.f_atk);
            this.mainCharArrtibutePlane.setBar5B(_loc4_.f_def > 0,param2[4],_loc4_.f_def);
            this.mainCharArrtibutePlane.setBar6B(_loc4_.f_atk_speed > 0,param2[6],_loc4_.f_atk_speed);
            this.mainCharArrtibutePlane.setBar7B(_loc4_.f_move_speed > 0,param2[5],_loc4_.f_move_speed);
            this.mainCharArrtibutePlane.setBar10B(_loc4_.f_fjsh > 0,param2[7],_loc4_.f_fjsh);
            this.mainCharArrtibutePlane.setBar8B(_loc4_.f_shjm > 0,param2[8],_loc4_.f_shjm);
            this.mainCharArrtibutePlane.setBar9B(_loc4_.f_aq_jv > 0,param2[9],_loc4_.f_aq_jv);
         }
         else
         {
            _loc10_ = this._currentLookLiantiID < GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID;
            _loc11_ = false;
            this.mainCharArrtibutePlane.setBar1B(_loc4_.f_hp > 0,_loc10_ ? _loc4_.f_hp : 0,_loc4_.f_hp);
            this.mainCharArrtibutePlane.setBar2B(_loc4_.f_mp > 0,_loc10_ ? _loc4_.f_mp : 0,_loc4_.f_mp);
            this.mainCharArrtibutePlane.setBar3B(_loc4_.f_sp > 0,_loc10_ ? _loc4_.f_sp : 0,_loc4_.f_sp);
            this.mainCharArrtibutePlane.setBar4B(_loc4_.f_atk > 0,_loc10_ ? _loc4_.f_atk : 0,_loc4_.f_atk);
            this.mainCharArrtibutePlane.setBar5B(_loc4_.f_def > 0,_loc10_ ? _loc4_.f_def : 0,_loc4_.f_def);
            this.mainCharArrtibutePlane.setBar6B(_loc4_.f_atk_speed > 0,_loc10_ ? _loc4_.f_atk_speed : 0,_loc4_.f_atk_speed);
            this.mainCharArrtibutePlane.setBar7B(_loc4_.f_move_speed > 0,_loc10_ ? _loc4_.f_move_speed : 0,_loc4_.f_move_speed);
            this.mainCharArrtibutePlane.setBar10B(_loc4_.f_fjsh > 0,_loc10_ ? _loc4_.f_fjsh : 0,_loc4_.f_fjsh);
            this.mainCharArrtibutePlane.setBar8B(_loc4_.f_shjm > 0,_loc10_ ? _loc4_.f_shjm : 0,_loc4_.f_shjm);
            this.mainCharArrtibutePlane.setBar9B(_loc4_.f_aq_jv > 0,_loc10_ ? _loc4_.f_aq_jv : 0,_loc4_.f_aq_jv);
         }
         this.mainCharArrtibutePlane.setMiaoshuB(BaGuaZhangRESManager.getLiantiMainDes(this._currentLookLiantiID));
         this.mainCharArrtibutePlane.setPageB(this._currentLookLiantiID,BaGuaZhangRESManager.MAX_LIANTI_LV,_loc10_);
         this.mainCharArrtibutePlane.setIsEnabledB(_loc11_);
         this.mainCharArrtibutePlane.okBtnToolTipB("");
         if(this._currentLookLiantiID != BaGuaZhangRESManager.MAX_LIANTI_LV)
         {
            _loc14_ = "";
            _loc14_ = _loc14_ + LanResManager.getLanTextWords(this,"提升肉身境界以便能够获得更多的属性加成",[_loc5_.name,_loc6_.f_name]);
            if(_loc6_.f_hp > 0)
            {
               _loc14_ += "\n" + LanResManager.getLanCommonTextWords("生命") + " +" + _loc6_.f_hp;
            }
            if(_loc6_.f_mp > 0)
            {
               _loc14_ += "\n" + LanResManager.getLanCommonTextWords("内力") + " +" + _loc6_.f_mp;
            }
            if(_loc6_.f_sp > 0)
            {
               _loc14_ += "\n" + LanResManager.getLanCommonTextWords("体力") + " +" + _loc6_.f_sp;
            }
            if(_loc6_.f_atk > 0)
            {
               _loc14_ += "\n" + LanResManager.getLanCommonTextWords("攻击") + " +" + _loc6_.f_atk;
            }
            if(_loc6_.f_def > 0)
            {
               _loc14_ += "\n" + LanResManager.getLanCommonTextWords("防御") + " +" + _loc6_.f_def;
            }
            if(_loc6_.f_atk_speed > 0)
            {
               _loc14_ += "\n" + LanResManager.getLanCommonTextWords("暴击") + " +" + _loc6_.f_atk_speed;
            }
            if(_loc6_.f_move_speed > 0)
            {
               _loc14_ += "\n" + LanResManager.getLanCommonTextWords("闪避") + " +" + _loc6_.f_move_speed;
            }
            if(_loc6_.f_fjsh > 0)
            {
               _loc14_ += "\n" + LanResManager.getLanCommonTextWords("抵抗暗器") + " +" + _loc6_.f_fjsh;
            }
            if(_loc6_.f_shjm > 0)
            {
               _loc14_ += "\n" + LanResManager.getLanCommonTextWords("抵抗弓箭") + " +" + _loc6_.f_shjm;
            }
            this.mainCharArrtibutePlane.okBtnToolTipB(_loc14_);
         }
         if(param2 == null && this._currentLookLiantiID == GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID)
         {
            this.msgSenderProxy.send_53901(GameInstance.mainChar.id);
         }
      }
      
      public function updateTishengLiantiUI(param1:int, param2:int, param3:int) : void
      {
         var _loc5_:Goods = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         if(param1 != this._currentLookLiantiID || param1 != GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID)
         {
            return;
         }
         this.mainCharArrtibutePlane.setDengjiB(GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID);
         var _loc4_:BaGuaZhangRes = BaGuaZhangRESManager.getLiantiRes(GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID);
         if(_loc4_ != null)
         {
            _loc5_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(_loc4_.f_tupo_need_goodsmodel,true);
            _loc6_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.PUTI_JINGCUI_ID,true);
            _loc7_ = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.SHENQI_PUTI_DAN,true);
            this.mainCharArrtibutePlane.setPudidanB(_loc5_);
            if(GameInstance.mainCharData.buffInfo.hasBuff(OtherConst.BUFF_BA_GUA_ZHANG))
            {
               param2 += 100;
            }
            this.mainCharArrtibutePlane.setZhufuzhiB(param2,_loc4_.f_zhufu_max);
            _loc8_ = _loc4_.f_tupo_need_goodscount;
            if(this._useTishengType == 1)
            {
               _loc8_--;
               if(_loc6_ <= 0)
               {
                  this._useTishengType = 0;
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您的背包中没有菩提精萃"));
               }
            }
            else if(this._useTishengType == 2)
            {
               _loc8_ = 0;
               if(_loc7_ > 0)
               {
                  this.mainCharArrtibutePlane.showPuTiDanTipCanvasB(3);
               }
               else
               {
                  this._useTishengType = 0;
                  this.mainCharArrtibutePlane.showPuTiDanTipCanvasB(2);
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您的背包中没有神奇菩提丹"));
               }
            }
            this.mainCharArrtibutePlane.setCheckB(this._useTishengType == 1);
            this.mainCharArrtibutePlane.setIsUsePuTiDanB(this._useTishengType == 2);
            this.mainCharArrtibutePlane.setChenggonglvB(_loc8_,_loc4_.f_tupo_show_probability / 10000 * 100,_loc5_.res.name);
            this.mainCharArrtibutePlane.setCountDownB(param3);
            this.mainCharArrtibutePlane.setAdvanceMiaoshuB(_loc4_.f_desc_tupo);
         }
      }
      
      public function updateTishengSucc(param1:int) : void
      {
         if(param1 != GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID)
         {
            return;
         }
         this.mainCharArrtibutePlane.onShowLvB(false);
         this._autoTisheng = false;
         this.mainCharArrtibutePlane.setBaguazhangZdtsBtnLabel(true);
         NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("八卦掌提升成功"),false);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("八卦掌提升成功"),false);
         this.msgSenderProxy.send_53901(GameInstance.mainChar.id);
         var _loc2_:AvatarParamData = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager.AVATAR_BAGUAZHANG),AvatarPartType.MAGIC);
         GameInstance.mainChar.loadAvatarPart(_loc2_);
      }
      
      public function updateTishengFail(param1:int, param2:String, param3:int) : void
      {
         var liantiRes:BaGuaZhangRes = null;
         var goodsNum:int = 0;
         var goodsPutijingcuiNum:int = 0;
         var shenqiPutidanCount:int = 0;
         var count:int = 0;
         var enoughPutijingcui:Boolean = false;
         var $liantiID:int = param1;
         var $failStr:String = param2;
         var isCanAuto:int = param3;
         if($liantiID != GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID)
         {
            return;
         }
         NoticeManager.notify(NoticeManager.FOOT,$failStr);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,$failStr);
         this.msgSenderProxy.send_53903(GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID);
         if(isCanAuto == 2 && this._autoTisheng)
         {
            this._autoTisheng = false;
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("您的包裹中没有足够突破道具已停止自动提升八卦掌"),false);
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("您的包裹中没有足够突破道具已停止自动提升八卦掌"),false);
            this.mainCharArrtibutePlane.setBaguazhangZdtsBtnLabel(true);
         }
         if(this._autoTisheng)
         {
            liantiRes = BaGuaZhangRESManager.getLiantiRes($liantiID);
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
                  this.mainCharArrtibutePlane.showPuTiDanTipCanvasB(3);
               }
               else
               {
                  this._useTishengType = 0;
                  this.mainCharArrtibutePlane.showPuTiDanTipCanvasB(2);
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(this,"您的背包中没有神奇菩提丹"));
               }
            }
            this.mainCharArrtibutePlane.setCheckB(this._useTishengType == 1);
            this.mainCharArrtibutePlane.setIsUsePuTiDanB(this._useTishengType == 2);
            TimerManager.createOneOffTimer(300,1,function():void
            {
               if($liantiID == GameInstance.mainCharData.attributeInfo.currentBaGuaZhangID && $liantiID > 0 && $liantiID < BaGuaZhangRESManager.MAX_LIANTI_LV)
               {
                  if(_useTishengType != 2)
                  {
                     msgSenderProxy.send_53905([$liantiID,_useTishengType]);
                  }
                  else
                  {
                     _autoTisheng = false;
                     NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanTextWords(BaGuaZhang_Mediator,"使用神奇菩提丹只能手动提升"),false);
                     NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(BaGuaZhang_Mediator,"使用神奇菩提丹只能手动提升"),false);
                  }
               }
            });
         }
      }
      
      public function showJihuoPanel() : void
      {
         var goods:Goods;
         if(this._jiuhoPanel == null)
         {
            this._jiuhoPanel = new JiHuoRouShenShuXingPanel();
            this._jiuhoPanel.addEventListener(JiHuoRouShenShuXingPanel.UI_JIHUOSHUXING_CLICK,function(param1:Event):void
            {
               msgSenderProxy.send_53909();
            });
         }
         goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.BAGUAZHANG_MIJICANJUAN_SHANG,true);
         this._jiuhoPanel.setGoods1(goods);
         goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.BAGUAZHANG_MIJICANJUAN_XIA,true);
         this._jiuhoPanel.setGoods2(goods);
         this._jiuhoPanel.setBuguaShuxing();
         this._jiuhoPanel.x = (GameConfig.sceneWidth - this._jiuhoPanel.width) / 2;
         this._jiuhoPanel.y = (GameConfig.sceneHeight - this._jiuhoPanel.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this._jiuhoPanel);
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
         this.mainCharArrtibutePlane.setBaguazhangJinduNum(param2,_loc6_);
         var _loc7_:String = "";
         if(param2 > 0)
         {
            _loc7_ = "<textformat leading=\'\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击:") + param3 + " " + LanResManager.getLanCommonTextWords("防御:") + param4 + " " + LanResManager.getLanCommonTextWords("生命:") + param5 + "</font>";
         }
         else
         {
            _loc7_ = "<textformat leading=\'\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("八卦掌顶级激活属性（未激活）") + "</font>";
         }
         this.mainCharArrtibutePlane.menuBaguazhangJinduToolTip(_loc7_);
      }
      
      public function setXueshou(param1:Boolean) : void
      {
         this.mainCharArrtibutePlane.setXueshou(param1);
      }
      
      public function setBaGuaDanTian(param1:Boolean, param2:Boolean) : void
      {
         this.mainCharArrtibutePlane.setBaGuaDanTian(param1,param2);
      }
   }
}

