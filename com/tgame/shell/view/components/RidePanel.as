package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.PipeConstants;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Buff;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.ride.GradeUpgradeCanvas;
   import com.tgame.shell.view.components.ride.Ride;
   import com.tgame.shell.view.components.ride.RideGradeUpgradeTipCanvas;
   import com.tgame.shell.view.components.ride.RideStrengthenCanvas;
   import com.tgame.shell.view.components.ride.ShenQiLianGuDanPanel;
   import com.tgame.shell.view.components.ride.ShenQiZiZhiDan;
   import com.tgame.shell.view.components.ride.SiShengShouZuoQiJinHuaCanvas;
   import com.tgame.shell.view.components.ride.TongLingTianFuCanvas;
   import com.tgame.shell.view.components.ride.UpgradeAssembledSkillCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class RidePanel extends FPanel
   {
      
      public static const GET_RIDE_FEED_RENEWENERGY_SHOW:String = "GET_RIDE_FEED_RENEWENERGY_SHOW";
      
      public static const GET_RIDE_FEED_RIDESTRENGTHEN_SHOW:String = "GET_RIDE_FEED_RIDESTRENGTHEN_SHOW";
      
      public static const GET_RIDE_FEED_GRADEUPGRADE_SHOW:String = "GET_RIDE_FEED_GRADEUPGRADE_SHOW";
      
      public static const RIDE_FEED_USE_FODDER_RENEWENERGY:String = "RIDE_FEED_USE_FODDER_RENEWENERGY";
      
      public static const GET_RENEWENERGR_ENERGYHEALTH_SHOW:String = "GET_RENEWENERGR_ENERGYHEALTH_SHOW";
      
      public static const GET_RENEWENERGR_ENERGYLIGHT_SHOW:String = "GET_RENEWENERGR_ENERGYLIGHT_SHOW";
      
      public static const GET_RENEWENERGR_ENERGYACCATK_SHOW:String = "GET_RENEWENERGR_ENERGYACCATK_SHOW";
      
      public static const GET_RENEWENERGR_ENERGYRECOVERY_SHOW:String = "GET_RENEWENERGR_ENERGYRECOVERY_SHOW";
      
      public static const GET_RENEWENERGR_ENERGYQUALITY_SHOW:String = "GET_RENEWENERGR_ENERGYQUALITY_SHOW";
      
      public static const GET_RENEWENERGR_ENERGYSAVVY_SHOW:String = "GET_RENEWENERGR_ENERGYSAVVY_SHOW";
      
      public static const GET_RIDE_JINHUA_SHOW:String = "GET_RIDE_JINHUA_SHOW";
      
      public static const GET_RENEWENERGR_ENERGYCHUZHANSHOW:String = "GET_RENEWENERGR_ENERGYCHUZHANSHOW";
      
      public static const ENERGYPOTENTIAL_CLICK:String = "ENERGYPOTENTIAL_CLICK";
      
      public static const RENEWENERGR_USE_ITEM_CONST:String = "RENEWENERGR_USE_ITEM_CONST";
      
      public static const RENEWENERGY_START:String = "RENEWENERGY_START";
      
      public static const GRADEUPGRADE_START:String = "GRADEUPGRADE_START";
      
      public static const GRADEUPGRADE_JINJIEFU_USE:String = "GRADEUPGRADE_JINJIEFU_USE";
      
      public static const GRADEUPGRADE_KEEP:String = "GRADEUPGRADE_KEEP";
      
      public static const GET_RIDE_FEED_UPGRADEASSEMBLEDSKILL_SHOW:String = "GET_RIDE_FEED_UPGRADEASSEMBLEDSKILL_SHOW";
      
      public static const UI_UPGRADEASSEMBLEDSKILL_EQUIP_CLICK:String = "UI_UPGRADEASSEMBLEDSKILL_EQUIP_CLICK";
      
      public static const UI_RIDE_REED_SHENQILIANGUDAN_SHOW:String = "UI_RIDE_REED_SHENQILIANGUDAN_SHOW";
      
      public static const UI_RIDE_REED_SHENQILIANGUDAN_USR:String = "UI_RIDE_REED_SHENQILIANGUDAN_USR";
      
      public static const UI_REIDE_FEED_GRADEUPGRADE_TIPCANVAS_OPTION:String = "UI_REIDE_FEED_GRADEUPGRADE_TIPCANVAS_OPTION";
      
      public static const UI_REIDE_FEED_GRADEUPGRADE_TIPCANVAS_NEXT_IS_SHOW:String = "UI_REIDE_FEED_GRADEUPGRADE_TIPCANVAS_NEXT_IS_SHOW";
      
      public static const UI_RIDE_FEED_SHENQIZIZHIDAN_SHOW:String = "UI_RIDE_FEED_SHENQIZIZHIDAN_SHOW";
      
      public static const UI_RIDE_FEED_SHENQIZIZHIDAN_USE:String = "UI_RIDE_FEED_SHENQIZIZHIDAN_USE";
      
      public static const UI_RIDE_FEED_TONGLINGTIANFU_SHOW:String = "UI_RIDE_FEED_TONGLINGTIANFU_SHOW";
      
      public static const UI_RIDE_FEED_TONGLINGTIANFU_STRAT:String = "UI_RIDE_FEED_TONGLINGTIANFU_STRAT";
      
      public static const UI_RIDE_FEED_TONGLINGTIANFU_CREATE:String = "UI_RIDE_FEED_TONGLINGTIANFU_CREATE";
      
      public static const UI_RIDE_FEED_JINJIE_STARTJINJIE:String = "UI_RIDE_FEED_JINJIE_STARTJINJIE";
      
      public static const UI_RIDE_FEED_JINJIE_WEIBTN:String = "UI_RIDE_FEED_JINJIE_WEIBTN";
      
      public static const UI_RIDE_FEED_JINJIE_OKBTN:String = "UI_RIDE_FEED_JINJIE_OKBTN";
      
      public static const UI_RIDE_FEED_JINJIE_SKILL_CHICK:String = "UI_RIDE_FEED_JINHUA_SKILL_CHICK";
      
      public static var UI_RIDE_FEED_JINJIE_DRAG_START:String = "UI_RIDE_FEED_JINHUA_DRAG_START";
      
      public static var UI_RIDE_FEED_JINJIE_DRAG_ENTER:String = "UI_RIDE_FEED_JINHUA_DRAG_ENTER";
      
      public static const GETRIDELISTINFO:String = "ui.char.getridelistinfo";
      
      public static const GETRIDEINTBYID:String = "ui.char.get.rideinfobyid";
      
      public static const GETRIDEADDRIDESLOT:String = "GETRIDEADDRIDESLOT";
      
      public static const UI_RIDE_RIDEBTN_CLICK:String = "UI_RIDE_RIDEBTN_CLICK";
      
      public static const UI_RIDE_BREAKBTN_CLICK:String = "UI_RIDE_BREAKBTN_CLICK";
      
      public static const UI_RIDE_REEDBTN_CLICK:String = "UI_RIDE_REEDBTN_CLICK";
      
      public static const UI_RIDE_SHOWBTN_CLICK:String = "UI_RIDE_SHOWBTN_CLICK";
      
      public static const UI_RIDE_HIDEBTN_CLICK:String = "UI_RIDE_HIDEBTN_CLICK";
      
      public static const UI_RIDE_RELEASE_CLICK:String = "UI_RIDE_RELEASE_CLICK";
      
      public static const UI_RIDE_EQUIP_CLICK:String = "UI_RIDE_EQUIP_CLICK";
      
      public static const UI_RIDE_FEED_JINENGDAQUAN_SHOW:String = "UI_RIDE_FEED_JINENGDAQUAN_SHOW";
      
      public static const UI_RIDE_NIEPAN_CLICK:String = "UI_RIDE_NIEPAN_CLICK";
      
      public static const UI_RIDE_FEED_NIEPAN_KAISHINIEPAN:String = "UI_RIDE_FEED_NIEPAN_KAISHINIEPAN";
      
      public static const UI_RIDE_FEED_NIEPAN_ZHIDONGNIEPAN:String = "UI_RIDE_FEED_NIEPAN_ZHIDONGNIEPAN";
      
      public static const UI_RIDE_FEED_NIEPAN_XIAOCHUJIYI:String = "UI_RIDE_FEED_NIEPAN_XIAOCHUJIYI";
      
      public static const UI_RIDE_FEED_NIEPAN_DUIHUANZUOQI:String = "UI_RIDE_FEED_NIEPAN_DUIHUANZUOQI";
      
      public static const UI_RIDE_SHOUYUAN_CLICK:String = "UI_RIDE_SHOUYUAN_CLICK";
      
      public var tabBar:FTabBar;
      
      public var rideFeed:RideFeedPanel;
      
      public var ride:Ride;
      
      private var rideStrengthen:RideStrengthenCanvas;
      
      private var gradeUpgrade:GradeUpgradeCanvas;
      
      private var upgradeassembledskillCanvas:UpgradeAssembledSkillCanvas;
      
      private var shenQiLianGuDan:ShenQiLianGuDanPanel;
      
      private var gradeUpgradeTip:RideGradeUpgradeTipCanvas;
      
      private var shenQiZiZhiDan:ShenQiZiZhiDan;
      
      private var tonglingtianfucanvas:TongLingTianFuCanvas;
      
      private var jinhuaCanvas:SiShengShouZuoQiJinHuaCanvas;
      
      private var rideNum:String = "";
      
      private var btnType:int = 0;
      
      public function RidePanel()
      {
         super();
         this.rideFeed = new RideFeedPanel();
         this.rideFeed.setParent(this);
         this.rideFeed.$parent = this;
         this.rideFeed.ridePanel = this;
         this.rideFeed.visible = false;
         dragAble = true;
         this.skin = "panel";
         this.showCloseButton = true;
         width = 423;
         height = 413;
         this.titleText = LanResManager.getLanCommonTextWords("我的坐骑");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.ride = new Ride();
         addChild(this.ride);
         this.ride.$parent = this;
         this.ride.ridePanel = this;
         this.ride.x = 10;
         this.ride.y = 20;
         addEventListener(Event.ADDED_TO_STAGE,this.onAdd);
         var _loc1_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc1_.push(this.ride.bgImg);
         this.DynamicManageImages = _loc1_;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("进阶"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("潜力"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("通灵"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("进化"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("涅槃"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("兽元"),this.onTabClick);
         this.tabBar.addButton("巅峰",this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
      }
      
      public function onTabClick(param1:MouseEvent = null, param2:String = "") : void
      {
         var _loc3_:String = "";
         if(param1 == null)
         {
            _loc3_ = param2;
         }
         else
         {
            _loc3_ = (param1.target as FButton).label;
         }
         switch(_loc3_)
         {
            case LanResManager.getLanCommonTextWords("进阶"):
               this.btnType = 7;
               this.rideFeed.setTuPoBtn(true);
               this.rideFeed.resetRadio();
               dispatchEvent(new BaseEvent(GET_RIDE_FEED_GRADEUPGRADE_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("潜力"):
               this.btnType = 1;
               this.rideFeed.setTuPoBtn(true);
               dispatchEvent(new BaseEvent(GET_RIDE_FEED_RIDESTRENGTHEN_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("通灵"):
               this.btnType = 9;
               this.rideFeed.setTuPoBtn(true);
               this.rideFeed.resetRadio();
               dispatchEvent(new BaseEvent(UI_RIDE_FEED_TONGLINGTIANFU_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("进化"):
               this.btnType = 10;
               this.rideFeed.setTuPoBtn(true);
               this.rideFeed.resetRadio();
               dispatchEvent(new BaseEvent(GET_RIDE_JINHUA_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("涅槃"):
               this.btnType = 11;
               this.rideFeed.setTuPoBtn(true);
               this.rideFeed.resetRadio();
               dispatchEvent(new BaseEvent(UI_RIDE_NIEPAN_CLICK));
               break;
            case LanResManager.getLanCommonTextWords("兽元"):
               this.btnType = 12;
               this.rideFeed.setTuPoBtn(true);
               this.rideFeed.resetRadio();
               dispatchEvent(new BaseEvent(UI_RIDE_SHOUYUAN_CLICK));
               break;
            case LanResManager.getLanCommonTextWords("巅峰"):
               PipeManager.sendMsg(PipeConstants.SHOW_DIANFENGSHOU_PANEL);
         }
         this.setBarLabel(this.btnType);
      }
      
      private function onAdd(param1:Event) : void
      {
         dispatchEvent(new BaseEvent(GETRIDELISTINFO));
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(this.rideFeed.parent != null)
         {
            this.rideFeed.setTuPoBtn(true);
            this.rideFeed.resetRadio();
            this.rideFeed.parent.removeChild(this.rideFeed);
         }
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setBarLabel(param1:int) : void
      {
         switch(param1)
         {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 13:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("潜力"));
               break;
            case 7:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("进阶"));
               break;
            case 8:
            case 9:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("通灵"));
               break;
            case 10:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("进化"));
               break;
            case 11:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("涅槃"));
               break;
            case 12:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("兽元"));
         }
      }
      
      public function showFeedPanel(param1:int) : void
      {
         this.rideFeed.visible = true;
         this.rideFeed.setParent(this);
         this.rideFeed.$parent = this;
         addChild(this.rideFeed);
         this.rideFeed.x = 424;
         this.rideFeed.y = -34;
         switch(param1)
         {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 13:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("潜力"));
               this.rideFeed.showRideStrengthen(true);
               break;
            case 7:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("进阶"));
               this.rideFeed.showGradeUpgrade();
               break;
            case 8:
            case 9:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("通灵"));
               this.rideFeed.showTongLingTianFuCanvas();
               break;
            case 10:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("进化"));
               this.rideFeed.showJinHuaCanvas(true);
               break;
            case 11:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("涅槃"));
               this.rideFeed.showNiePanCanvas(true);
               break;
            case 12:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("兽元"));
               this.rideFeed.showShouYuanCanvas(true);
         }
      }
      
      public function hideFeedPanel() : void
      {
         if(this.rideFeed.parent == null)
         {
            return;
         }
         this.rideFeed.reset();
         this.rideFeed.visible = false;
         this.rideFeed.parent.removeChild(this.rideFeed);
         this.ride.disablePartOption(true);
      }
      
      public function swapBtnLabel(param1:int) : void
      {
         this.ride.swapBtnLabel(param1);
      }
      
      public function setRideList(param1:XML, param2:String) : void
      {
         this.ride.ridelist = param1;
         this.ride.rideCount = param2;
         this.rideNum = param2;
      }
      
      public function setAvatar(param1:BitmapData, param2:int) : void
      {
         this.ride.setAvatar(param1,param2);
         this.rideFeed.setAvatar(param1);
      }
      
      public function setYinCangShuXingJiHuo(param1:int) : void
      {
         this.ride.setYinCangShuXingJiHuo(param1);
      }
      
      public function refreshRideList(param1:XML, param2:int) : void
      {
         this.ride.ridelist = param1;
         this.ride.rideList.setSelectItemByLabel(param2.toString());
      }
      
      public function setRideQuality(param1:String = "") : void
      {
         this.ride.setRideQuality(param1);
         this.rideFeed.setRideQuality(param1);
      }
      
      public function setRideAddCharValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         this.ride.setAddValue(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setRideBaseAttribute(param1:String, param2:String, param3:String, param4:String, param5:String) : void
      {
         this.ride.setBaseAttribute(param1,param2,param3,param4,param5);
      }
      
      public function setRideAttibute(param1:Number, param2:Number, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int, param14:int, param15:int, param16:int, param17:int, param18:int) : void
      {
         this.ride.setAttribute(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16,param17,param18);
      }
      
      public function setRideEquip(param1:Array) : void
      {
         this.ride.setEquip(param1);
      }
      
      public function setRideSkill(param1:Object) : void
      {
         this.ride.setSkill(param1);
      }
      
      public function setExpireDate(param1:String) : void
      {
         this.ride.setExpireDate(param1);
      }
      
      public function setSelectRideByID(param1:int) : void
      {
         this.ride.setSelectRideByID(param1);
      }
      
      public function resize(param1:Number, param2:Number) : void
      {
         this.ride.resize(param1,param2);
      }
      
      public function showRideSlotExtendPanel(param1:int, param2:Goods, param3:Boolean) : void
      {
         this.ride.showRideSlotExtend(param1,param2,param3);
      }
      
      public function setDreamValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         this.ride.setDreamValue(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setSiShengShouValue(param1:Number, param2:Number, param3:Number, param4:Number, param5:Number, param6:Number, param7:Number, param8:Number, param9:Number) : void
      {
         this.ride.setSiShengShouValue(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setShouwangzhihun(param1:Boolean, param2:Boolean) : void
      {
         this.ride.setShouwangzhihun(param1,param2);
      }
      
      public function setXueShouSkill(param1:Boolean) : void
      {
         this.ride.setXueShouSkill(param1);
      }
      
      public function showRenewEnerg(param1:Boolean = false) : void
      {
         this.rideFeed.showRenewEnerg(param1);
         this.rideFeed.$parent = this;
         if(param1)
         {
         }
      }
      
      public function setNameLevel(param1:String, param2:int) : void
      {
         this.rideFeed.setNameLevel(param1,param2);
      }
      
      public function showRideStrengthen(param1:Boolean = false) : void
      {
         this.rideFeed.$parent = this;
         this.rideFeed.showRideStrengthen(param1);
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("潜力"));
         }
      }
      
      public function setRideStrengthenValue(param1:int, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int, param14:int, param15:int, param16:int) : void
      {
         this.rideFeed.setRideStrengthenValue(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16);
      }
      
      public function showStrengthenEnergyQuality(param1:String, param2:String, param3:int, param4:String, param5:int, param6:String, param7:int, param8:String, param9:int, param10:String, param11:int, param12:int, param13:Goods = null, param14:Goods = null, param15:Boolean = false) : void
      {
         this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("潜力"));
         this.rideFeed.showStrengthenEnergyQuality(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15);
      }
      
      public function setStrengthenEnergyQualityExpendMoneyAndProbability(param1:int, param2:int) : void
      {
         this.rideFeed.setStrengthenEnergyQualityExpendMoneyAndProbability(param1,param2);
      }
      
      public function showStrengthenEnergySavvy(param1:String, param2:String, param3:Object, param4:Array, param5:int, param6:int, param7:Goods = null, param8:Goods = null, param9:Boolean = false) : void
      {
         this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("潜力"));
         this.rideFeed.showStrengthenEnergySavvy(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
      
      public function setStrengthenEnergySavvyExpendMoneyAndProbability(param1:int, param2:int) : void
      {
         this.rideFeed.setStrengthenEnergySavvyExpendMoneyAndProbability(param1,param2);
      }
      
      public function showStrengthenEnergyPotential(param1:Goods) : void
      {
         this.rideFeed.showStrengthenEnergyPotential(param1);
      }
      
      public function setPotential(param1:int, param2:int) : void
      {
         this.rideFeed.setPotential(param1,param2);
      }
      
      public function showAllSkillPanel(param1:Array) : void
      {
         this.rideFeed.showSkillPanel(param1);
      }
      
      public function showStrengthenEnergyAttack(param1:String, param2:String, param3:String, param4:String, param5:int, param6:int, param7:Goods = null, param8:Goods = null, param9:Boolean = false) : void
      {
         this.rideFeed.showStrengthenEnergyAttack(param1,param2,param3,param4,param5,param6,param7,param8,param9);
         this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("潜力"));
      }
      
      public function setStrengthenEnergyAttackExpendMoneyAndProbability(param1:int, param2:int) : void
      {
         this.rideFeed.setStrengthenEnergyAttackExpendMoneyAndProbability(param1,param2);
      }
      
      public function showStrengthenEnergyRecovery(param1:String, param2:String, param3:String, param4:String, param5:int, param6:int, param7:Goods = null, param8:Goods = null, param9:Boolean = false) : void
      {
         this.rideFeed.showStrengthenEnergyRecovery(param1,param2,param3,param4,param5,param6,param7,param8,param9);
         this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("潜力"));
      }
      
      public function setStrengthenEnergyRecoveryExpendMoneyAndProbability(param1:int, param2:int) : void
      {
         this.rideFeed.setStrengthenEnergyRecoveryExpendMoneyAndProbability(param1,param2);
      }
      
      public function showStrengthenEnergyLight(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String, param7:int, param8:int, param9:Goods = null, param10:Goods = null, param11:Boolean = false) : void
      {
         this.rideFeed.showStrengthenEnergyLight(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("潜力"));
      }
      
      public function setStrengthenEnergyLightExpendMoneyAndProbability(param1:int, param2:int) : void
      {
         this.rideFeed.setStrengthenEnergyLightExpendMoneyAndProbability(param1,param2);
      }
      
      public function showStrengthenEnergyHealth(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String, param7:String, param8:String, param9:int, param10:int, param11:Goods = null, param12:Goods = null, param13:Boolean = false) : void
      {
         this.rideFeed.showStrengthenEnergyHealth(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13);
         this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("潜力"));
      }
      
      public function setStrengthenEnergyHealthExpendMoneyAndProbability(param1:int, param2:int) : void
      {
         this.rideFeed.setStrengthenEnergyHealthExpendMoneyAndProbability(param1,param2);
      }
      
      public function showShenQizizhidanPanel() : void
      {
         this.rideFeed.showShenQizizhidanPanel();
      }
      
      public function isShowShenqizizhidanBtn(param1:Boolean) : void
      {
         this.rideFeed.isShowShenqizizhidanBtn(param1);
      }
      
      public function showGradeUpgrade(param1:Boolean = false) : void
      {
         this.rideFeed.showGradeUpgrade(param1);
         this.rideFeed.$parent = this;
         if(param1)
         {
            this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("进阶"));
         }
      }
      
      public function setUpgradeGradeName(param1:String, param2:String) : void
      {
         this.rideFeed.setUpgradeGradeName(param1,param2);
      }
      
      public function setUpgradeAvatar(param1:BitmapData, param2:String) : void
      {
         this.rideFeed.setUpgradeAvatar(param1,param2);
      }
      
      public function setUpgradeProbability(param1:Number, param2:Number) : void
      {
         this.rideFeed.setUpgradeProbability(param1,param2);
      }
      
      public function setUpgradeExpendItem(param1:BaseItem = null, param2:BaseItem = null, param3:Boolean = false) : void
      {
         this.rideFeed.setUpgradeExpendItem(param1,param2,param3);
      }
      
      public function setUpgradeExpendMoneyAndProbability(param1:int, param2:int, param3:int = 0) : void
      {
         this.rideFeed.setUpgradeExpendMoneyAndProbability(param1,param2,param3);
      }
      
      public function setUpgradeAddBuff(param1:Buff = null) : void
      {
         this.rideFeed.setUpgradeAddBuff(param1);
      }
      
      public function isShowShenQiLianGuDanTip(param1:Boolean = false) : void
      {
         this.rideFeed.isShowShenQiLianGuDanTip(param1);
      }
      
      public function isShowShenQiLianGuDanBtn(param1:Boolean) : void
      {
         this.rideFeed.isShowShenQiLianGuDanBtn(param1);
      }
      
      public function showShenQiLianGuDan() : void
      {
         this.rideFeed.showShenQiLianGuDan();
      }
      
      public function setNextAvatar(param1:BitmapData) : void
      {
         this.rideFeed.setNextAvatar(param1);
      }
      
      public function showLevelLessPanel(param1:String, param2:int) : void
      {
         this.rideFeed.showLevelLessPanel(param1,param2);
      }
      
      public function showTipPanel(param1:Function) : void
      {
         this.rideFeed.showTipPanel(param1);
      }
      
      public function showGradeUpgradeTip() : void
      {
         if(!this.gradeUpgradeTip)
         {
            this.gradeUpgradeTip = new RideGradeUpgradeTipCanvas();
            this.gradeUpgradeTip.$parent = this;
         }
         POPWindowManager.showWindow(this.gradeUpgradeTip);
      }
      
      public function showUpgradeAssembledSkill(param1:String, param2:String, param3:String, param4:String, param5:int) : void
      {
         this.rideFeed.SetInitializeTL(param1,param2,param3,param4,param5);
      }
      
      public function setSkillInitialize(param1:Array) : void
      {
         this.rideFeed.setSkillInitialize(param1);
      }
      
      public function showTongLingTianFuCanvas() : void
      {
         this.rideFeed.showTongLingTianFuCanvas();
         this.rideFeed.$parent = this;
      }
      
      public function setMC() : void
      {
         this.rideFeed.setMC();
      }
      
      public function setTongLingDan(param1:Goods, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         this.rideFeed.setTongLingDan(param1,param2,param3,param4,param5,param6);
      }
      
      public function setLongQiDan(param1:Goods, param2:int) : void
      {
         this.rideFeed.setLongQiDan(param1,param2);
      }
      
      public function showJinHuaCanvas(param1:Boolean) : void
      {
         this.rideFeed.showJinHuaCanvas(param1);
         this.rideFeed.$parent = this;
         this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("驯养"));
      }
      
      public function JinHuaCanvasSetIntroduceTextAndAvatar(param1:int) : void
      {
         this.rideFeed.JinHuaCanvasSetIntroduceTextAndAvatar(param1);
      }
      
      public function JinHuaCanvasSetJinJieTiaoJian(param1:int, param2:int, param3:int) : void
      {
         this.rideFeed.JinHuaCanvasSetJinJieTiaoJian(param1,param2,param3);
      }
      
      public function JinHuaCanvasSetPoint(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.rideFeed.JinHuaCanvasSetPoint(param1,param2,param3,param4,param5);
      }
      
      public function JinHuaCanvasSetSkill(param1:Object, param2:int) : void
      {
         this.rideFeed.JinHuaCanvasSetSkill(param1,param2);
      }
      
      public function JinHuaCanvasAvatar(param1:BitmapData) : void
      {
         this.rideFeed.JinHuaCanvasAvatar(param1);
      }
      
      public function JinHuaSetFood(param1:Goods = null) : void
      {
         this.rideFeed.JinHuaSetFood(param1);
      }
      
      public function getFood() : Goods
      {
         return this.rideFeed.getFood();
      }
      
      public function setTabBarName(param1:int = 1) : void
      {
         switch(param1)
         {
            case 11:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("涅槃"));
               break;
            case 12:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("兽元"));
               break;
            case 10:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("进化"));
               break;
            case 9:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("通灵"));
               break;
            case 7:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("进阶"));
               break;
            case -1:
               this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("潜力"));
         }
      }
      
      public function closeNiePanTupoPanel() : void
      {
         this.rideFeed.closeNiePanTupoPanel();
      }
      
      public function setTuPoBtn(param1:Boolean, param2:int) : void
      {
         this.rideFeed.setTuPoBtn(param1,param2);
      }
      
      public function reBtnState(param1:int) : Boolean
      {
         return this.rideFeed.reBtnState(param1);
      }
      
      public function setTabBar(param1:Boolean) : void
      {
         if(param1)
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("进阶"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("潜力"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("通灵"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("进化"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("涅槃"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("兽元"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("巅峰"),this.onTabClick);
            this.tabBar.x = 10;
            this.tabBar.y = 2;
         }
         else
         {
            this.tabBar.removeAllButton();
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("进阶"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("潜力"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("通灵"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("进化"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("涅槃"),this.onTabClick);
            this.tabBar.addButton(LanResManager.getLanCommonTextWords("兽元"),this.onTabClick);
            this.tabBar.x = 10;
            this.tabBar.y = 2;
         }
      }
   }
}

