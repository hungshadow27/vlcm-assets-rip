package com.tgame.moudels.mount.view
{
   import com.fireice.alert.FAlert;
   import com.fireice.event.FAlertEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.skill.SkillRes;
   import com.tgame.common.res.skill.SkillResManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.character.PureMount;
   import com.tgame.common.vo.character.info.MountAttributeInfo;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Buff;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.McBaseItem;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TCursorManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dugujiujian.view.Dugujiujian_LingwuPanelMediator;
   import com.tgame.moudels.mount.Mount_ApplicationFacade;
   import com.tgame.moudels.mount.model.Mount_MsgSenderProxy;
   import com.tgame.shell.view.components.RideFeedPanel;
   import com.tgame.shell.view.components.RidePanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import com.zcp.engine.SceneRender;
   import com.zcp.engine.helper.SimpleAvatarSynthesizer;
   import com.zcp.engine.staticdata.CharStatusType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Mount_MainCharRideFeedPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "Mount_MainCharRideFeedPlaneMediator";
      
      private var avatar_zizeng:int = 0;
      
      private var _btn_type:int = -1;
      
      public var _plane_type:int = -1;
      
      private var _plane_type_str:String = "";
      
      private var _mouey_count:int = 0;
      
      private var _sucess_probability:Number = 0;
      
      private var _luck_count:int = 0;
      
      public var lgjj_mount_name:String = "";
      
      public var lgjj_mount_need_ride_lv:int = 0;
      
      public var _useShenqiLiangu:Boolean = false;
      
      public var _tishiUseJinjiefu:Boolean = true;
      
      public var _longlinEwaiZengjia:int = 0;
      
      private var lastTime:int = 0;
      
      private const CLICK_DELAY:int = 500;
      
      private var pointArr:Array;
      
      private var superMountSelectedSkill:int = -1;
      
      private var isAuto:Boolean = false;
      
      private var autoKnowTimer:Timer;
      
      private var isAuto1:Boolean = false;
      
      private var autoTimer:Timer;
      
      private var _msgSenderProxy:Mount_MsgSenderProxy;
      
      private var _mainCharRidePlaneMediator:Mount_MainCharRidePlaneMediator;
      
      public function Mount_MainCharRideFeedPlaneMediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : Mount_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Mount_MsgSenderProxy.NAME) as Mount_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function get mainCharRidePlaneMediator() : Mount_MainCharRidePlaneMediator
      {
         if(!this._mainCharRidePlaneMediator)
         {
            this._mainCharRidePlaneMediator = facade.retrieveMediator(Mount_MainCharRidePlaneMediator.NAME) as Mount_MainCharRidePlaneMediator;
         }
         return this._mainCharRidePlaneMediator;
      }
      
      protected function get mainCharRideFeedPlane() : RideFeedPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.ridePanel.rideFeed);
         }
         return viewComponent as RideFeedPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Mount_ApplicationFacade.GOODS_CHANGED,Mount_ApplicationFacade.SHOW_SHOUYUAN_SKILL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:Goods = null;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Mount_ApplicationFacade.GOODS_CHANGED:
               if(this._plane_type == 10 && Fun.isVisible(GameInstance.uiInstance._ridePanel) && Fun.isVisible(GameInstance.uiInstance.ridePanel.rideFeed))
               {
                  if(this.mainCharRideFeedPlane.getFood() == null)
                  {
                     return;
                  }
                  _loc4_ = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(this.mainCharRideFeedPlane.getFood().position);
                  if(_loc4_ != this.mainCharRideFeedPlane.getFood())
                  {
                     this.mainCharRideFeedPlane.JinHuaSetFood(null);
                  }
               }
               break;
            case Mount_ApplicationFacade.SHOW_SHOUYUAN_SKILL:
               _loc3_ = _loc2_ as Array;
               if(_loc3_[0] == GameInstance.mainCharData.mountInfo.selectedMountID)
               {
                  this.mainCharRideFeedPlane.selectShouYuan(_loc3_[1]);
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(RidePanel,function():void
         {
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.GET_RIDE_FEED_RENEWENERGY_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.GET_RIDE_FEED_RIDESTRENGTHEN_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.GET_RIDE_FEED_GRADEUPGRADE_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_FEED_TONGLINGTIANFU_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.GET_RENEWENERGR_ENERGYHEALTH_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.GET_RENEWENERGR_ENERGYCHUZHAN_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.GET_RENEWENERGR_ENERGYLIGHT_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.GET_RENEWENERGR_ENERGYACCATK_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.GET_RENEWENERGR_ENERGYRECOVERY_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.GET_RENEWENERGR_ENERGYQUALITY_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.GET_RENEWENERGR_ENERGYSAVVY_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.GET_RIDE_FEED_UPGRADEASSEMBLEDSKILL_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_UPGRADEASSEMBLEDSKILL_EQUIP_CLICK,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.RIDE_FEED_USE_FODDER_RENEWENERGY,mainCharRidePlane_ok_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.RENEWENERGY_START,mainCharRidePlane_ok_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.GRADEUPGRADE_START,mainCharRidePlane_ok_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.RENEWENERGR_USE_ITEM_CONST,mainCharRidePlane_updateLuck_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.GRADEUPGRADE_JINJIEFU_USE,mainCharRidePlane_updateLuck_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.GRADEUPGRADE_KEEP,goon_lgjj);
            mainCharRideFeedPlane.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_REED_SHENQILIANGUDAN_SHOW,show_shenqiliangudan_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_REED_SHENQILIANGUDAN_USR,shenqiliangudan_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_FEED_SHENQIZIZHIDAN_SHOW,show_shenqizizhidan_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_FEED_SHENQIZIZHIDAN_USE,shenqizizhidan_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_FEED_JINENGDAQUAN_SHOW,show_jinengdaquan_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_REIDE_FEED_GRADEUPGRADE_TIPCANVAS_OPTION,checkJinjiefuHandle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_REIDE_FEED_GRADEUPGRADE_TIPCANVAS_NEXT_IS_SHOW,checkJinjiefuHandle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_FEED_TONGLINGTIANFU_STRAT,checkJinjiefuHandle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_FEED_TONGLINGTIANFU_CREATE,checkJinjiefuHandle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.GET_RIDE_JINHUA_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_FEED_JINJIE_DRAG_ENTER,superMountHandel);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_FEED_JINJIE_DRAG_START,superMountHandel);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_FEED_JINJIE_WEIBTN,superMountHandel);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_FEED_JINJIE_OKBTN,superMountHandel);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_FEED_JINJIE_SKILL_CHICK,superMountHandel);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_FEED_JINJIE_STARTJINJIE,superMountHandel);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_NIEPAN_CLICK,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_FEED_NIEPAN_CLICK,niePanHandel);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_FEED_NIEPAN_KAISHINIEPAN,niePanHandel);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_FEED_NIEPAN_ZHIDONGNIEPAN,niePanHandel);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_FEED_NIEPAN_XIAOCHUJIYI,niePanHandel);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_FEED_NIEPAN_QINGQIUDUIHUAN,niePanHandel);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_FEED_NIEPAN_DUIHUANZUOQI,niePanHandel);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_FEED_NIEPAN_GOUMAI_CLICK,niePanHandel);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_SHOUYUAN_SHOW,shouYuanHandel);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_SHOUYUAN_TUPO,shouYuanHandel);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_SHOUYUAN_XIULIAN,shouYuanHandel);
            mainCharRideFeedPlane.addEventListener(RideFeedPanel.UI_RIDE_SHOUYUAN_PRE_NEXT,shouYuanHandel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(RidePanel,function():void
         {
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.GET_RIDE_FEED_RENEWENERGY_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.GET_RIDE_FEED_RIDESTRENGTHEN_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.GET_RIDE_FEED_GRADEUPGRADE_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_FEED_TONGLINGTIANFU_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.GET_RENEWENERGR_ENERGYHEALTH_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.GET_RENEWENERGR_ENERGYCHUZHAN_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.GET_RENEWENERGR_ENERGYLIGHT_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.GET_RENEWENERGR_ENERGYACCATK_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.GET_RENEWENERGR_ENERGYRECOVERY_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.GET_RENEWENERGR_ENERGYQUALITY_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.GET_RENEWENERGR_ENERGYSAVVY_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.GET_RIDE_FEED_UPGRADEASSEMBLEDSKILL_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_UPGRADEASSEMBLEDSKILL_EQUIP_CLICK,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.RIDE_FEED_USE_FODDER_RENEWENERGY,mainCharRidePlane_ok_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.RENEWENERGY_START,mainCharRidePlane_ok_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.GRADEUPGRADE_START,mainCharRidePlane_ok_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.RENEWENERGR_USE_ITEM_CONST,mainCharRidePlane_updateLuck_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.GRADEUPGRADE_JINJIEFU_USE,mainCharRidePlane_updateLuck_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.GRADEUPGRADE_KEEP,goon_lgjj);
            mainCharRideFeedPlane.removeEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_REED_SHENQILIANGUDAN_SHOW,show_shenqiliangudan_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_REED_SHENQILIANGUDAN_USR,shenqiliangudan_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_FEED_SHENQIZIZHIDAN_SHOW,show_shenqizizhidan_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_FEED_SHENQIZIZHIDAN_USE,shenqizizhidan_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_FEED_JINENGDAQUAN_SHOW,show_jinengdaquan_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_REIDE_FEED_GRADEUPGRADE_TIPCANVAS_OPTION,checkJinjiefuHandle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_REIDE_FEED_GRADEUPGRADE_TIPCANVAS_NEXT_IS_SHOW,checkJinjiefuHandle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_FEED_TONGLINGTIANFU_STRAT,checkJinjiefuHandle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_FEED_TONGLINGTIANFU_CREATE,checkJinjiefuHandle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.GET_RIDE_JINHUA_SHOW,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_FEED_JINJIE_DRAG_ENTER,superMountHandel);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_FEED_JINJIE_DRAG_START,superMountHandel);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_FEED_JINJIE_WEIBTN,superMountHandel);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_FEED_JINJIE_OKBTN,superMountHandel);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_FEED_JINJIE_SKILL_CHICK,superMountHandel);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_FEED_JINJIE_STARTJINJIE,superMountHandel);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_NIEPAN_CLICK,mainCharRidePlane_show_Handle);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_FEED_NIEPAN_CLICK,niePanHandel);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_FEED_NIEPAN_KAISHINIEPAN,niePanHandel);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_FEED_NIEPAN_ZHIDONGNIEPAN,niePanHandel);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_FEED_NIEPAN_XIAOCHUJIYI,niePanHandel);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_FEED_NIEPAN_QINGQIUDUIHUAN,niePanHandel);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_FEED_NIEPAN_DUIHUANZUOQI,niePanHandel);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_FEED_NIEPAN_GOUMAI_CLICK,niePanHandel);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_SHOUYUAN_SHOW,shouYuanHandel);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_SHOUYUAN_TUPO,shouYuanHandel);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_SHOUYUAN_XIULIAN,shouYuanHandel);
            mainCharRideFeedPlane.removeEventListener(RideFeedPanel.UI_RIDE_SHOUYUAN_PRE_NEXT,shouYuanHandel);
         });
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         var pMount:PureMount;
         var goOnShenjie:Function;
         var e:Event = param1;
         this.isAuto = false;
         this.isAuto1 = false;
         this._plane_type_str = "";
         pMount = GameInstance.mainCharData.mountInfo.selectedMount;
         if(pMount != null)
         {
            if(pMount.mountAttributeInfo.zhufuzhi > 0)
            {
               goOnShenjie = function():void
               {
                  if(!Fun.isVisible(GameInstance.uiInstance._ridePanel))
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_RIDEBTN_PLANE);
                  }
                  else
                  {
                     mainCharRidePlaneMediator.showFeedPanel();
                  }
               };
               this.mainCharRidePlaneMediator.showTipPanel(goOnShenjie);
            }
         }
      }
      
      private function show_shenqiliangudan_Handle(param1:*) : void
      {
         this.mainCharRideFeedPlane.showShenQiLianGuDan();
      }
      
      private function shenqiliangudan_Handle(param1:*) : void
      {
         if(this._plane_type == 7)
         {
            this.mainCharRidePlane_ok_Handle(null,true);
         }
      }
      
      private function show_shenqizizhidan_Handle(param1:*) : void
      {
         this.mainCharRideFeedPlane.showShenQizizhidanPanel();
      }
      
      private function show_jinengdaquan_Handle(param1:*) : void
      {
         var _loc4_:SkillRes = null;
         var _loc2_:Array = SkillResManager.getMountSkillResArr();
         var _loc3_:Array = [];
         for each(_loc4_ in _loc2_)
         {
            _loc3_.push(new Skill(_loc4_.id_kind));
         }
         this.mainCharRideFeedPlane.showSkillPanel(_loc3_);
      }
      
      private function shenqizizhidan_Handle(param1:*) : void
      {
         if(this._plane_type >= 1 && this._plane_type <= 6)
         {
            this.msgSenderProxy.send_50051([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
         }
      }
      
      private function mainCharRidePlane_show_Handle(param1:*) : void
      {
         var _loc4_:Goods = null;
         var _loc5_:Array = null;
         var _loc6_:Skill = null;
         var _loc2_:String = param1 is Event ? param1.type : param1;
         if(this._plane_type_str != _loc2_)
         {
            this._plane_type_str = _loc2_;
            this._mouey_count = 0;
            this._sucess_probability = 0;
            this._luck_count = 0;
            this.lgjj_mount_name = "";
            this.lgjj_mount_need_ride_lv = 0;
         }
         var _loc3_:PureMount = GameInstance.mainCharData.mountInfo.selectedMount;
         if(_loc3_ == null)
         {
            return;
         }
         switch(_loc2_)
         {
            case RideFeedPanel.GET_RIDE_FEED_RENEWENERGY_SHOW:
               this._btn_type = 1;
               this._plane_type = 0;
               _loc4_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.HOURSE_CAOLIAO_ID,true);
               this.mainCharRideFeedPlane.setNameLevel(_loc3_.name,_loc3_.mountAttributeInfo.lv);
               this.mainCharRideFeedPlane.showRenewEnerg();
               break;
            case RideFeedPanel.GET_RIDE_FEED_RIDESTRENGTHEN_SHOW:
               this._btn_type = 2;
               this._plane_type = -1;
               this.showRideStrengthen(false);
               break;
            case RideFeedPanel.GET_RIDE_FEED_GRADEUPGRADE_SHOW:
               this._btn_type = 3;
               this._plane_type = 7;
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               break;
            case RideFeedPanel.UI_RIDE_FEED_TONGLINGTIANFU_SHOW:
               this._btn_type = 5;
               this._plane_type = 9;
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               this.mainCharRideFeedPlane.showTongLingTianFuCanvas();
               if(_loc3_.mountAttributeInfo.nextMountName != "")
               {
                  this.mainCharRideFeedPlane.SetInitializeTL(_loc3_.name,_loc3_.res.zuhe_skill_count.toString(),_loc3_.mountAttributeInfo.nextMountName,String(_loc3_.mountAttributeInfo.nextMountZuhejiRL),_loc3_.res.zuhe_skill_count);
               }
               else
               {
                  this.mainCharRideFeedPlane.SetInitializeTL(_loc3_.name,_loc3_.res.zuhe_skill_count.toString(),"","",_loc3_.res.zuhe_skill_count);
               }
               this.mainCharRideFeedPlane.setSkillInitialize(_loc3_.mountAttributeInfo.getMountZuHeSkillArr());
               break;
            case RideFeedPanel.GET_RIDE_JINHUA_SHOW:
               this._plane_type = 10;
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               break;
            case RideFeedPanel.UI_RIDE_NIEPAN_CLICK:
               this._plane_type = 11;
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               break;
            case RideFeedPanel.GET_RENEWENERGR_ENERGYQUALITY_SHOW:
               this.mainCharRidePlaneMediator.showFeedPanel();
               if(this._plane_type != -1)
               {
                  this.showRideStrengthen(true);
               }
               this._plane_type = 1;
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               break;
            case RideFeedPanel.GET_RENEWENERGR_ENERGYSAVVY_SHOW:
               this.mainCharRidePlaneMediator.showFeedPanel();
               if(this._plane_type != -1)
               {
                  this.showRideStrengthen(true);
               }
               this._plane_type = 2;
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               break;
            case RideFeedPanel.GET_RENEWENERGR_ENERGYACCATK_SHOW:
               this.mainCharRidePlaneMediator.showFeedPanel();
               if(this._plane_type != -1)
               {
                  this.showRideStrengthen(true);
               }
               this._plane_type = 3;
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               break;
            case RideFeedPanel.GET_RENEWENERGR_ENERGYRECOVERY_SHOW:
               this.mainCharRidePlaneMediator.showFeedPanel();
               if(this._plane_type != -1)
               {
                  this.showRideStrengthen(true);
               }
               this._plane_type = 4;
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               break;
            case RideFeedPanel.GET_RENEWENERGR_ENERGYLIGHT_SHOW:
               this.mainCharRidePlaneMediator.showFeedPanel();
               if(this._plane_type != -1)
               {
                  this.showRideStrengthen(true);
               }
               this._plane_type = 5;
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               break;
            case RideFeedPanel.GET_RENEWENERGR_ENERGYHEALTH_SHOW:
               this.mainCharRidePlaneMediator.showFeedPanel();
               if(this._plane_type != -1)
               {
                  this.showRideStrengthen(true);
               }
               this._plane_type = 6;
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               break;
            case RideFeedPanel.GET_RENEWENERGR_ENERGYCHUZHAN_SHOW:
               this.mainCharRidePlaneMediator.showFeedPanel();
               if(this._plane_type != -1)
               {
                  this.showRideStrengthen(true);
               }
               this._plane_type = 13;
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
            case RideFeedPanel.GET_RIDE_FEED_UPGRADEASSEMBLEDSKILL_SHOW:
               this._btn_type = 4;
               this._plane_type = 8;
               if(_loc3_.mountAttributeInfo.nextMountName != "")
               {
                  this.mainCharRideFeedPlane.showUpgradeAssembledSkill(_loc3_.name,_loc3_.res.zuhe_skill_count.toString(),_loc3_.mountAttributeInfo.nextMountName,String(_loc3_.mountAttributeInfo.nextMountZuhejiRL),_loc3_.res.zuhe_skill_count);
               }
               else
               {
                  this.mainCharRideFeedPlane.showUpgradeAssembledSkill(_loc3_.name,_loc3_.res.zuhe_skill_count.toString(),"","",_loc3_.res.zuhe_skill_count);
               }
               this.mainCharRideFeedPlane.setSkillInitialize(_loc3_.mountAttributeInfo.getMountZuHeSkillArr());
               break;
            case RideFeedPanel.UI_UPGRADEASSEMBLEDSKILL_EQUIP_CLICK:
               _loc5_ = param1.data as Array;
               if(TCursorManager.currentItemFace != null && TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  if(!(TCursorManager.currentItemFace.getBaseItem() is Skill))
                  {
                     return;
                  }
                  _loc6_ = TCursorManager.currentItemFace.getBaseItem() as Skill;
                  this.msgSenderProxy.send_52061([_loc3_.id,_loc5_[1],_loc6_.id]);
               }
               else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN && _loc5_[0] != null)
               {
                  this.msgSenderProxy.send_52063([_loc3_.id,_loc5_[1]]);
               }
         }
         if(this._plane_type == 7)
         {
            this._longlinEwaiZengjia = 0;
            if(GameInstance.mainCharData.mountInfo.selectedMount.res.kind >= 7)
            {
               if(GameInstance.mainCharData.buffInfo.hasBuff(OtherConst.BUFF_LONGLIN))
               {
                  this._longlinEwaiZengjia = 1;
               }
            }
            if(GameState.gongneng153)
            {
               this.mainCharRideFeedPlane.setUpgradeAddBuff(new Buff(OtherConst.BUFF_LONGLIN));
            }
            else
            {
               this.mainCharRideFeedPlane.setUpgradeAddBuff(null);
            }
            this.mainCharRideFeedPlane.isShowShenQiLianGuDanTip(GameState.gongneng108);
            this.mainCharRideFeedPlane.isShowShenQiLianGuDanBtn(GameState.gongneng105);
         }
         if(this._plane_type >= 1 && this._plane_type <= 6)
         {
            this.mainCharRideFeedPlane.isShowShenqizizhidanBtn(GameState.gongneng107);
         }
      }
      
      private function mainCharRidePlane_updateLuck_Handle(param1:BaseEvent) : void
      {
         var _loc2_:Number = NaN;
         if(param1.data is int)
         {
            this._luck_count = int(Number(param1.data));
            _loc2_ = this._sucess_probability + this._luck_count * OtherConst.XINGYUNJING_JILV;
         }
         else
         {
            this._luck_count = param1.data ? 1 : 0;
            _loc2_ = this._sucess_probability;
         }
         switch(this._plane_type)
         {
            case 1:
               this.mainCharRideFeedPlane.setStrengthenEnergyQualityExpendMoneyAndProbability(this._mouey_count,_loc2_);
               break;
            case 2:
               this.mainCharRideFeedPlane.setStrengthenEnergySavvyExpendMoneyAndProbability(this._mouey_count,_loc2_);
               break;
            case 3:
               this.mainCharRideFeedPlane.setStrengthenEnergyAttackExpendMoneyAndProbability(this._mouey_count,_loc2_);
               break;
            case 4:
               this.mainCharRideFeedPlane.setStrengthenEnergyRecoveryExpendMoneyAndProbability(this._mouey_count,_loc2_);
               break;
            case 5:
               this.mainCharRideFeedPlane.setStrengthenEnergyLightExpendMoneyAndProbability(this._mouey_count,_loc2_);
               break;
            case 6:
               this.mainCharRideFeedPlane.setStrengthenEnergyHealthExpendMoneyAndProbability(this._mouey_count,_loc2_);
               break;
            case 7:
               this.mainCharRideFeedPlane.setUpgradeExpendMoneyAndProbability(this._mouey_count,_loc2_,this._longlinEwaiZengjia);
         }
      }
      
      private function mainCharRidePlane_ok_Handle(param1:Event = null, param2:Boolean = false) : void
      {
         var ty:int = 0;
         var str:String = null;
         var e:Event = param1;
         var $useShenqiLiangu:Boolean = param2;
         var baseE:BaseEvent = e as BaseEvent;
         this._useShenqiLiangu = $useShenqiLiangu;
         if(SceneRender.nowTime - this.lastTime < this.CLICK_DELAY)
         {
            return;
         }
         this.lastTime = SceneRender.nowTime;
         if(this._plane_type == 7)
         {
            if(GameInstance.mainCharData.attributeInfo.lv < this.lgjj_mount_need_ride_lv)
            {
               this.mainCharRideFeedPlane.showLevelLessPanel(this.lgjj_mount_name,this.lgjj_mount_need_ride_lv);
            }
            else
            {
               this.goon_lgjj();
            }
         }
         else
         {
            ty = baseE.data as int;
            if(ty == 1)
            {
               str = LanResManager.getLanTextWords(Dugujiujian_LingwuPanelMediator,LanResManager.getLanCommonTextWords("您希望自动使用背包中的领悟道具领悟本阶招式"),[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
               FAlert.okLabel = LanResManager.getLanCommonTextWords("开始自动领悟");
               FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
               FAlert.show(str,"",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     isAuto1 = ty == 1;
                     if(isAuto1)
                     {
                        msgSenderProxy.send_60611(GameInstance.mainCharData.mountInfo.selectedMount.id);
                     }
                     autoTimerFun();
                  }
               });
            }
            else if(ty == 2)
            {
               this.isAuto1 = baseE.data as Boolean;
               this.autoTimerFun();
            }
            else
            {
               this.isAuto1 = baseE.data as Boolean;
               this.goon_lgjj();
            }
         }
      }
      
      private function autoTimerFun() : void
      {
         var fun:Function = null;
         fun = function(param1:TimerEvent):void
         {
            autoTimer.removeEventListener(TimerEvent.TIMER,fun);
            autoTimer = null;
            if(isAuto1)
            {
               msgSenderProxy.send_50027([GameInstance.mainCharData.mountInfo.selectedMountID,_plane_type,_luck_count]);
            }
         };
         if(Boolean(this.isAuto1) && Boolean(GameInstance.uiInstance.ridePanel.rideFeed) && Boolean(GameInstance.uiInstance.ridePanel))
         {
            if(this.autoTimer)
            {
               return;
            }
            this.autoTimer = new Timer(300,1);
            this.autoTimer.start();
            this.autoTimer.addEventListener(TimerEvent.TIMER,fun);
         }
         else
         {
            if(!this.autoTimer)
            {
               return;
            }
            this.autoTimer.stop();
            this.autoTimer.removeEventListener(TimerEvent.TIMER,fun);
            this.autoTimer = null;
         }
      }
      
      private function superMountHandel(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:Array = null;
         var _loc4_:Goods = null;
         var _loc5_:int = 0;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case RideFeedPanel.UI_RIDE_FEED_JINJIE_DRAG_START:
               this.mainCharRideFeedPlane.JinHuaSetFood(null);
               break;
            case RideFeedPanel.UI_RIDE_FEED_JINJIE_DRAG_ENTER:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  if(TCursorManager.currentItemFace.getBaseItem() is McBaseItem)
                  {
                     return;
                  }
                  _loc4_ = TCursorManager.currentItemFace.getBaseItem() as Goods;
                  this.mainCharRideFeedPlane.JinHuaSetFood(_loc4_);
               }
               break;
            case RideFeedPanel.UI_RIDE_FEED_JINJIE_WEIBTN:
               if(this.mainCharRideFeedPlane.getFood() == null)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入物品"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入物品"));
                  return;
               }
               this.msgSenderProxy.send_52085({
                  "id":GameInstance.mainCharData.mountInfo.selectedMountID,
                  "index":this.mainCharRideFeedPlane.getFood().position
               });
               break;
            case RideFeedPanel.UI_RIDE_FEED_JINJIE_OKBTN:
               _loc3_ = _loc2_.data as Array;
               _loc5_ = 0;
               while(_loc5_ < _loc3_.length)
               {
                  _loc3_[_loc5_] -= this.pointArr[_loc5_];
                  _loc5_++;
               }
               if(_loc3_[1] + _loc3_[2] + _loc3_[3] + _loc3_[4] <= 0)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("潜能点不足或未分配潜能点"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("潜能点不足或未分配潜能点"));
                  return;
               }
               this.msgSenderProxy.send_52083({
                  "id":GameInstance.mainCharData.mountInfo.selectedMountID,
                  "type":1,
                  "act":_loc3_[0],
                  "def":_loc3_[1],
                  "spd":_loc3_[2],
                  "mps":_loc3_[3]
               });
               break;
            case RideFeedPanel.UI_RIDE_FEED_JINJIE_SKILL_CHICK:
               this.superMountSelectedSkill = _loc2_.data as int;
               this.msgSenderProxy.send_52087({
                  "mid":GameInstance.mainCharData.mountInfo.selectedMountID,
                  "kid":this.superMountSelectedSkill
               });
               break;
            case RideFeedPanel.UI_RIDE_FEED_JINJIE_STARTJINJIE:
               this.superMountSelectedSkill = _loc2_.data as int;
               this.msgSenderProxy.send_52089({
                  "mid":GameInstance.mainCharData.mountInfo.selectedMountID,
                  "kid":this.superMountSelectedSkill
               });
         }
      }
      
      private function goon_lgjj(param1:* = null) : void
      {
         if(this._useShenqiLiangu)
         {
            this.msgSenderProxy.send_50047([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
         }
         else if(this._plane_type == 7 && this._luck_count <= 0 && this._tishiUseJinjiefu)
         {
            this.mainCharRideFeedPlane.showGradeUpgradeTip();
         }
         else
         {
            this.msgSenderProxy.send_50027([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type,this._luck_count]);
         }
      }
      
      private function checkJinjiefuHandle(param1:*) : void
      {
         var _loc2_:String = param1 is Event ? param1.type : param1;
         switch(_loc2_)
         {
            case RideFeedPanel.UI_REIDE_FEED_GRADEUPGRADE_TIPCANVAS_OPTION:
               if((param1 as BaseEvent).data == true)
               {
                  this._plane_type = 7;
                  this.msgSenderProxy.send_50027([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type,this._luck_count]);
               }
               break;
            case RideFeedPanel.UI_REIDE_FEED_GRADEUPGRADE_TIPCANVAS_NEXT_IS_SHOW:
               this._tishiUseJinjiefu = !(param1 as BaseEvent).data;
               break;
            case RideFeedPanel.UI_RIDE_FEED_TONGLINGTIANFU_STRAT:
               this._plane_type = 9;
               this.msgSenderProxy.send_50027([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type,0]);
               break;
            case RideFeedPanel.UI_RIDE_FEED_TONGLINGTIANFU_CREATE:
               this._plane_type = 9;
               this.msgSenderProxy.send_50027([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type,1]);
         }
      }
      
      private function setNextAvatar(param1:PureMount) : void
      {
         var apdArr:Array;
         var apd:AvatarParamData;
         var callBack:Function = null;
         var $pMount:PureMount = param1;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != $pMount.id + "_" + avatar_zizeng)
            {
               return;
            }
            mainCharRideFeedPlane.setNextAvatar(param2);
         };
         this.mainCharRideFeedPlane.setNextAvatar(null);
         apdArr = [];
         apd = new AvatarParamData($pMount.getAvatarPath_Clothes());
         apdArr.push(apd);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pMount.id + "_" + ++this.avatar_zizeng,callBack,apdArr,1,CharStatusType.STAND,2);
      }
      
      private function setAvatar(param1:PureMount) : void
      {
         var apdArr:Array;
         var apd:AvatarParamData;
         var callBack:Function = null;
         var $pMount:PureMount = param1;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != $pMount.id + "_" + avatar_zizeng)
            {
               return;
            }
            mainCharRideFeedPlane.JinHuaCanvasAvatar(param2);
         };
         this.mainCharRideFeedPlane.JinHuaCanvasAvatar(null);
         apdArr = [];
         apd = new AvatarParamData($pMount.getAvatarPath_Clothes());
         apdArr.push(apd);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pMount.id + "_" + ++this.avatar_zizeng,callBack,apdArr,1,CharStatusType.STAND,2);
      }
      
      public function f5OldView() : void
      {
         if(GameInstance.mainCharData.mountInfo.selectedMount == null)
         {
            if(Fun.isVisible(this.mainCharRideFeedPlane))
            {
               this.mainCharRidePlaneMediator.hideFeedPanel();
            }
            return;
         }
         switch(this._plane_type)
         {
            case -1:
               this.mainCharRidePlane_show_Handle(RideFeedPanel.GET_RIDE_FEED_RIDESTRENGTHEN_SHOW);
               break;
            case 0:
               this.mainCharRidePlane_show_Handle(RideFeedPanel.GET_RIDE_FEED_RENEWENERGY_SHOW);
               break;
            case 1:
               this.mainCharRidePlane_show_Handle(RideFeedPanel.GET_RENEWENERGR_ENERGYQUALITY_SHOW);
               break;
            case 2:
               this.mainCharRidePlane_show_Handle(RideFeedPanel.GET_RENEWENERGR_ENERGYSAVVY_SHOW);
               break;
            case 3:
               this.mainCharRidePlane_show_Handle(RideFeedPanel.GET_RENEWENERGR_ENERGYACCATK_SHOW);
               break;
            case 4:
               this.mainCharRidePlane_show_Handle(RideFeedPanel.GET_RENEWENERGR_ENERGYRECOVERY_SHOW);
               break;
            case 5:
               this.mainCharRidePlane_show_Handle(RideFeedPanel.GET_RENEWENERGR_ENERGYLIGHT_SHOW);
               break;
            case 6:
               this.mainCharRidePlane_show_Handle(RideFeedPanel.GET_RENEWENERGR_ENERGYHEALTH_SHOW);
               break;
            case 7:
               this.mainCharRidePlane_show_Handle(RideFeedPanel.GET_RIDE_FEED_GRADEUPGRADE_SHOW);
               break;
            case 8:
               this.mainCharRidePlane_show_Handle(RideFeedPanel.GET_RIDE_FEED_UPGRADEASSEMBLEDSKILL_SHOW);
               break;
            case 9:
               this.mainCharRidePlane_show_Handle(RideFeedPanel.UI_RIDE_FEED_TONGLINGTIANFU_SHOW);
               break;
            case 10:
               this.mainCharRidePlane_show_Handle(RideFeedPanel.GET_RIDE_JINHUA_SHOW);
               break;
            case 11:
               this.mainCharRidePlane_show_Handle(RideFeedPanel.UI_RIDE_NIEPAN_CLICK);
               break;
            case 12:
               this.mainCharRidePlane_show_Handle(RideFeedPanel.UI_RIDE_SHOUYUAN_SHOW);
               break;
            case 13:
               this.mainCharRidePlane_show_Handle(RideFeedPanel.GET_RENEWENERGR_ENERGYCHUZHAN_SHOW);
         }
      }
      
      public function setPotential(param1:int, param2:int) : void
      {
         this.mainCharRideFeedPlane.setPotential(param1,param2);
         var _loc3_:Goods = new Goods(9214);
         _loc3_.count = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(9214,true);
         this.mainCharRideFeedPlane.showStrengthenEnergyPotential(_loc3_);
      }
      
      public function showRideStrengthen(param1:Boolean = false) : void
      {
         if(!param1)
         {
            this._plane_type = -1;
         }
         this.mainCharRideFeedPlane.showRideStrengthen(param1);
         var _loc2_:PureMount = GameInstance.mainCharData.mountInfo.selectedMount;
         if(_loc2_ != null)
         {
            this.mainCharRideFeedPlane.setNameLevel(_loc2_.name,_loc2_.mountAttributeInfo.lv);
         }
         var _loc3_:MountAttributeInfo = _loc2_.mountAttributeInfo;
         this.mainCharRideFeedPlane.setRideStrengthenValue(_loc3_.savvy,_loc3_.getQualityName(),_loc3_.fightNow,_loc3_.fightMax,_loc3_.points_attackNow,_loc3_.points_attackMax,_loc3_.points_attackFujia,_loc3_.points_defenceNow,_loc3_.points_defenceMax,_loc3_.points_defenceFujia,_loc3_.points_flyNow,_loc3_.points_flyMax,_loc3_.points_flyFujia,_loc3_.points_stongNow,_loc3_.points_stongMax,_loc3_.points_stongFujia);
         this.mainCharRideFeedPlane.isShowShenqizizhidanBtn(false);
      }
      
      public function showStrengthenEnergyQuality(param1:String, param2:String, param3:int, param4:String, param5:int, param6:String, param7:int, param8:String, param9:int, param10:String, param11:int, param12:int, param13:Goods = null, param14:Goods = null, param15:Boolean = false) : void
      {
         this._mouey_count = param11;
         this._sucess_probability = param12;
         this.mainCharRideFeedPlane.showStrengthenEnergyQuality(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15);
      }
      
      public function showStrengthenEnergySavvy(param1:String, param2:String, param3:Array, param4:Array, param5:int, param6:int, param7:Goods = null, param8:Goods = null, param9:Boolean = false) : void
      {
         this._mouey_count = param5;
         this._sucess_probability = param6;
         this.mainCharRideFeedPlane.showStrengthenEnergySavvy(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function showStrengthenEnergyAttack(param1:String, param2:String, param3:String, param4:String, param5:int, param6:int, param7:Goods = null, param8:Goods = null, param9:Boolean = false) : void
      {
         this._mouey_count = param5;
         this._sucess_probability = param6;
         this.mainCharRideFeedPlane.showStrengthenEnergyAttack(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function showStrengthenEnergyRecovery(param1:String, param2:String, param3:String, param4:String, param5:int, param6:int, param7:Goods = null, param8:Goods = null, param9:Boolean = false) : void
      {
         this._mouey_count = param5;
         this._sucess_probability = param6;
         this.mainCharRideFeedPlane.showStrengthenEnergyRecovery(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function showStrengthenEnergyLight(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String, param7:int, param8:int, param9:Goods = null, param10:Goods = null, param11:Boolean = false) : void
      {
         this._mouey_count = param7;
         this._sucess_probability = param8;
         this.mainCharRideFeedPlane.showStrengthenEnergyLight(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function showStrengthenEnergyHealth(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String, param7:String, param8:String, param9:int, param10:int, param11:Goods = null, param12:Goods = null, param13:Boolean = false) : void
      {
         this._mouey_count = param9;
         this._sucess_probability = param10;
         this.mainCharRideFeedPlane.showStrengthenEnergyHealth(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
      }
      
      public function showGradeUpgrade() : void
      {
         this.mainCharRideFeedPlane.showGradeUpgrade(true);
      }
      
      public function setUpgradeGradeName(param1:String, param2:String, param3:int) : void
      {
         this.mainCharRideFeedPlane.setUpgradeGradeName(param1,param2);
         var _loc4_:PureMount = new PureMount(param3);
         this.lgjj_mount_name = _loc4_.res.name;
         this.lgjj_mount_need_ride_lv = _loc4_.res.use_me_grade_limit;
         this.setNextAvatar(_loc4_);
      }
      
      public function setUpgradeAvatar(param1:BitmapData, param2:String) : void
      {
         this.mainCharRideFeedPlane.setUpgradeAvatar(param1,param2);
      }
      
      public function setUpgradeProbability(param1:Number, param2:Number) : void
      {
         this.mainCharRideFeedPlane.setUpgradeProbability(param1,param2);
      }
      
      public function setUpgradeExpendItem(param1:BaseItem = null, param2:BaseItem = null, param3:* = false) : void
      {
         this.mainCharRideFeedPlane.setUpgradeExpendItem(param1,param2,param3);
      }
      
      public function fristSetUpgradeExpendMoneyAndProbability(param1:int, param2:int) : void
      {
         this._mouey_count = param1;
         this._sucess_probability = param2;
         this.setUpgradeExpendMoneyAndProbability(param1,param2);
      }
      
      public function setUpgradeExpendMoneyAndProbability(param1:int, param2:int) : void
      {
         this.mainCharRideFeedPlane.setUpgradeExpendMoneyAndProbability(param1,param2,this._longlinEwaiZengjia);
      }
      
      public function showTonglingtianfu() : void
      {
         this.mainCharRidePlaneMediator.setTabBarName(9);
         this.mainCharRideFeedPlane.showTongLingTianFuCanvas();
      }
      
      public function setMC() : void
      {
         this.mainCharRideFeedPlane.setMC();
      }
      
      public function setTonglingtianfu(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.TONGLINGDAN_ID,true);
         var _loc7_:Boolean = _loc6_.count >= param2;
         var _loc8_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.LONGQIDAN_ID,true);
         this.mainCharRideFeedPlane.setTongLingDan(_loc6_,_loc6_.count,param1,param2,param3,param4);
         this.mainCharRideFeedPlane.setLongQiDan(_loc8_,param5);
      }
      
      public function showSuperMountPanel(param1:int, param2:int, param3:int, param4:int, param5:int, param6:PureMount) : void
      {
         var _loc7_:Skill = null;
         this.mainCharRideFeedPlane.showJinHuaCanvas(param6.mountAttributeInfo.superMountType == 0 ? false : true);
         this.pointArr = [param1,param2,param3,param4];
         this.mainCharRideFeedPlane.JinHuaCanvasSetPoint(param1,param2,param3,param4,param5);
         this.mainCharRideFeedPlane.JinHuaCanvasSetIntroduceTextAndAvatar(param6.mountAttributeInfo.superMountType);
         for each(_loc7_ in param6.mountSkillInfo.skillObj)
         {
            if(_loc7_.id == this.superMountSelectedSkill)
            {
               this.mainCharRideFeedPlane.JinHuaCanvasSetSkill(param6.mountSkillInfo.skillObj,this.superMountSelectedSkill);
               return;
            }
         }
         this.mainCharRideFeedPlane.JinHuaCanvasSetSkill(param6.mountSkillInfo.skillObj,-1);
      }
      
      public function superMountAddPoint(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.pointArr = [param1,param2,param3,param4];
         this.mainCharRideFeedPlane.JinHuaCanvasSetPoint(param1,param2,param3,param4,param5);
      }
      
      public function superMountEatFeed(param1:Boolean) : void
      {
         if(param1)
         {
            this.mainCharRideFeedPlane.JinHuaSetFood(null);
            this.msgSenderProxy.send_50029([GameInstance.mainChar.id,2]);
         }
      }
      
      public function superMountSkillIndex(param1:int, param2:int, param3:int, param4:int) : void
      {
         if(param1 != this.superMountSelectedSkill)
         {
            return;
         }
         this.mainCharRideFeedPlane.JinHuaCanvasSetJinJieTiaoJian(param2,param3,param4);
      }
      
      public function superMountSkillUpData(param1:int, param2:int, param3:int, param4:PureMount) : void
      {
         if(param2 != this.superMountSelectedSkill)
         {
            return;
         }
         if(param3)
         {
            this.superMountSelectedSkill = param2;
            this.msgSenderProxy.send_50031([GameInstance.mainChar.id,param1]);
            this.msgSenderProxy.send_52087({
               "mid":param1,
               "kid":param2
            });
         }
      }
      
      public function superMountLvUp() : void
      {
         if(this._plane_type == 10)
         {
            this.msgSenderProxy.send_52083({
               "id":GameInstance.mainCharData.mountInfo.selectedMountID,
               "type":0
            });
         }
      }
      
      public function setRTime(param1:int) : void
      {
         this.mainCharRideFeedPlane.setRTime(param1);
      }
      
      public function niePanHandel(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var b:Boolean = false;
         var arr:Array = null;
         var id:uint = 0;
         var str:String = null;
         var e:Event = param1;
         evt = e as BaseEvent;
         switch(e.type)
         {
            case RideFeedPanel.UI_RIDE_FEED_NIEPAN_CLICK:
               this.msgSenderProxy.send_60609(GameInstance.mainCharData.mountInfo.selectedMount.id);
               break;
            case RideFeedPanel.UI_RIDE_FEED_NIEPAN_KAISHINIEPAN:
               this.isAuto = false;
               this.autoKnowTimerFun();
               this.msgSenderProxy.send_60611(GameInstance.mainCharData.mountInfo.selectedMount.id);
               this.mainCharRideFeedPlane.setNiePanTuPoBtn(!this.isAuto);
               break;
            case RideFeedPanel.UI_RIDE_FEED_NIEPAN_ZHIDONGNIEPAN:
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
                           msgSenderProxy.send_60611(GameInstance.mainCharData.mountInfo.selectedMount.id);
                        }
                        autoKnowTimerFun();
                        mainCharRideFeedPlane.setNiePanTuPoBtn(!isAuto);
                     }
                  });
               }
               else
               {
                  this.isAuto = evt.data as Boolean;
                  this.autoKnowTimerFun();
                  this.mainCharRideFeedPlane.setNiePanTuPoBtn(!this.isAuto);
               }
               break;
            case RideFeedPanel.UI_RIDE_FEED_NIEPAN_XIAOCHUJIYI:
               this.msgSenderProxy.send_60603([GameInstance.mainCharData.mountInfo.selectedMount.id,evt.data]);
               break;
            case RideFeedPanel.UI_RIDE_FEED_NIEPAN_DUIHUANZUOQI:
               arr = evt.data as Array;
               this.msgSenderProxy.send_60607([GameInstance.mainCharData.mountInfo.selectedMount.id,arr[0],arr[1]]);
               break;
            case RideFeedPanel.UI_RIDE_FEED_NIEPAN_GOUMAI_CLICK:
               id = uint(evt.data);
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[id,0]);
         }
      }
      
      public function showNiePanPanel() : void
      {
         this.mainCharRideFeedPlane.showNiePanCanvas();
      }
      
      public function setNiePan(param1:int, param2:int, param3:int, param4:int, param5:int, param6:Boolean, param7:Boolean) : void
      {
         this.mainCharRideFeedPlane.setNiePan(param2,param3,param4,param5,param6,param7);
         this.setNiePanAvatar(GameInstance.mainCharData.mountInfo.selectedMount);
      }
      
      public function setNiePanGoods(param1:int, param2:int) : void
      {
         var _loc3_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(param1,true);
         var _loc4_:Boolean = false;
         if(_loc3_.count >= param2)
         {
            _loc4_ = true;
         }
         this.autoKnowTimerFun();
         this.mainCharRideFeedPlane.showNiePanTupoPanel(true);
         this.mainCharRideFeedPlane.setNiePanGoods(_loc3_,_loc4_,param2);
      }
      
      public function setNiePanBtn(param1:Boolean) : void
      {
         this.mainCharRideFeedPlane.setNiePanTuPoBtn(param1);
      }
      
      public function setNiePanResult(param1:int) : void
      {
         if(param1 == 1)
         {
            this.isAuto = false;
            this.mainCharRideFeedPlane.setNiePanTuPoBtn(!this.isAuto);
            this.mainCharRideFeedPlane.showNiePanTupoPanel(false);
            this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMount.id,11]);
         }
         else if(param1 == 2)
         {
            this.isAuto = false;
            this.mainCharRideFeedPlane.setNiePanTuPoBtn(!this.isAuto);
         }
         else
         {
            this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMount.id,11]);
            this.msgSenderProxy.send_60609(GameInstance.mainCharData.mountInfo.selectedMount.id);
         }
      }
      
      public function setNiePanDuiHuanResult(param1:Boolean, param2:int) : void
      {
         this.mainCharRideFeedPlane.setNiePanDuiHuanResult(param1,param2);
      }
      
      public function showNiePanZhuanYi(param1:int) : void
      {
         this.mainCharRideFeedPlane.showNiePanZhuanYi(param1);
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
               msgSenderProxy.send_60611(GameInstance.mainCharData.mountInfo.selectedMount.id);
            }
         };
         if(this.isAuto && this.mainCharRideFeedPlane.isShowNiePanTuPo())
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
      
      private function setNiePanAvatar(param1:PureMount) : void
      {
         var apdArr:Array;
         var apd:AvatarParamData;
         var callBack:Function = null;
         var $pMount:PureMount = param1;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != $pMount.id + "_" + avatar_zizeng)
            {
               return;
            }
            mainCharRideFeedPlane.setNiePanAvatar(param2);
         };
         this.mainCharRideFeedPlane.setNiePanAvatar(null);
         apdArr = [];
         apd = new AvatarParamData($pMount.getAvatarPath_Clothes());
         apdArr.push(apd);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pMount.id + "_" + ++this.avatar_zizeng,callBack,apdArr,1,CharStatusType.STAND,2);
      }
      
      public function shouYuanHandel(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:Array = null;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case RideFeedPanel.UI_RIDE_SHOUYUAN_SHOW:
               if(this.mainCharRideFeedPlane.isShowNiePanTuPo())
               {
                  this.mainCharRideFeedPlane.showNiePanTupoPanel(false);
               }
               this._plane_type = 12;
               this.msgSenderProxy.send_60651([GameInstance.mainCharData.mountInfo.selectedMount.id,-1]);
               break;
            case RideFeedPanel.UI_RIDE_SHOUYUAN_TUPO:
               _loc3_ = _loc2_.data as Array;
               this.msgSenderProxy.send_60653([GameInstance.mainCharData.mountInfo.selectedMount.id,_loc3_[0],_loc3_[1]]);
               break;
            case RideFeedPanel.UI_RIDE_SHOUYUAN_XIULIAN:
               _loc3_ = _loc2_.data as Array;
               PipeManager.sendMsg(PipeConstants.LONGYUAN_SKILL_CHOUJIANG,[GameInstance.mainCharData.mountInfo.selectedMount.id,_loc3_[0],_loc3_[1]]);
               break;
            case RideFeedPanel.UI_RIDE_SHOUYUAN_PRE_NEXT:
               this.msgSenderProxy.send_60651([GameInstance.mainCharData.mountInfo.selectedMount.id,_loc2_.data]);
         }
      }
      
      public function showShouYuanPanel() : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.ridePanel.rideFeed))
         {
            this.mainCharRidePlaneMediator.showFeedPanel();
         }
         this.mainCharRideFeedPlane.showShouYuanCanvas();
      }
      
      public function setShouYuanData(param1:int, param2:int, param3:int, param4:Array) : void
      {
         this.mainCharRideFeedPlane.setShouYuanData(param1,param2,param3,param4,GameInstance.mainCharData.attributeInfo.moxueNow);
      }
      
      public function showShouYuanTuPo(param1:Boolean) : void
      {
         this.mainCharRideFeedPlane.showShouYuanTuPo(param1);
      }
   }
}

