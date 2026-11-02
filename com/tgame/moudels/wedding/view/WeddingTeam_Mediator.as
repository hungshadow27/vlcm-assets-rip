package com.tgame.moudels.wedding.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.PurePlayer;
   import com.tgame.common.vo.character.info.AttributeInfo;
   import com.tgame.common.vo.character.info.BanghuiInfo;
   import com.tgame.common.vo.character.info.GoodsInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.ExchangePositionManager;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.ResizeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.wedding.Wedding_ApplicationFacade;
   import com.tgame.moudels.wedding.model.Wedding_MsgSenderProxy;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.TeamPanel;
   import com.tgame.shell.view.components.attribute.OtherAttributeCanvas;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import flash.display.BitmapData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class WeddingTeam_Mediator extends Mediator
   {
      
      public static const NAME:String = "WeddingTeam_Mediator";
      
      private var avatar_zizeng:int = 0;
      
      private var isFirst:Boolean = true;
      
      private var talkArr:Array = [];
      
      private var currentGaojiYuPei:Goods;
      
      private var fullYupeiID:int;
      
      private var _senderProxy:Wedding_MsgSenderProxy;
      
      public function WeddingTeam_Mediator()
      {
         super(NAME);
      }
      
      protected function get panel() : TeamPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.teamPanel);
         }
         return viewComponent as TeamPanel;
      }
      
      private function get sender() : Wedding_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Wedding_MsgSenderProxy.NAME) as Wedding_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Wedding_ApplicationFacade.UPDATE_FUQI_SKILL,Wedding_ApplicationFacade.SELECT_YUPEI_SWITCH];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:ItemFace = null;
         var _loc4_:Goods = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Wedding_ApplicationFacade.UPDATE_FUQI_SKILL:
               this.panel.setFuwiwuxueFun(GameInstance.mainCharData.skillInfo.getFuQiSkill());
               break;
            case Wedding_ApplicationFacade.SELECT_YUPEI_SWITCH:
               _loc3_ = _loc2_ as ItemFace;
               _loc4_ = _loc3_.getBaseItem() as Goods;
               if(SpecialGoodsID.isYuPei(_loc4_.id))
               {
                  this.sender.send_52239(_loc4_.id);
                  TCursorManager.resumFullMouse();
               }
               else
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(WeddingLaunchProposal_Mediator,"该物品不是玉佩"),false);
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TeamPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_MYCONSORT_SKILL_DRAG_START,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_TEAMPANEL_MYCONSORT_DONGTAYIXIA_CLICK,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_TEAMPANEL_MYCONSORT_TANCHUXIANGXIZILIAO_CLICK,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_TEAMPANEL_MYCONSORT_TADEWUGONG_CLICK,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_TEAMPANEL_MYCONSORT_SHOW,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_LIHUNXIUSHU_FASONGXIEYIXIUSHU_CLICK,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_LIHUNXIUSHU_QIANGZHILIHUN_CLICK,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_YUPEISWAPPANEL_QUHUIYUANPEI_CLICK,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_YUPEISWAPPANEL_FANGRUDINGQINGPEI_CLICK,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_YUPEISWAPPANEL_KAISHIJIAOHUAN_CLICK,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_LAUNCHPROPOSALPANEL_BUYGOODSPANEL_OK_CLICK,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_TEAMPANEL_MYCONSORT_GENGHUANYUPEI_CLICK,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_YUPEISWAPPANEL_GOUMAIDINGQINGPEI_CLICK,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_TEAMPANEL_MYCONSORT_YIZHIXIUSHU_CLICK,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_TEAMPANEL_MYCONSORT_TADEJINGMAI_CLICK,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_TEAMPANEL_MYCONSORT_XINZENGQINGYU_CLICK,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_XINZENGXINYUPANEL_XINZENG,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_XINZENGXINYUPANEL_DELECT_XINZENG,addPanelEventListener);
            panel.addEventListener(OtherAttributeCanvas.UI_OTHERATTRIBUTE_CHENGZHAN_SHOP_OPEN,addPanelEventListener);
            panel.addEventListener(OtherAttributeCanvas.UI_OTHERATTRIBUTE_KUAFU_SHOP_OPEN,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_TEAMPANEL_MYCONSORT_SHENDIAOXIALV_CLICK,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_YUPEISWAPPANEL_QUHUIDUIJIAN_CLICK,addPanelEventListener);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TeamPanel,function():void
         {
            panel.removeEventListener(Event.ADDED_TO_STAGE,addPanelEventListener);
            panel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYCONSORT_DONGTAYIXIA_CLICK,addPanelEventListener);
            panel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYCONSORT_TANCHUXIANGXIZILIAO_CLICK,addPanelEventListener);
            panel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYCONSORT_TADEWUGONG_CLICK,addPanelEventListener);
            panel.removeEventListener(TeamPanel.UI_MYCONSORT_SKILL_DRAG_START,addPanelEventListener);
            panel.removeEventListener(TeamPanel.UI_YUPEISWAPPANEL_QUHUIYUANPEI_CLICK,addPanelEventListener);
            panel.removeEventListener(TeamPanel.UI_LIHUNXIUSHU_QIANGZHILIHUN_CLICK,addPanelEventListener);
            panel.removeEventListener(TeamPanel.UI_LIHUNXIUSHU_FASONGXIEYIXIUSHU_CLICK,addPanelEventListener);
            panel.removeEventListener(TeamPanel.UI_YUPEISWAPPANEL_FANGRUDINGQINGPEI_CLICK,addPanelEventListener);
            panel.removeEventListener(TeamPanel.UI_LAUNCHPROPOSALPANEL_BUYGOODSPANEL_OK_CLICK,addPanelEventListener);
            panel.removeEventListener(TeamPanel.UI_YUPEISWAPPANEL_KAISHIJIAOHUAN_CLICK,addPanelEventListener);
            panel.removeEventListener(TeamPanel.UI_YUPEISWAPPANEL_GOUMAIDINGQINGPEI_CLICK,addPanelEventListener);
            panel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYCONSORT_GENGHUANYUPEI_CLICK,addPanelEventListener);
            panel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYCONSORT_SHOW,addPanelEventListener);
            panel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYCONSORT_YIZHIXIUSHU_CLICK,addPanelEventListener);
            panel.addEventListener(TeamPanel.UI_TEAMPANEL_MYCONSORT_TADEJINGMAI_CLICK,addPanelEventListener);
            panel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYCONSORT_XINZENGQINGYU_CLICK,addPanelEventListener);
            panel.removeEventListener(TeamPanel.UI_XINZENGXINYUPANEL_XINZENG,addPanelEventListener);
            panel.removeEventListener(TeamPanel.UI_XINZENGXINYUPANEL_DELECT_XINZENG,addPanelEventListener);
            panel.removeEventListener(OtherAttributeCanvas.UI_OTHERATTRIBUTE_CHENGZHAN_SHOP_OPEN,addPanelEventListener);
            panel.removeEventListener(OtherAttributeCanvas.UI_OTHERATTRIBUTE_KUAFU_SHOP_OPEN,addPanelEventListener);
            panel.removeEventListener(TeamPanel.UI_TEAMPANEL_MYCONSORT_SHENDIAOXIALV_CLICK,addPanelEventListener);
            panel.removeEventListener(TeamPanel.UI_YUPEISWAPPANEL_QUHUIDUIJIAN_CLICK,addPanelEventListener);
         });
      }
      
      private function addPanelEventListener(param1:Event) : void
      {
         var baseEvt:BaseEvent = null;
         var obj:Object = null;
         var itemFace:ItemFace = null;
         var $evt:Event = param1;
         baseEvt = $evt as BaseEvent;
         switch($evt.type)
         {
            case Event.ADDED_TO_STAGE:
               if(this.isFirst)
               {
                  this.isFirst = false;
                  this.sender.send_52303();
               }
               this.currentGaojiYuPei = null;
               this.panel.setChatContent(this.talkArr);
               break;
            case TeamPanel.UI_TEAMPANEL_MYCONSORT_SHOW:
               this.sender.send_52301();
               this.panel.showMyConsort();
               break;
            case TeamPanel.UI_TEAMPANEL_MYCONSORT_YIZHIXIUSHU_CLICK:
               this.panel.showLihunxiushuPanelFun();
               break;
            case TeamPanel.UI_TEAMPANEL_MYCONSORT_TADEJINGMAI_CLICK:
               if(!Fun.isVisible(GameInstance.uiInstance._taJingmaiPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TA_JINGMAI_PANEL);
               }
               break;
            case TeamPanel.UI_TEAMPANEL_MYCONSORT_XINZENGQINGYU_CLICK:
               this.sender.send_52231();
               break;
            case TeamPanel.UI_XINZENGXINYUPANEL_XINZENG:
               this.sender.send_52233(baseEvt.data);
               this.panel.myconsort.xinzengxinyuPanel.onClose();
               break;
            case TeamPanel.UI_XINZENGXINYUPANEL_DELECT_XINZENG:
               obj = this.getPrivateTalkObj(int(baseEvt.data));
               if(obj)
               {
                  FAlert.show(LanResManager.getLanTextWords(this,"您希望删除轻语",[StaticValue.RED_HTML]) + obj.content,"",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        sender.send_52235(baseEvt.data);
                     }
                  },true);
               }
               break;
            case TeamPanel.UI_TEAMPANEL_MYCONSORT_GENGHUANYUPEI_CLICK:
               this.sender.send_52237();
               this.panel.showYupeiSwapPanelFun();
               break;
            case TeamPanel.UI_YUPEISWAPPANEL_GOUMAIDINGQINGPEI_CLICK:
               this.sender.send_52217();
               break;
            case TeamPanel.UI_LAUNCHPROPOSALPANEL_BUYGOODSPANEL_OK_CLICK:
               this.sender.send_52219(baseEvt.data);
               break;
            case TeamPanel.UI_YUPEISWAPPANEL_FANGRUDINGQINGPEI_CLICK:
               if(!Fun.isVisible(GameInstance.uiInstance._backpack))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_BACKPACK);
               }
               ResizeManager.showDoublePanel(this.panel.myconsort.yupeiswapPanel,GameInstance.uiInstance.backpack);
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.resumFullMouse();
                  TCursorManager.showCursor(TCursorManager.CURSOR_SELECT_YUPEI_SWITCH);
                  TCursorManager.lockOnMouseStatus();
               }
               else
               {
                  TCursorManager.resumFullMouse();
               }
               break;
            case TeamPanel.UI_YUPEISWAPPANEL_KAISHIJIAOHUAN_CLICK:
               if(this.currentGaojiYuPei == null)
               {
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"请先放入高级玉佩"),false);
                  return;
               }
               this.sender.send_52241(this.currentGaojiYuPei.id);
               break;
            case TeamPanel.UI_YUPEISWAPPANEL_QUHUIYUANPEI_CLICK:
               this.sender.send_52243();
               break;
            case TeamPanel.UI_LIHUNXIUSHU_FASONGXIEYIXIUSHU_CLICK:
               FAlert.show(LanResManager.getLanTextWords(this,"您希望向对方发送休书",[StaticValue.RED_HTML]),"",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     sender.send_52305(0);
                  }
               },true);
               break;
            case TeamPanel.UI_LIHUNXIUSHU_QIANGZHILIHUN_CLICK:
               FAlert.show(LanResManager.getLanTextWords(this,"您希望花费200万铜币与对方立即离婚",[StaticValue.RED_HTML]),"",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     sender.send_52305(1);
                  }
               },true);
               break;
            case TeamPanel.UI_MYCONSORT_SKILL_DRAG_START:
               itemFace = baseEvt.data as ItemFace;
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN)
               {
                  TCursorManager.currentItemFace = itemFace;
                  TCursorManager.showItem(itemFace.itemBD);
                  TCursorManager.source = 1;
                  TCursorManager.setCurrentStatus(TCursorManager.CURSOR_DRAG);
                  TCursorManager.lockOnMouseStatus();
               }
               break;
            case TeamPanel.UI_TEAMPANEL_MYCONSORT_TADEWUGONG_CLICK:
               this.sender.send_52361();
               break;
            case TeamPanel.UI_TEAMPANEL_MYCONSORT_TANCHUXIANGXIZILIAO_CLICK:
               GameInstance.lookPlayerID = GameInstance.peioPlayerID;
               if(Fun.isVisible(GameInstance.uiInstance._targetAttribute))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               }
               PipeManager.sendMsg(PipeConstants.SHOW_TARGET_CHAR_ATTRIBUTE_PLANE);
               break;
            case TeamPanel.UI_TEAMPANEL_MYCONSORT_DONGTAYIXIA_CLICK:
               this.sender.send_52371();
               break;
            case OtherAttributeCanvas.UI_OTHERATTRIBUTE_CHENGZHAN_SHOP_OPEN:
               PipeManager.sendMsg(PipeConstants.SET_MAINCHAR_MALL,1);
               break;
            case OtherAttributeCanvas.UI_OTHERATTRIBUTE_KUAFU_SHOP_OPEN:
               PipeManager.sendMsg(PipeConstants.SET_MAINCHAR_MALL,2);
               break;
            case TeamPanel.UI_TEAMPANEL_MYCONSORT_SHENDIAOXIALV_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_SHENDIAO_PLANE);
               break;
            case TeamPanel.UI_YUPEISWAPPANEL_QUHUIDUIJIAN_CLICK:
               this.sender.send_61033();
         }
      }
      
      public function setFullYupeiID(param1:int) : void
      {
         this.fullYupeiID = param1;
      }
      
      public function setInit(param1:int, param2:PurePlayer) : void
      {
         if(param1 == 0)
         {
            this.panel.isMarriageFun(false);
            this.panel.setFuwiwuxueFun(GameInstance.mainCharData.skillInfo.getFuQiSkill());
         }
         else if(param1 == 1)
         {
            this.panel.noOnlineFun();
            this.showSelfInfo();
         }
         else if(param1 == 2)
         {
            this.panel.isMarriageFun(true);
            this.showTargetCharArrtibuteInfo(param2);
         }
      }
      
      private function showSelfInfo() : void
      {
         var _loc4_:int = 0;
         var _loc1_:Array = GameInstance.mainCharData.skillInfo.getYupeiSkill();
         var _loc2_:Array = [];
         var _loc3_:Goods = new Goods(this.fullYupeiID);
         _loc3_.roleID = GameInstance.mainChar.id;
         _loc3_.position = _loc3_.res.position;
         _loc2_.push(_loc3_);
         var _loc5_:int = int(_loc1_.length);
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc2_.push(_loc1_[_loc4_]);
            _loc4_++;
         }
         this.panel.setYupeiFun(_loc2_);
         this.panel.setFuwiwuxueFun(GameInstance.mainCharData.skillInfo.getFuQiSkill());
      }
      
      public function showTargetCharArrtibuteInfo(param1:PurePlayer) : void
      {
         var _loc9_:int = 0;
         var _loc2_:PurePlayer = param1;
         var _loc3_:AttributeInfo = param1.attributeInfo;
         var _loc4_:GoodsInfo = param1.goodsInfo;
         var _loc5_:BanghuiInfo = param1.banghuiInfo;
         this.panel.setBaseAttribute(param1.name,String(_loc3_.prestige_chengzhan),_loc3_.expNow,_loc3_.expMax,_loc3_.lv,_loc5_.banghuiName,_loc3_.getPartyName(),_loc3_.spouseName,_loc3_.prestige_lunjian,_loc3_.cjNow,_loc3_.prestige_fuqijingji,_loc3_.prestige_zhizungongxun,_loc3_.prestige_shenshengzhandouli);
         this.panel.setZhenQi(_loc3_.gqNow,_loc3_.gqMax);
         this.panel.setSkillValue(_loc3_.ap,_loc3_.dp,_loc3_.cp,_loc3_.ev,_loc3_.adx,_loc3_.mdx,_loc3_.hpMax,_loc3_.mpMax,_loc3_.ppMax);
         this.panel.setJingjie(_loc3_.kfNow,_loc3_.kfMax,_loc3_.jmNow,_loc3_.jmMax,_loc3_.cjNow,_loc3_.cjMax);
         this.panel.set9JianJianCheng(_loc3_.dugu_baoji_jianmian,_loc3_.dugu_anqi_jianmian,_loc3_.dugu_anqi_dikang,_loc3_.dugu_gongjian_dikang,_loc3_.dugu_dantian_dikang,_loc3_.add2_bj,_loc3_.add2_aq,_loc3_.add2_daq,_loc3_.add2_dgj,_loc3_.add2_ddt);
         this.panel.setFuwiwuxueFun(GameInstance.mainCharData.skillInfo.getFuQiSkill());
         this.panel.setShowItem(_loc4_.goodsBagArr,param1.avatarInfo.useIng_Weapon_id);
         var _loc6_:Goods = new Goods(_loc2_.spouseData.yupeiID);
         _loc6_.roleID = _loc2_.id;
         _loc6_.position = _loc6_.res.position;
         this.panel.setYupei(_loc6_);
         this.setAvatar(_loc2_);
         this.showBodyItem(_loc3_.taoZhuang);
         this.panel.setICOXiantian(_loc3_.isJiHuoXianTianWuJing == 1,_loc3_.useTianShengNeiliCount,_loc3_.shenNongBaiChaoDanSta,_loc3_.qianNengXinFaSta);
         this.panel.setICORouti(_loc3_.isJiHuoRoutiJinshen);
         this.panel.setICOWuhun(_loc3_.useWuhundanCount,_loc3_.isWuHunShengJiDanJiHuo,_loc3_.isHuoHunDanJiHuo,_loc3_.wuHunShenDan,_loc3_.isLongHunWuPoJiHuo,_loc3_.longHunShenDan,_loc3_.isShenFuMiJi,_loc3_.isNeitishenqi,_loc3_.neitishenqi);
         this.panel.setICOHuXinYao(_loc3_.isHuXinYaoJiHuo);
         this.panel.setICONiXi(_loc3_.niXiStatus);
         this.panel.setICOFengHuang(_loc3_.fengHuang);
         var _loc7_:Array = GameInstance.mainCharData.skillInfo.getYupeiSkill();
         var _loc8_:Array = [];
         _loc6_ = new Goods(this.fullYupeiID);
         _loc6_.roleID = GameInstance.mainChar.id;
         _loc6_.position = _loc6_.res.position;
         _loc8_.push(_loc6_);
         var _loc10_:int = int(_loc7_.length);
         _loc9_ = 0;
         while(_loc9_ < _loc10_)
         {
            _loc8_.push(_loc7_[_loc9_]);
            _loc9_++;
         }
         this.panel.setYupeiFun(_loc8_);
         this.panel.setPoint(param1.spouseData.pointJinGong,param1.spouseData.pointFangYu,param1.spouseData.pointQingShen,param1.spouseData.pointJianTi,param1.spouseData.pointQianNeng);
         this.panel.setFlag(_loc5_.bangqiImgID);
         this.panel.setStarSta(_loc3_.starSta);
         this.panel.setStatusByString(_loc3_.statusString);
      }
      
      private function showBodyItem(param1:Boolean) : void
      {
         var siShengShouArr:Array = null;
         var taozhuang:Boolean = param1;
         var bodyArr:Array = GameInstance.peioPlayerData.goodsInfo.goodsBagArr;
         var booArr:Array = ExchangePositionManager.getEquipStatus(bodyArr,function():void
         {
         },function():void
         {
         },function():void
         {
         });
         if(booArr.length > 0)
         {
            this.panel.setICOState(booArr[0][0],booArr[0][1],booArr[1][0],booArr[1][1],booArr[2][0],booArr[2][1],booArr[3][0],booArr[3][1],booArr[4][0],booArr[4][1],booArr[5][0],booArr[5][1],booArr[6][0],booArr[6][1],booArr[7][0],booArr[7][1]);
         }
         else
         {
            this.panel.setICOState(false,0,false,0,false,0,false,0,false,0,false,0,false,0,false,0);
         }
         if(taozhuang)
         {
            this.panel.setSiShengShouState(12,12,12,12);
         }
         else
         {
            siShengShouArr = ExchangePositionManager.getSiShengShouStatus(bodyArr);
            if(siShengShouArr.length > 0)
            {
               this.panel.setSiShengShouState(siShengShouArr[0],siShengShouArr[1],siShengShouArr[2],siShengShouArr[3]);
            }
            else
            {
               this.panel.setSiShengShouState(0,0,0,0);
            }
         }
      }
      
      private function setAvatar(param1:PurePlayer) : void
      {
         var sex:int;
         var apdArr:Array;
         var callBack:Function = null;
         var $pPlayer:PurePlayer = param1;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != $pPlayer.id + "_" + avatar_zizeng)
            {
               return;
            }
            panel.setAvatar(param2);
            if($pPlayer.avatarInfo.needChangeAvatarXY)
            {
               panel.setAvaterXY(true);
            }
         };
         this.panel.setAvatar(null);
         sex = $pPlayer.attributeInfo.getSex();
         apdArr = $pPlayer.avatarInfo.getSimpleAPDList($pPlayer.isOnMount,sex);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pPlayer.id + "_" + ++this.avatar_zizeng,callBack,apdArr);
      }
      
      public function initPrivateTalk(param1:Array) : void
      {
         this.talkArr = param1;
         this.panel.setChatContent(param1);
      }
      
      public function setAddPrivateTalk() : void
      {
         this.panel.showXinzenqingyuFun();
      }
      
      public function addPrivateTalk(param1:Object) : void
      {
         var $qingYuObj:Object = param1;
         this.talkArr.push($qingYuObj);
         this.panel.setChatContent(this.talkArr);
         if($qingYuObj.color == 1)
         {
            return;
         }
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_NEW_EYE_SPEAK,function():void
         {
            if(!Fun.isVisible(panel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_TEAM_ATTRIBUTE_PLANE);
            }
            panel.showMyConsort(true);
         });
      }
      
      public function removePrivateTalk(param1:int) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in this.talkArr)
         {
            if(this.talkArr[_loc2_].hasOwnProperty("id"))
            {
               if(this.talkArr[_loc2_].id == param1)
               {
                  this.talkArr.splice(this.talkArr.indexOf(this.talkArr[_loc2_]),1);
               }
            }
         }
         this.panel.setChatContent(this.talkArr);
      }
      
      private function getPrivateTalkObj(param1:int) : Object
      {
         var _loc2_:String = null;
         for(_loc2_ in this.talkArr)
         {
            if(this.talkArr[_loc2_].hasOwnProperty("id"))
            {
               if(this.talkArr[_loc2_].id == param1)
               {
                  return this.talkArr[_loc2_];
               }
            }
         }
         return null;
      }
      
      public function setSwitchYupeiCurrent(param1:Array) : void
      {
         this.panel.setDangqianyupei(param1);
      }
      
      public function setSwitchYupeiGaoji(param1:Array) : void
      {
         this.currentGaojiYuPei = param1[0];
         this.panel.setSwapyupei(param1);
      }
      
      public function updateCurrentYupei() : void
      {
         PipeManager.sendMsg(PipeConstants.ITEMTIP_CLEAR);
         this.panel.setSwapyupei([]);
         this.sender.send_52237();
         this.sender.send_52301();
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_YU_PEI_UPDATA,function():void
         {
            sender.send_52243();
         });
      }
      
      public function updatePeiouPanel() : void
      {
         this.sender.send_52301();
      }
      
      public function xieYiLiHun() : void
      {
         var callBack:Function = null;
         callBack = function():void
         {
            FAlert.okLabel = LanResManager.getLanTextWords(WeddingTeam_Mediator,"同意离婚");
            FAlert.cancelLabel = LanResManager.getLanTextWords(WeddingTeam_Mediator,"拒绝离婚");
            FAlert.show(LanResManager.getLanTextWords(WeddingTeam_Mediator,"TA提出了离婚分手请求",[StaticValue.RED_HTML,StaticValue.YELLOW_HTML]),LanResManager.getLanTextWords(this,"协议离婚"),2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.OK)
               {
                  sender.send_52309(1);
               }
               else
               {
                  sender.send_52309(0);
               }
            },true);
         };
         GameInstance.uiInstance.mainUI.showICOTip(MainUI.TYPE_COURTSHIP_TIP,callBack);
      }
      
      public function close(param1:Boolean) : void
      {
         var len:int = 0;
         var i:int = 0;
         var goods:Goods = null;
         var bo:Boolean = param1;
         this.talkArr = [];
         this.panel.close();
         this.panel.isMarriageFun(false);
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_BYE_BYE_IS_FRIEND,function():void
         {
            sender.send_52243();
         });
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_FUQI_ITEM,function():void
         {
            sender.send_52357();
         });
         if(bo)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_BYE_BYE_QUJIAN,function():void
            {
               sender.send_61033();
            });
            len = int(GameInstance.mainCharData.goodsInfo.goodsBodyArr.length);
            i = len - 1;
            while(i >= 0)
            {
               goods = GameInstance.mainCharData.goodsInfo.goodsBodyArr[i] as Goods;
               if(goods.res.position == 60)
               {
                  GameInstance.mainCharData.goodsInfo.goodsBodyArr.splice(i,1);
                  delete GameInstance.mainCharData.goodsInfo.goodsBodyDict[goods.res.position];
               }
               i--;
            }
            GameInstance.uiInstance._charAttribute.setShowItem(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
         }
      }
   }
}

