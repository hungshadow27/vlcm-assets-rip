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
   import com.tgame.moudels.mount.model.Mount_MsgSenderProxy;
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
   
   public class Mount_MainCharRidePlaneMediator extends Mediator
   {
      
      public static const NAME:String = "Mount_MainCharRidePlaneMediator";
      
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
      
      private var mounts_maxNum:int = 0;
      
      private var mounts_nowNum:int = 0;
      
      private var avatar_zizeng:int = 0;
      
      private var isUserOpen:Boolean = false;
      
      public var suc:Boolean = true;
      
      public var isAuto1:Boolean = false;
      
      private var autoTimer:Timer;
      
      private var isPanel:Boolean = true;
      
      private var _msgSenderProxy:Mount_MsgSenderProxy;
      
      private var _mainCharRideFeedPlaneMediator:Mount_MainCharRideFeedPlaneMediator;
      
      public function Mount_MainCharRidePlaneMediator()
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
      
      private function get mainCharRideFeedPlaneMediator() : Mount_MainCharRideFeedPlaneMediator
      {
         if(!this._mainCharRideFeedPlaneMediator)
         {
            this._mainCharRideFeedPlaneMediator = facade.retrieveMediator(Mount_MainCharRideFeedPlaneMediator.NAME) as Mount_MainCharRideFeedPlaneMediator;
         }
         return this._mainCharRideFeedPlaneMediator;
      }
      
      protected function get mainCharRidePlane() : RidePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.ridePanel);
         }
         return viewComponent as RidePanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
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
            mainCharRidePlane.addEventListener(Event.ADDED_TO_STAGE,mainCharRidePlaneHandle);
            mainCharRidePlane.addEventListener(Event.REMOVED_FROM_STAGE,mainCharRidePlaneHandle);
            mainCharRidePlane.addEventListener(RidePanel.GETRIDELISTINFO,mainCharRidePlaneHandle);
            mainCharRidePlane.addEventListener(RidePanel.GETRIDEINTBYID,mainCharRidePlaneHandle);
            mainCharRidePlane.addEventListener(RidePanel.GETRIDEADDRIDESLOT,mainCharRidePlaneHandle);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_RIDEBTN_CLICK,mainCharRidePlaneHandle);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_BREAKBTN_CLICK,mainCharRidePlaneHandle);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_REEDBTN_CLICK,mainCharRidePlaneHandle);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_SHOWBTN_CLICK,mainCharRidePlaneHandle);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_HIDEBTN_CLICK,mainCharRidePlaneHandle);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_RELEASE_CLICK,mainCharRidePlaneHandle);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_FEED_JINENGDAQUAN_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.addEventListener(RidePanel.GET_RIDE_FEED_RENEWENERGY_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.addEventListener(RidePanel.GET_RIDE_FEED_RIDESTRENGTHEN_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.addEventListener(RidePanel.GET_RIDE_FEED_GRADEUPGRADE_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_FEED_TONGLINGTIANFU_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.addEventListener(RidePanel.GET_RENEWENERGR_ENERGYHEALTH_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.addEventListener(RidePanel.GET_RENEWENERGR_ENERGYLIGHT_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.addEventListener(RidePanel.GET_RENEWENERGR_ENERGYACCATK_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.addEventListener(RidePanel.GET_RENEWENERGR_ENERGYRECOVERY_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.addEventListener(RidePanel.GET_RENEWENERGR_ENERGYQUALITY_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.addEventListener(RidePanel.GET_RENEWENERGR_ENERGYSAVVY_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.addEventListener(RidePanel.GET_RIDE_FEED_UPGRADEASSEMBLEDSKILL_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.addEventListener(RidePanel.UI_UPGRADEASSEMBLEDSKILL_EQUIP_CLICK,mainCharRidePlane_show_Handle);
            mainCharRidePlane.addEventListener(RidePanel.RIDE_FEED_USE_FODDER_RENEWENERGY,mainCharRidePlane_ok_Handle);
            mainCharRidePlane.addEventListener(RidePanel.RENEWENERGY_START,mainCharRidePlane_ok_Handle);
            mainCharRidePlane.addEventListener(RidePanel.GRADEUPGRADE_START,mainCharRidePlane_ok_Handle);
            mainCharRidePlane.addEventListener(RidePanel.RENEWENERGR_USE_ITEM_CONST,mainCharRidePlane_updateLuck_Handle);
            mainCharRidePlane.addEventListener(RidePanel.GRADEUPGRADE_JINJIEFU_USE,mainCharRidePlane_updateLuck_Handle);
            mainCharRidePlane.addEventListener(RidePanel.GRADEUPGRADE_KEEP,goon_lgjj);
            mainCharRidePlane.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_REED_SHENQILIANGUDAN_SHOW,show_shenqiliangudan_Handle);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_REED_SHENQILIANGUDAN_USR,shenqiliangudan_Handle);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_FEED_SHENQIZIZHIDAN_SHOW,show_shenqizizhidan_Handle);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_FEED_SHENQIZIZHIDAN_USE,shenqizizhidan_Handle);
            mainCharRidePlane.addEventListener(RidePanel.UI_REIDE_FEED_GRADEUPGRADE_TIPCANVAS_OPTION,checkJinjiefuHandle);
            mainCharRidePlane.addEventListener(RidePanel.UI_REIDE_FEED_GRADEUPGRADE_TIPCANVAS_NEXT_IS_SHOW,checkJinjiefuHandle);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_FEED_TONGLINGTIANFU_STRAT,checkJinjiefuHandle);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_FEED_TONGLINGTIANFU_CREATE,checkJinjiefuHandle);
            mainCharRidePlane.addEventListener(RidePanel.GET_RIDE_JINHUA_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_FEED_JINJIE_DRAG_ENTER,superMountHandel);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_FEED_JINJIE_DRAG_START,superMountHandel);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_FEED_JINJIE_WEIBTN,superMountHandel);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_FEED_JINJIE_OKBTN,superMountHandel);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_FEED_JINJIE_SKILL_CHICK,superMountHandel);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_FEED_JINJIE_STARTJINJIE,superMountHandel);
            mainCharRidePlane.addEventListener(RidePanel.GET_RENEWENERGR_ENERGYCHUZHANSHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.addEventListener(RidePanel.ENERGYPOTENTIAL_CLICK,mainCharRidePlane_potential_Handle);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_NIEPAN_CLICK,mainCharRidePlane_show_Handle);
            mainCharRidePlane.addEventListener(RidePanel.UI_RIDE_SHOUYUAN_CLICK,mainCharRidePlane_ShouYuan_Handle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(RidePanel,function():void
         {
            mainCharRidePlane.removeEventListener(Event.ADDED_TO_STAGE,mainCharRidePlaneHandle);
            mainCharRidePlane.removeEventListener(Event.REMOVED_FROM_STAGE,mainCharRidePlaneHandle);
            mainCharRidePlane.removeEventListener(RidePanel.GETRIDELISTINFO,mainCharRidePlaneHandle);
            mainCharRidePlane.removeEventListener(RidePanel.GETRIDEINTBYID,mainCharRidePlaneHandle);
            mainCharRidePlane.removeEventListener(RidePanel.GETRIDEADDRIDESLOT,mainCharRidePlaneHandle);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_RIDEBTN_CLICK,mainCharRidePlaneHandle);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_BREAKBTN_CLICK,mainCharRidePlaneHandle);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_REEDBTN_CLICK,mainCharRidePlaneHandle);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_SHOWBTN_CLICK,mainCharRidePlaneHandle);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_HIDEBTN_CLICK,mainCharRidePlaneHandle);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_RELEASE_CLICK,mainCharRidePlaneHandle);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_FEED_JINENGDAQUAN_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.GET_RIDE_FEED_RENEWENERGY_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.GET_RIDE_FEED_RIDESTRENGTHEN_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.GET_RIDE_FEED_GRADEUPGRADE_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_FEED_TONGLINGTIANFU_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.GET_RENEWENERGR_ENERGYHEALTH_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.GET_RENEWENERGR_ENERGYLIGHT_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.GET_RENEWENERGR_ENERGYACCATK_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.GET_RENEWENERGR_ENERGYRECOVERY_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.GET_RENEWENERGR_ENERGYQUALITY_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.GET_RENEWENERGR_ENERGYSAVVY_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.GET_RIDE_FEED_UPGRADEASSEMBLEDSKILL_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.UI_UPGRADEASSEMBLEDSKILL_EQUIP_CLICK,mainCharRidePlane_show_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.RIDE_FEED_USE_FODDER_RENEWENERGY,mainCharRidePlane_ok_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.RENEWENERGY_START,mainCharRidePlane_ok_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.GRADEUPGRADE_START,mainCharRidePlane_ok_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.RENEWENERGR_USE_ITEM_CONST,mainCharRidePlane_updateLuck_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.GRADEUPGRADE_JINJIEFU_USE,mainCharRidePlane_updateLuck_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.GRADEUPGRADE_KEEP,goon_lgjj);
            mainCharRidePlane.removeEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_REED_SHENQILIANGUDAN_SHOW,show_shenqiliangudan_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_REED_SHENQILIANGUDAN_USR,shenqiliangudan_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_FEED_SHENQIZIZHIDAN_SHOW,show_shenqizizhidan_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_FEED_SHENQIZIZHIDAN_USE,shenqizizhidan_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.UI_REIDE_FEED_GRADEUPGRADE_TIPCANVAS_OPTION,checkJinjiefuHandle);
            mainCharRidePlane.removeEventListener(RidePanel.UI_REIDE_FEED_GRADEUPGRADE_TIPCANVAS_NEXT_IS_SHOW,checkJinjiefuHandle);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_FEED_TONGLINGTIANFU_STRAT,checkJinjiefuHandle);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_FEED_TONGLINGTIANFU_CREATE,checkJinjiefuHandle);
            mainCharRidePlane.removeEventListener(RidePanel.GET_RIDE_JINHUA_SHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_FEED_JINJIE_DRAG_ENTER,superMountHandel);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_FEED_JINJIE_DRAG_START,superMountHandel);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_FEED_JINJIE_WEIBTN,superMountHandel);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_FEED_JINJIE_OKBTN,superMountHandel);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_FEED_JINJIE_SKILL_CHICK,superMountHandel);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_FEED_JINJIE_STARTJINJIE,superMountHandel);
            mainCharRidePlane.removeEventListener(RidePanel.GET_RENEWENERGR_ENERGYCHUZHANSHOW,mainCharRidePlane_show_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.ENERGYPOTENTIAL_CLICK,mainCharRidePlane_potential_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_NIEPAN_CLICK,mainCharRidePlane_show_Handle);
            mainCharRidePlane.removeEventListener(RidePanel.UI_RIDE_SHOUYUAN_CLICK,mainCharRidePlane_ShouYuan_Handle);
         });
      }
      
      private function mainCharRidePlaneHandle(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Goods = null;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case Event.ADDED_TO_STAGE:
               this.mainCharRidePlane.setTabBar(GameState.dictMainStatus[SpecialGoodsID.ZUOQI_DIANFENGSHOU_ID]);
               this.isUserOpen = true;
               this.mainCharRidePlane.closeNiePanTupoPanel();
               break;
            case Event.REMOVED_FROM_STAGE:
               this.isUserOpen = false;
               this.mainCharRidePlane.closeNiePanTupoPanel();
               break;
            case RidePanel.GETRIDELISTINFO:
               this.msgSenderProxy.send_50029([GameInstance.mainChar.id,2]);
               break;
            case RidePanel.GETRIDEINTBYID:
               _loc3_ = param1 as BaseEvent;
               _loc4_ = int(Number(_loc3_.data));
               _loc5_ = 0;
               if(GameInstance.mainCharData.mountInfo.selectedMountID != -1)
               {
                  _loc5_ = GameInstance.mainCharData.mountInfo.selectedMountID;
               }
               GameInstance.mainCharData.mountInfo.selectedMountID = _loc4_;
               if(_loc4_ == -1 || _loc4_ == -2)
               {
                  if(_loc4_ == -2)
                  {
                     _loc6_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.KUOZHANFU,true);
                     this.mainCharRidePlane.showRideSlotExtendPanel(this.mounts_maxNum + 1,_loc6_,_loc6_.count >= this.mounts_maxNum + 1);
                  }
                  this.mainCharRidePlane.rideFeed.visible = false;
               }
               else
               {
                  this.msgSenderProxy.send_50031([GameInstance.mainChar.id,_loc4_]);
                  this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
                  if(this._plane_type == 7 || this._plane_type == 9)
                  {
                     this.suc = true;
                  }
                  this.mainCharRidePlane.setTuPoBtn(this.suc,this._plane_type);
                  if(_loc5_ != _loc4_)
                  {
                     this.mainCharRidePlane.setTuPoBtn(true,this._plane_type);
                  }
               }
               break;
            case RidePanel.GETRIDEADDRIDESLOT:
               GameInstance.mainCharData.mountInfo.selectedMountID = -1;
               this.msgSenderProxy.send_50049();
               break;
            case RidePanel.UI_RIDE_RIDEBTN_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc4_ = int(Number(_loc3_.data));
               this.msgSenderProxy.send_50033(_loc4_);
               break;
            case RidePanel.UI_RIDE_BREAKBTN_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc4_ = int(Number(_loc3_.data));
               this.msgSenderProxy.send_50035(_loc4_);
               break;
            case RidePanel.UI_RIDE_REEDBTN_CLICK:
               this._plane_type = 7;
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               break;
            case RidePanel.UI_RIDE_SHOWBTN_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc4_ = int(Number(_loc3_.data));
               this.msgSenderProxy.send_50037(_loc4_);
               break;
            case RidePanel.UI_RIDE_HIDEBTN_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc4_ = int(Number(_loc3_.data));
               this.msgSenderProxy.send_50039(_loc4_);
               break;
            case RidePanel.UI_RIDE_RELEASE_CLICK:
               _loc3_ = param1 as BaseEvent;
               _loc4_ = int(Number(_loc3_.data));
               this.msgSenderProxy.send_50041(_loc4_);
         }
      }
      
      private function mainCharRidePlane_show_Handle(param1:*) : void
      {
         var _loc6_:Goods = null;
         var _loc7_:Array = null;
         var _loc8_:Array = null;
         var _loc9_:Array = null;
         var _loc10_:SkillRes = null;
         var _loc11_:Skill = null;
         var _loc2_:String = param1 is Event ? param1.type : param1;
         var _loc3_:BaseEvent = param1 as BaseEvent;
         var _loc4_:String = "";
         if(this._plane_type_str != _loc2_)
         {
            this._plane_type_str = _loc2_;
            this._mouey_count = 0;
            this._sucess_probability = 0;
            this._luck_count = 0;
            this.lgjj_mount_name = "";
            this.lgjj_mount_need_ride_lv = 0;
         }
         if(GameInstance.mainCharData.mountInfo.selectedMount == null)
         {
            if(!(GameInstance.mainCharData.mountInfo.mountArr != null && GameInstance.mainCharData.mountInfo.mountArr.length > 0))
            {
               return;
            }
            this.setSelectRideByID(GameInstance.mainCharData.mountInfo.mountArr[0].id);
         }
         var _loc5_:PureMount = GameInstance.mainCharData.mountInfo.selectedMount;
         if(_loc5_ == null)
         {
            NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请选中坐骑在进行【进阶】、【通灵、【潜力】等操作！】"));
            return;
         }
         switch(_loc2_)
         {
            case RidePanel.GET_RIDE_FEED_RENEWENERGY_SHOW:
               this._btn_type = 1;
               this._plane_type = 0;
               _loc6_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.HOURSE_CAOLIAO_ID,true);
               this.mainCharRidePlane.setNameLevel(_loc5_.name,_loc5_.mountAttributeInfo.lv);
               this.mainCharRidePlane.showRenewEnerg();
               break;
            case RidePanel.GET_RIDE_FEED_RIDESTRENGTHEN_SHOW:
               this._btn_type = 2;
               this._plane_type = -1;
               this.showRideStrengthen(false);
               this.showFeedPanel();
               break;
            case RidePanel.GET_RIDE_FEED_GRADEUPGRADE_SHOW:
               this._btn_type = 3;
               this._plane_type = 7;
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               break;
            case RidePanel.UI_RIDE_FEED_TONGLINGTIANFU_SHOW:
               this._btn_type = 5;
               this._plane_type = 9;
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               this.mainCharRidePlane.showTongLingTianFuCanvas();
               if(_loc5_.mountAttributeInfo.nextMountName != "")
               {
                  this.mainCharRidePlane.showUpgradeAssembledSkill(_loc5_.name,_loc5_.res.zuhe_skill_count.toString(),_loc5_.mountAttributeInfo.nextMountName,String(_loc5_.mountAttributeInfo.nextMountZuhejiRL),_loc5_.res.zuhe_skill_count);
               }
               else
               {
                  this.mainCharRidePlane.showUpgradeAssembledSkill(_loc5_.name,_loc5_.res.zuhe_skill_count.toString(),"","",_loc5_.res.zuhe_skill_count);
               }
               this.mainCharRidePlane.setSkillInitialize(_loc5_.mountAttributeInfo.getMountZuHeSkillArr());
               break;
            case RidePanel.GET_RIDE_JINHUA_SHOW:
               this._plane_type = 10;
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               break;
            case RidePanel.GET_RENEWENERGR_ENERGYQUALITY_SHOW:
               this._plane_type = 1;
               if(this._plane_type != -1)
               {
                  this.showRideStrengthen(true);
               }
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               this.isAuto1 = this.mainCharRidePlane.reBtnState(this._plane_type);
               break;
            case RidePanel.GET_RENEWENERGR_ENERGYSAVVY_SHOW:
               this._plane_type = 2;
               if(this._plane_type != -1)
               {
                  this.showRideStrengthen(true);
               }
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               this.isAuto1 = this.mainCharRidePlane.reBtnState(this._plane_type);
               break;
            case RidePanel.GET_RENEWENERGR_ENERGYACCATK_SHOW:
               this._plane_type = 3;
               if(this._plane_type != -1)
               {
                  this.showRideStrengthen(true);
               }
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               this.isAuto1 = this.mainCharRidePlane.reBtnState(this._plane_type);
               break;
            case RidePanel.GET_RENEWENERGR_ENERGYRECOVERY_SHOW:
               this._plane_type = 4;
               if(this._plane_type != -1)
               {
                  this.showRideStrengthen(true);
               }
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               this.isAuto1 = this.mainCharRidePlane.reBtnState(this._plane_type);
               break;
            case RidePanel.GET_RENEWENERGR_ENERGYLIGHT_SHOW:
               this._plane_type = 5;
               if(this._plane_type != -1)
               {
                  this.showRideStrengthen(true);
               }
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               this.isAuto1 = this.mainCharRidePlane.reBtnState(this._plane_type);
               break;
            case RidePanel.GET_RENEWENERGR_ENERGYHEALTH_SHOW:
               this._plane_type = 6;
               if(this._plane_type != -1)
               {
                  this.showRideStrengthen(true);
               }
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               this.isAuto1 = this.mainCharRidePlane.reBtnState(this._plane_type);
               break;
            case RidePanel.GET_RENEWENERGR_ENERGYCHUZHANSHOW:
               this._plane_type = 13;
               if(this._plane_type != -1)
               {
                  this.showRideStrengthen(true);
               }
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               this.isAuto1 = this.mainCharRidePlane.reBtnState(this._plane_type);
               break;
            case RidePanel.GET_RIDE_FEED_UPGRADEASSEMBLEDSKILL_SHOW:
               this._btn_type = 4;
               this._plane_type = 8;
               if(_loc5_.mountAttributeInfo.nextMountName != "")
               {
                  this.mainCharRidePlane.showUpgradeAssembledSkill(_loc5_.name,_loc5_.res.zuhe_skill_count.toString(),_loc5_.mountAttributeInfo.nextMountName,String(_loc5_.mountAttributeInfo.nextMountZuhejiRL),_loc5_.res.zuhe_skill_count);
               }
               else
               {
                  this.mainCharRidePlane.showUpgradeAssembledSkill(_loc5_.name,_loc5_.res.zuhe_skill_count.toString(),"","",_loc5_.res.zuhe_skill_count);
               }
               this.mainCharRidePlane.setSkillInitialize(_loc5_.mountAttributeInfo.getMountZuHeSkillArr());
               break;
            case RidePanel.UI_UPGRADEASSEMBLEDSKILL_EQUIP_CLICK:
               _loc7_ = param1.data as Array;
               if(TCursorManager.currentItemFace != null && TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  if(!(TCursorManager.currentItemFace.getBaseItem() is Skill))
                  {
                     return;
                  }
                  _loc11_ = TCursorManager.currentItemFace.getBaseItem() as Skill;
                  this.msgSenderProxy.send_52061([_loc5_.id,_loc7_[1],_loc11_.id]);
               }
               else if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_MOREN && _loc7_[0] != null)
               {
                  this.msgSenderProxy.send_52063([_loc5_.id,_loc7_[1]]);
               }
               break;
            case RidePanel.UI_RIDE_FEED_JINENGDAQUAN_SHOW:
               _loc8_ = SkillResManager.getMountSkillResArr();
               _loc9_ = [];
               for each(_loc10_ in _loc8_)
               {
                  _loc9_.push(new Skill(_loc10_.id_kind));
               }
               this.mainCharRidePlane.showAllSkillPanel(_loc9_);
               break;
            case RidePanel.UI_RIDE_NIEPAN_CLICK:
               this.mainCharRidePlane.closeNiePanTupoPanel();
               this._plane_type = 11;
               this.msgSenderProxy.send_50011([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
               break;
            case RidePanel.UI_RIDE_SHOUYUAN_CLICK:
               this.mainCharRidePlane.closeNiePanTupoPanel();
               this._plane_type = 12;
               this.mainCharRidePlane_ShouYuan_Handle();
         }
         this.mainCharRidePlane.setBarLabel(this._plane_type);
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
               this.mainCharRidePlane.setUpgradeAddBuff(new Buff(OtherConst.BUFF_LONGLIN));
            }
            else
            {
               this.mainCharRidePlane.setUpgradeAddBuff(null);
            }
            this.mainCharRidePlane.isShowShenQiLianGuDanTip(GameState.gongneng108);
            this.mainCharRidePlane.isShowShenQiLianGuDanBtn(GameState.gongneng105);
         }
         if(this._plane_type >= 1 && this._plane_type <= 6)
         {
            this.mainCharRidePlane.isShowShenqizizhidanBtn(GameState.gongneng107);
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
               this.mainCharRidePlane.setStrengthenEnergyQualityExpendMoneyAndProbability(this._mouey_count,_loc2_);
               break;
            case 2:
               this.mainCharRidePlane.setStrengthenEnergySavvyExpendMoneyAndProbability(this._mouey_count,_loc2_);
               break;
            case 3:
               this.mainCharRidePlane.setStrengthenEnergyAttackExpendMoneyAndProbability(this._mouey_count,_loc2_);
               break;
            case 4:
               this.mainCharRidePlane.setStrengthenEnergyRecoveryExpendMoneyAndProbability(this._mouey_count,_loc2_);
               break;
            case 5:
               this.mainCharRidePlane.setStrengthenEnergyLightExpendMoneyAndProbability(this._mouey_count,_loc2_);
               break;
            case 6:
               this.mainCharRidePlane.setStrengthenEnergyHealthExpendMoneyAndProbability(this._mouey_count,_loc2_);
               break;
            case 7:
               this.mainCharRidePlane.setUpgradeExpendMoneyAndProbability(this._mouey_count,_loc2_,this._longlinEwaiZengjia);
               break;
            case 11:
               this.mainCharRidePlane_show_Handle(RidePanel.UI_RIDE_NIEPAN_CLICK);
               break;
            case 12:
               this.mainCharRidePlane_ShouYuan_Handle();
         }
      }
      
      public function setMoney(param1:int, param2:int) : void
      {
         this._mouey_count = param1;
         this._sucess_probability = param2;
      }
      
      private function mainCharRidePlane_ok_Handle(param1:Event = null, param2:Boolean = false) : void
      {
         var baseE:BaseEvent;
         var ty:int = 0;
         var str:String = null;
         var e:Event = param1;
         var $useShenqiLiangu:Boolean = param2;
         this.isAuto1 = false;
         baseE = e as BaseEvent;
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
               this.mainCharRidePlane.showLevelLessPanel(this.lgjj_mount_name,this.lgjj_mount_need_ride_lv);
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
               str = LanResManager.getLanTextWords(this,"您希望自动使用背包中的提升道具提升各项潜能么",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]);
               FAlert.okLabel = LanResManager.getLanCommonTextWords("自动提升");
               FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取消");
               FAlert.show(str,"",2,function(param1:FAlertEvent):void
               {
                  if(param1.eventData == FAlert.OK)
                  {
                     isAuto1 = ty == 1;
                     mainCharRidePlane.setTuPoBtn(!isAuto1,_plane_type);
                     autoTimerFun();
                  }
               });
            }
            else if(ty == 2)
            {
               this.isAuto1 = ty == 1;
               this.mainCharRidePlane.setTuPoBtn(!this.isAuto1,this._plane_type);
               this.autoTimerFun();
            }
            else
            {
               this.isAuto1 = false;
               this.mainCharRidePlane.setTuPoBtn(true,0);
               this.autoTimerFun();
               this.goon_lgjj();
            }
         }
      }
      
      public function autoTimerFun() : void
      {
         var fun:Function = null;
         fun = function(param1:TimerEvent):void
         {
            autoTimer.removeEventListener(TimerEvent.TIMER,fun);
            autoTimer = null;
            if(isAuto1)
            {
               if(_plane_type == 7 || _plane_type == 9)
               {
                  return;
               }
               msgSenderProxy.send_50027([GameInstance.mainCharData.mountInfo.selectedMountID,_plane_type,_luck_count]);
            }
         };
         this.isAuto1 = this.mainCharRidePlane.reBtnState(this._plane_type);
         if(Boolean(this.isAuto1) && Boolean(GameInstance.uiInstance.ridePanel.rideFeed) && Boolean(GameInstance.uiInstance.ridePanel))
         {
            if(this.autoTimer != null)
            {
               return;
            }
            this.autoTimer = new Timer(500,1);
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
            case RidePanel.UI_RIDE_FEED_JINJIE_DRAG_START:
               this.mainCharRidePlane.JinHuaSetFood(null);
               break;
            case RidePanel.UI_RIDE_FEED_JINJIE_DRAG_ENTER:
               if(TCursorManager.getCurruntStatus() == TCursorManager.CURSOR_DRAG)
               {
                  if(TCursorManager.currentItemFace.getBaseItem() is McBaseItem)
                  {
                     return;
                  }
                  _loc4_ = TCursorManager.currentItemFace.getBaseItem() as Goods;
                  this.mainCharRidePlane.JinHuaSetFood(_loc4_);
               }
               break;
            case RidePanel.UI_RIDE_FEED_JINJIE_WEIBTN:
               if(this.mainCharRidePlane.getFood() == null)
               {
                  NoticeManager.notify(NoticeManager.FOOT,LanResManager.getLanCommonTextWords("请放入物品"));
                  NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanCommonTextWords("请放入物品"));
                  return;
               }
               this.msgSenderProxy.send_52085({
                  "id":GameInstance.mainCharData.mountInfo.selectedMountID,
                  "index":this.mainCharRidePlane.getFood().position
               });
               break;
            case RidePanel.UI_RIDE_FEED_JINJIE_OKBTN:
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
            case RidePanel.UI_RIDE_FEED_JINJIE_SKILL_CHICK:
               this.superMountSelectedSkill = _loc2_.data as int;
               this.msgSenderProxy.send_52087({
                  "mid":GameInstance.mainCharData.mountInfo.selectedMountID,
                  "kid":this.superMountSelectedSkill
               });
               break;
            case RidePanel.UI_RIDE_FEED_JINJIE_STARTJINJIE:
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
            this.mainCharRidePlane.showGradeUpgradeTip();
         }
         else
         {
            if(this._plane_type == 7 && this.isAuto1 == true || this._plane_type == 9 && this.isAuto1 == true)
            {
               return;
            }
            this.msgSenderProxy.send_50027([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type,this._luck_count]);
         }
      }
      
      private function checkJinjiefuHandle(param1:*) : void
      {
         var _loc2_:String = param1 is Event ? param1.type : param1;
         switch(_loc2_)
         {
            case RidePanel.UI_REIDE_FEED_GRADEUPGRADE_TIPCANVAS_OPTION:
               if((param1 as BaseEvent).data == true)
               {
                  this.msgSenderProxy.send_50027([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type,this._luck_count]);
               }
               break;
            case RidePanel.UI_REIDE_FEED_GRADEUPGRADE_TIPCANVAS_NEXT_IS_SHOW:
               this._tishiUseJinjiefu = !(param1 as BaseEvent).data;
               break;
            case RidePanel.UI_RIDE_FEED_TONGLINGTIANFU_STRAT:
               this.msgSenderProxy.send_50027([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type,0]);
               break;
            case RidePanel.UI_RIDE_FEED_TONGLINGTIANFU_CREATE:
               this.msgSenderProxy.send_50027([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type,1]);
         }
      }
      
      private function mainCharRidePlane_potential_Handle(param1:*) : void
      {
         var _loc2_:String = param1 is Event ? param1.type : param1;
         this._plane_type = 13;
         this.msgSenderProxy.send_50027([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type,this._luck_count]);
      }
      
      private function onRemoveFromStage(param1:Event) : void
      {
         var pMount:PureMount;
         var goOnShenjie:Function;
         var e:Event = param1;
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
                     mainCharRidePlane.showFeedPanel(_plane_type);
                  }
               };
            }
         }
      }
      
      public function showTipPanel(param1:Function) : void
      {
         if(this._plane_type == 7)
         {
            this.mainCharRidePlane.showTipPanel(param1);
         }
      }
      
      private function show_shenqiliangudan_Handle(param1:*) : void
      {
         this.mainCharRidePlane.showShenQiLianGuDan();
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
         this.mainCharRidePlane.showShenQizizhidanPanel();
      }
      
      private function shenqizizhidan_Handle(param1:*) : void
      {
         if(this._plane_type >= 1 && this._plane_type <= 6)
         {
            this.msgSenderProxy.send_50051([GameInstance.mainCharData.mountInfo.selectedMountID,this._plane_type]);
         }
      }
      
      public function setRideList(param1:int, param2:int, param3:Array) : void
      {
         var _loc5_:String = null;
         var _loc6_:PureMount = null;
         var _loc7_:int = 0;
         var _loc9_:int = 0;
         if(GameInstance.uiInstance._ridePanel == null)
         {
            return;
         }
         if(!Fun.isVisible(this.mainCharRidePlane))
         {
            return;
         }
         var _loc4_:XML = <list/>;
         this.mounts_maxNum = param1;
         this.mounts_nowNum = param2;
         _loc5_ = param2 + "/" + param1;
         _loc7_ = 0;
         var _loc8_:int = 0;
         for each(_loc6_ in param3)
         {
            _loc4_.appendChild(<node index={_loc7_} ycsx={_loc6_.mountAttributeInfo.ycsx} xs={_loc6_.mountAttributeInfo.bloodS} showlabel={_loc6_.name} icoId={_loc6_.res.id_ico} level={_loc6_.mountAttributeInfo.lv} label={_loc6_.id} state={_loc6_.fightStatus} wx={_loc6_.mountAttributeInfo.savvy} quality={_loc6_.mountAttributeInfo.getQualityName()} zw1={_loc6_.mountAttributeInfo.zw1} zw2={_loc6_.mountAttributeInfo.zw2} zw3={_loc6_.mountAttributeInfo.zw3} zw4={_loc6_.mountAttributeInfo.zw4}/>);
            _loc7_++;
         }
         _loc9_ = param1 - param2;
         _loc7_ = 0;
         while(_loc7_ < _loc9_)
         {
            _loc4_.appendChild(<node showlabel={LanResManager.getLanCommonTextWords("空闲槽位")}/>);
            _loc7_++;
         }
         if(this.mounts_maxNum < 10)
         {
            _loc4_.appendChild(<node showlabel={LanResManager.getLanCommonTextWords("增加槽位")}/>);
         }
         this.mainCharRidePlane.setRideList(_loc4_,_loc5_);
         if(GameInstance.mainCharData.mountInfo.selectedMount != null)
         {
            this.setSelectRideByID(GameInstance.mainCharData.mountInfo.selectedMountID);
         }
         else if(GameInstance.mainCharData.mountInfo.currentMount != null)
         {
            this.setSelectRideByID(GameInstance.mainCharData.mountInfo.currentMountID);
         }
         else if(GameInstance.mainCharData.mountInfo.currentFightMount != null)
         {
            this.setSelectRideByID(GameInstance.mainCharData.mountInfo.currentFightMountID);
         }
         else if(GameInstance.mainCharData.mountInfo.mountArr.length > 0)
         {
            this.setSelectRideByID(GameInstance.mainCharData.mountInfo.mountArr[0].id);
         }
         if(this.isUserOpen)
         {
            this.isUserOpen = false;
            if(GameInstance.mainCharData.mountInfo.selectedMount != null)
            {
            }
         }
      }
      
      public function refreshRideList() : void
      {
         var _loc2_:PureMount = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(!Fun.isVisible(GameInstance.uiInstance._ridePanel))
         {
            return;
         }
         var _loc1_:XML = <list/>;
         for each(_loc2_ in GameInstance.mainCharData.mountInfo.mountArr)
         {
            _loc1_.appendChild(<node ycsx={_loc2_.mountAttributeInfo.ycsx} icoId={_loc2_.res.id_ico} xs={_loc2_.mountAttributeInfo.bloodS} showlabel={_loc2_.name} wx={_loc2_.mountAttributeInfo.savvy} level={_loc2_.mountAttributeInfo.lv} label={_loc2_.id} state={_loc2_.fightStatus} quality={_loc2_.mountAttributeInfo.getQualityName()} zw1={_loc2_.mountAttributeInfo.zw1} zw2={_loc2_.mountAttributeInfo.zw2} zw3={_loc2_.mountAttributeInfo.zw3} zw4={_loc2_.mountAttributeInfo.zw4}/>);
         }
         _loc3_ = this.mounts_maxNum - this.mounts_nowNum;
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc1_.appendChild(<node showlabel={LanResManager.getLanCommonTextWords("空闲槽位")}/>);
            _loc4_++;
         }
         if(this.mounts_maxNum < 10)
         {
            _loc1_.appendChild(<node showlabel={LanResManager.getLanCommonTextWords("增加槽位")}/>);
         }
         this.mainCharRidePlane.refreshRideList(_loc1_,GameInstance.mainCharData.mountInfo.selectedMountID);
      }
      
      public function setRideInfo(param1:PureMount, param2:int, param3:String = "") : void
      {
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         var _loc9_:Number = 0;
         var _loc10_:Number = 0;
         var _loc11_:Number = 0;
         var _loc12_:Number = 0;
         var _loc13_:MountAttributeInfo = param1.mountAttributeInfo;
         this.swapBtnLabel(param1.fightStatus);
         this.mainCharRidePlane.setRideBaseAttribute(param1.name,_loc13_.getQualityName(),String(_loc13_.savvy),String(_loc13_.identity),String(_loc13_.lv));
         this.mainCharRidePlane.setRideAttibute(_loc13_.expNow,_loc13_.expMax,_loc13_.energyNow,_loc13_.energyMax,_loc13_.fightNow,_loc13_.fightMax,_loc13_.points_attackNow,_loc13_.points_attackMax,_loc13_.points_defenceNow,_loc13_.points_defenceMax,_loc13_.points_flyNow,_loc13_.points_flyMax,_loc13_.points_stongNow,_loc13_.points_stongMax,_loc13_.points_attackFujia,_loc13_.points_defenceFujia,_loc13_.points_flyFujia,_loc13_.points_stongFujia);
         this.mainCharRidePlane.setRideEquip(param1.mountGoodsInfo.fullGoodsArr);
         this.mainCharRidePlane.setRideSkill(param1.mountSkillInfo.skillObj);
         this.mainCharRidePlane.setExpireDate(param3);
         this.mainCharRidePlane.setShouwangzhihun(_loc13_.isLong,_loc13_.shouwangzhihunJihuo);
         this.mainCharRidePlane.ride.setDreamBarPercentage(param1.mountAttributeInfo.menghuan * 100,param1.mountAttributeInfo.menghuan_mhd,param1.mountAttributeInfo.menghuan_wuxing * 100,param1.mountAttributeInfo.menghuan_qianli * 100,param1.mountAttributeInfo.menghuan_jineng * 100,param1.mountAttributeInfo.menghuanShendanJihuo,param1.mountAttributeInfo.chaojizuoqiQianNengDan,param1.mountAttributeInfo.shoushenDan,param1.mountAttributeInfo.zhongjizuoqiQianNengDan,param1.mountAttributeInfo.dianfengqiannengDan);
         _loc4_ = _loc13_.append_hp + _loc13_.menghuan_append_hp;
         _loc5_ = _loc13_.append_mp + _loc13_.menghuan_append_mp;
         _loc6_ = _loc13_.append_pp + _loc13_.menghuan_append_pp;
         _loc7_ = _loc13_.append_ap + _loc13_.menghuan_append_ap;
         _loc8_ = _loc13_.append_dp + _loc13_.menghuan_append_dp;
         _loc9_ = _loc13_.append_cp + _loc13_.menghuan_append_cp;
         _loc10_ = _loc13_.append_ev + _loc13_.menghuan_append_ev;
         _loc11_ = _loc13_.append_adx + _loc13_.menghuan_append_adx;
         _loc12_ = _loc13_.append_mdx + _loc13_.menghuan_append_mdx;
         if(param1.mountAttributeInfo.superMountType > 0)
         {
            _loc4_ += param1.mountAttributeInfo.superMpunt_hp;
            _loc5_ += param1.mountAttributeInfo.superMpunt_mp;
            _loc6_ += param1.mountAttributeInfo.superMpunt_pp;
            _loc7_ += param1.mountAttributeInfo.superMpunt_ap;
            _loc8_ += param1.mountAttributeInfo.superMpunt_dp;
            _loc9_ += param1.mountAttributeInfo.superMpunt_cp;
            _loc10_ += param1.mountAttributeInfo.superMpunt_ev;
            _loc11_ += param1.mountAttributeInfo.superMpunt_adx;
            _loc12_ += param1.mountAttributeInfo.superMpunt_mdx;
         }
         _loc4_ += param1.mountAttributeInfo.souyuan_hp;
         _loc5_ += param1.mountAttributeInfo.souyuan_mp;
         _loc6_ += param1.mountAttributeInfo.souyuan_pp;
         _loc7_ += param1.mountAttributeInfo.souyuan_ap;
         _loc8_ += param1.mountAttributeInfo.souyuan_dp;
         _loc9_ += param1.mountAttributeInfo.souyuan_cp;
         _loc10_ += param1.mountAttributeInfo.souyuan_ev;
         _loc11_ += param1.mountAttributeInfo.souyuan_adx;
         _loc12_ += param1.mountAttributeInfo.souyuan_mdx;
         this.setAvatar(param1,param2);
         this.mainCharRidePlane.setDreamValue(_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_);
         this.mainCharRidePlane.setSiShengShouValue(_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_);
         this.mainCharRidePlane.setRideAddCharValue(_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_);
         this.mainCharRidePlane.rideFeed.visible = true;
         this.f5OldView();
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
            mainCharRidePlane.setNextAvatar(param2);
         };
         this.mainCharRidePlane.setNextAvatar(null);
         apdArr = [];
         apd = new AvatarParamData($pMount.getAvatarPath_Clothes());
         apdArr.push(apd);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pMount.id + "_" + ++this.avatar_zizeng,callBack,apdArr,1,CharStatusType.STAND,2);
      }
      
      private function setAvatar(param1:PureMount, param2:int = 0) : void
      {
         var apdArr:Array;
         var apd:AvatarParamData;
         var callBack:Function = null;
         var $pMount:PureMount = param1;
         var intYinCangShuXingJiHuo:int = param2;
         callBack = function(param1:*, param2:BitmapData):void
         {
            if(param1 != $pMount.id + "_" + avatar_zizeng)
            {
               return;
            }
            mainCharRidePlane.setAvatar(param2,$pMount.res.id_ico);
            mainCharRidePlane.setYinCangShuXingJiHuo(intYinCangShuXingJiHuo);
         };
         this.mainCharRidePlane.setAvatar(null,0);
         this.mainCharRidePlane.setYinCangShuXingJiHuo(0);
         apdArr = [];
         apd = new AvatarParamData($pMount.getAvatarPath_Clothes());
         apdArr.push(apd);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pMount.id + "_" + ++this.avatar_zizeng,callBack,apdArr,1,CharStatusType.STAND,2);
      }
      
      public function swapBtnLabel(param1:int) : void
      {
         this.mainCharRidePlane.swapBtnLabel(param1);
      }
      
      public function showFeedPanel() : void
      {
         if(!Fun.isVisible(this.mainCharRidePlane.rideFeed))
         {
            this.mainCharRidePlane.showFeedPanel(this._plane_type);
         }
      }
      
      public function setSelectRideByID(param1:int) : void
      {
         this.mainCharRidePlane.setSelectRideByID(param1);
      }
      
      public function hideFeedPanel() : void
      {
         this.mainCharRidePlane.hideFeedPanel();
      }
      
      public function showRideStrengthen(param1:Boolean = false) : void
      {
         if(!param1)
         {
            this._plane_type = -1;
         }
         this.mainCharRidePlane.showRideStrengthen(param1);
         var _loc2_:PureMount = GameInstance.mainCharData.mountInfo.selectedMount;
         if(_loc2_ != null)
         {
            this.mainCharRidePlane.setNameLevel(_loc2_.name,_loc2_.mountAttributeInfo.lv);
         }
         var _loc3_:MountAttributeInfo = _loc2_.mountAttributeInfo;
         this.mainCharRidePlane.setRideStrengthenValue(_loc3_.savvy,_loc3_.getQualityName(),_loc3_.fightNow,_loc3_.fightMax,_loc3_.points_attackNow,_loc3_.points_attackMax,_loc3_.points_attackFujia,_loc3_.points_defenceNow,_loc3_.points_defenceMax,_loc3_.points_defenceFujia,_loc3_.points_flyNow,_loc3_.points_flyMax,_loc3_.points_flyFujia,_loc3_.points_stongNow,_loc3_.points_stongMax,_loc3_.points_stongFujia);
         this.mainCharRidePlane.isShowShenqizizhidanBtn(false);
      }
      
      public function showGradeUpgrade() : void
      {
         this.mainCharRidePlane.showGradeUpgrade(true);
      }
      
      public function setUpgradeGradeName(param1:String, param2:String, param3:int) : void
      {
         this.mainCharRidePlane.setUpgradeGradeName(param1,param2);
         var _loc4_:PureMount = new PureMount(param3);
         this.lgjj_mount_name = _loc4_.res.name;
         this.lgjj_mount_need_ride_lv = _loc4_.res.use_me_grade_limit;
         this.setNextAvatar(_loc4_);
      }
      
      public function setUpgradeAvatar(param1:BitmapData, param2:String) : void
      {
         this.mainCharRidePlane.setUpgradeAvatar(param1,param2);
      }
      
      public function setUpgradeProbability(param1:Number, param2:Number) : void
      {
         this.mainCharRidePlane.setUpgradeProbability(param1,param2);
      }
      
      public function setUpgradeExpendItem(param1:BaseItem = null, param2:BaseItem = null, param3:* = false) : void
      {
         this.mainCharRidePlane.setUpgradeExpendItem(param1,param2,param3);
      }
      
      public function fristSetUpgradeExpendMoneyAndProbability(param1:int, param2:int) : void
      {
         this._mouey_count = param1;
         this._sucess_probability = param2;
         this.setUpgradeExpendMoneyAndProbability(param1,param2);
      }
      
      public function setUpgradeExpendMoneyAndProbability(param1:int, param2:int) : void
      {
         this.mainCharRidePlane.setUpgradeExpendMoneyAndProbability(param1,param2,this._longlinEwaiZengjia);
      }
      
      private function mainCharRidePlane_ShouYuan_Handle(param1:* = null) : void
      {
         this._plane_type = 12;
         this.mainCharRidePlane.closeNiePanTupoPanel();
         this.msgSenderProxy.send_60651([GameInstance.mainCharData.mountInfo.selectedMountID,-1]);
      }
      
      public function f5OldView() : void
      {
         if(GameInstance.mainCharData.mountInfo.selectedMount == null)
         {
            if(Fun.isVisible(this.mainCharRidePlane))
            {
               this.mainCharRidePlane.hideFeedPanel();
            }
            return;
         }
         this.mainCharRidePlane.setTabBarName(this._plane_type);
         switch(this._plane_type)
         {
            case -1:
               this.mainCharRidePlane_show_Handle(RidePanel.GET_RIDE_FEED_RIDESTRENGTHEN_SHOW);
               break;
            case 0:
               this.mainCharRidePlane_show_Handle(RidePanel.GET_RIDE_FEED_RENEWENERGY_SHOW);
               break;
            case 1:
               this.mainCharRidePlane_show_Handle(RidePanel.GET_RENEWENERGR_ENERGYQUALITY_SHOW);
               break;
            case 2:
               this.mainCharRidePlane_show_Handle(RidePanel.GET_RENEWENERGR_ENERGYSAVVY_SHOW);
               break;
            case 3:
               this.mainCharRidePlane_show_Handle(RidePanel.GET_RENEWENERGR_ENERGYACCATK_SHOW);
               break;
            case 4:
               this.mainCharRidePlane_show_Handle(RidePanel.GET_RENEWENERGR_ENERGYRECOVERY_SHOW);
               break;
            case 5:
               this.mainCharRidePlane_show_Handle(RidePanel.GET_RENEWENERGR_ENERGYLIGHT_SHOW);
               break;
            case 6:
               this.mainCharRidePlane_show_Handle(RidePanel.GET_RENEWENERGR_ENERGYHEALTH_SHOW);
               break;
            case 7:
               if(Fun.isVisible(GameInstance.uiInstance._rideAttrPanel))
               {
                  this.mainCharRidePlane_show_Handle(RidePanel.GET_RIDE_FEED_GRADEUPGRADE_SHOW);
               }
               break;
            case 8:
               this.mainCharRidePlane_show_Handle(RidePanel.GET_RIDE_FEED_UPGRADEASSEMBLEDSKILL_SHOW);
               break;
            case 9:
               this.mainCharRidePlane_show_Handle(RidePanel.UI_RIDE_FEED_TONGLINGTIANFU_SHOW);
               break;
            case 10:
               this.mainCharRidePlane_show_Handle(RidePanel.GET_RIDE_JINHUA_SHOW);
               break;
            case 11:
               this.mainCharRidePlane_show_Handle(RidePanel.UI_RIDE_NIEPAN_CLICK);
               break;
            case 12:
               this.mainCharRidePlane_show_Handle(RidePanel.UI_RIDE_SHOUYUAN_CLICK);
               break;
            case 13:
               this.mainCharRidePlane_show_Handle(RidePanel.GET_RENEWENERGR_ENERGYCHUZHANSHOW);
         }
         this.isPanel = false;
      }
      
      public function showSuperMountPanel(param1:int, param2:int, param3:int, param4:int, param5:int, param6:PureMount) : void
      {
         var _loc7_:Skill = null;
         this.mainCharRidePlane.showJinHuaCanvas(param6.mountAttributeInfo.superMountType == 0 ? false : true);
         this.pointArr = [param1,param2,param3,param4];
         this.mainCharRidePlane.JinHuaCanvasSetPoint(param1,param2,param3,param4,param5);
         this.mainCharRidePlane.JinHuaCanvasSetIntroduceTextAndAvatar(param6.mountAttributeInfo.superMountType);
         this.mainCharRidePlane.setBarLabel(10);
         if(param6.mountAttributeInfo.superMountType != 0)
         {
            this.setJinHuaAvatar(param6);
            for each(_loc7_ in param6.mountSkillInfo.skillObj)
            {
               if(_loc7_.id == this.superMountSelectedSkill)
               {
                  this.mainCharRidePlane.JinHuaCanvasSetSkill(param6.mountSkillInfo.skillObj,this.superMountSelectedSkill);
                  return;
               }
            }
            this.mainCharRidePlane.JinHuaCanvasSetSkill(param6.mountSkillInfo.skillObj,-1);
            return;
         }
         this.hideFeedPanel();
         this.mainCharRidePlane.JinHuaCanvasAvatar(null);
      }
      
      private function setJinHuaAvatar(param1:PureMount) : void
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
            mainCharRidePlane.JinHuaCanvasAvatar(param2);
         };
         this.mainCharRidePlane.JinHuaCanvasAvatar(null);
         apdArr = [];
         apd = new AvatarParamData($pMount.getAvatarPath_Clothes());
         apdArr.push(apd);
         SimpleAvatarSynthesizer.synthesisSimpleAvatar($pMount.id + "_" + ++this.avatar_zizeng,callBack,apdArr,1,CharStatusType.STAND,2);
      }
      
      public function superMountAddPoint(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.pointArr = [param1,param2,param3,param4];
         this.mainCharRidePlane.JinHuaCanvasSetPoint(param1,param2,param3,param4,param5);
      }
      
      public function superMountEatFeed(param1:Boolean) : void
      {
         if(param1)
         {
            this.mainCharRidePlane.JinHuaSetFood(null);
            this.msgSenderProxy.send_50029([GameInstance.mainChar.id,2]);
         }
      }
      
      public function superMountSkillIndex(param1:int, param2:int, param3:int, param4:int) : void
      {
         if(param1 != this.superMountSelectedSkill)
         {
            return;
         }
         this.mainCharRidePlane.JinHuaCanvasSetJinJieTiaoJian(param2,param3,param4);
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
      
      public function setTabBarName(param1:int) : void
      {
         this.mainCharRidePlane.setTabBarName(param1);
      }
      
      public function setTuBoBtn(param1:Boolean) : void
      {
         this.mainCharRidePlane.setTuPoBtn(param1,this._plane_type);
      }
      
      public function setPotential(param1:int, param2:int) : void
      {
         this.mainCharRidePlane.setPotential(param1,param2);
         var _loc3_:Goods = new Goods(9214);
         _loc3_.count = GameInstance.mainCharData.goodsInfo.getGoodsNumByID(9214,true);
         this.mainCharRidePlane.showStrengthenEnergyPotential(_loc3_);
      }
      
      public function showStrengthenEnergyQuality(param1:String, param2:String, param3:int, param4:String, param5:int, param6:String, param7:int, param8:String, param9:int, param10:String, param11:int, param12:int, param13:Goods = null, param14:Goods = null, param15:Boolean = false) : void
      {
         this._mouey_count = param11;
         this._sucess_probability = param12;
         this.mainCharRidePlane.showStrengthenEnergyQuality(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15);
      }
      
      public function showStrengthenEnergySavvy(param1:String, param2:String, param3:Object, param4:Array, param5:int, param6:int, param7:Goods = null, param8:Goods = null, param9:Boolean = false) : void
      {
         this._mouey_count = param5;
         this._sucess_probability = param6;
         this.mainCharRidePlane.showStrengthenEnergySavvy(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function showStrengthenEnergyAttack(param1:String, param2:String, param3:String, param4:String, param5:int, param6:int, param7:Goods = null, param8:Goods = null, param9:Boolean = false) : void
      {
         this._mouey_count = param5;
         this._sucess_probability = param6;
         this.mainCharRidePlane.showStrengthenEnergyAttack(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function showStrengthenEnergyRecovery(param1:String, param2:String, param3:String, param4:String, param5:int, param6:int, param7:Goods = null, param8:Goods = null, param9:Boolean = false) : void
      {
         this._mouey_count = param5;
         this._sucess_probability = param6;
         this.mainCharRidePlane.showStrengthenEnergyRecovery(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function showStrengthenEnergyLight(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String, param7:int, param8:int, param9:Goods = null, param10:Goods = null, param11:Boolean = false) : void
      {
         this._mouey_count = param7;
         this._sucess_probability = param8;
         this.mainCharRidePlane.showStrengthenEnergyLight(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function showStrengthenEnergyHealth(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String, param7:String, param8:String, param9:int, param10:int, param11:Goods = null, param12:Goods = null, param13:Boolean = false) : void
      {
         this._mouey_count = param9;
         this._sucess_probability = param10;
         this.mainCharRidePlane.showStrengthenEnergyHealth(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
      }
      
      public function showTonglingtianfu() : void
      {
         this.mainCharRidePlane.setTabBarName(9);
         this.mainCharRidePlane.showTongLingTianFuCanvas();
      }
      
      public function setMC() : void
      {
         this.mainCharRidePlane.setMC();
      }
      
      public function setTonglingtianfu(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         var _loc6_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.TONGLINGDAN_ID,true);
         var _loc7_:Boolean = _loc6_.count >= param2;
         var _loc8_:Goods = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.LONGQIDAN_ID,true);
         this.mainCharRidePlane.setTongLingDan(_loc6_,_loc6_.count,param1,param2,param3,param4);
         this.mainCharRidePlane.setLongQiDan(_loc8_,param5);
      }
   }
}

