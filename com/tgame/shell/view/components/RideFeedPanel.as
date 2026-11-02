package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.vo.item.BaseItem;
   import com.tgame.common.vo.item.Buff;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.ride.GradeUpgradeCanvas;
   import com.tgame.shell.view.components.ride.NiePanCanvas;
   import com.tgame.shell.view.components.ride.RideGradeUpgradeTipCanvas;
   import com.tgame.shell.view.components.ride.RideStrengthenCanvas;
   import com.tgame.shell.view.components.ride.ShenQiLianGuDanPanel;
   import com.tgame.shell.view.components.ride.ShenQiZiZhiDan;
   import com.tgame.shell.view.components.ride.ShouYuanCanvas;
   import com.tgame.shell.view.components.ride.SiShengShouZuoQiJinHuaCanvas;
   import com.tgame.shell.view.components.ride.TongLingCanvasNew;
   import com.tgame.shell.view.components.ride.TongLingTianFuCanvas;
   import com.tgame.shell.view.components.ride.UpgradeAssembledSkillCanvas;
   import com.tgame.shell.view.components.ride.UpgradeLevelLessPanel;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   
   public class RideFeedPanel extends FPanel
   {
      
      public static const GET_RIDE_FEED_RENEWENERGY_SHOW:String = "GET_RIDE_FEED_RENEWENERGY_SHOW";
      
      public static const GET_RIDE_FEED_RIDESTRENGTHEN_SHOW:String = "GET_RIDE_FEED_RIDESTRENGTHEN_SHOW";
      
      public static const GET_RIDE_FEED_GRADEUPGRADE_SHOW:String = "GET_RIDE_FEED_GRADEUPGRADE_SHOW";
      
      public static const RIDE_FEED_USE_FODDER_RENEWENERGY:String = "RIDE_FEED_USE_FODDER_RENEWENERGY";
      
      public static const GET_RENEWENERGR_ENERGYHEALTH_SHOW:String = "GET_RENEWENERGR_ENERGYHEALTH_SHOW";
      
      public static const GET_RENEWENERGR_ENERGYLIGHT_SHOW:String = "GET_RENEWENERGR_ENERGYLIGHT_SHOW";
      
      public static const GET_RENEWENERGR_ENERGYACCATK_SHOW:String = "GET_RENEWENERGR_ENERGYACCATK_SHOW";
      
      public static const GET_RENEWENERGR_ENERGYRECOVERY_SHOW:String = "GET_RENEWENERGR_ENERGYRECOVERY_SHOW";
      
      public static const GET_RENEWENERGR_ENERGYCHUZHAN_SHOW:String = "GET_RENEWENERGR_ENERGYCHUZHAN_SHOW";
      
      public static const GET_RENEWENERGR_ENERGYQUALITY_SHOW:String = "GET_RENEWENERGR_ENERGYQUALITY_SHOW";
      
      public static const GET_RENEWENERGR_ENERGYSAVVY_SHOW:String = "GET_RENEWENERGR_ENERGYSAVVY_SHOW";
      
      public static const GET_RIDE_JINHUA_SHOW:String = "GET_RIDE_JINHUA_SHOW";
      
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
      
      public static const UI_RIDE_NIEPAN_CLICK:String = "UI_RIDE_NIEPAN_CLICK";
      
      public static const UI_RIDE_FEED_NIEPAN_KAISHINIEPAN:String = "UI_RIDE_FEED_NIEPAN_KAISHINIEPAN";
      
      public static const UI_RIDE_FEED_NIEPAN_ZHIDONGNIEPAN:String = "UI_RIDE_FEED_NIEPAN_ZHIDONGNIEPAN";
      
      public static const UI_RIDE_FEED_NIEPAN_XIAOCHUJIYI:String = "UI_RIDE_FEED_NIEPAN_XIAOCHUJIYI";
      
      public static const UI_RIDE_FEED_NIEPAN_DUIHUANZUOQI:String = "UI_RIDE_FEED_NIEPAN_DUIHUANZUOQI";
      
      public static const UI_RIDE_FEED_NIEPAN_GOUMAI_CLICK:String = "UI_RIDE_FEED_NIEPAN_GOUMAI_CLICK";
      
      public static const UI_RIDE_FEED_NIEPAN_CLICK:String = "UI_RIDE_FEED_NIEPAN_CLICK";
      
      public static const UI_RIDE_FEED_NIEPAN_QINGQIUDUIHUAN:String = "UI_RIDE_FEED_NIEPAN_QINGQIUDUIHUAN";
      
      public static const UI_RIDE_SHOUYUAN_SHOW:String = "UI_RIDE_SHOUYUAN_SHOW";
      
      public static const UI_RIDE_SHOUYUAN_TUPO:String = "UI_RIDE_SHOUYUAN_TUPO";
      
      public static const UI_RIDE_SHOUYUAN_XIULIAN:String = "UI_RIDE_SHOUYUAN_XIULIAN";
      
      public static const UI_RIDE_SHOUYUAN_PRE_NEXT:String = "UI_RIDE_SHOUYUAN_PRE_NEXT";
      
      public static const UI_RIDE_FEED_JINENGDAQUAN_SHOW:String = "UI_RIDE_FEED_JINENGDAQUAN_SHOW";
      
      public var $parent:DisplayObject;
      
      public var tabBar:FTabBar;
      
      private var rideStrengthen:RideStrengthenCanvas;
      
      private var gradeUpgrade:GradeUpgradeCanvas;
      
      private var upgradeassembledskillCanvas:UpgradeAssembledSkillCanvas;
      
      private var tonglingtianfu:TongLingCanvasNew;
      
      public var ridePanel:RidePanel;
      
      private var shenQiLianGuDan:ShenQiLianGuDanPanel;
      
      private var gradeUpgradeTip:RideGradeUpgradeTipCanvas;
      
      private var shenQiZiZhiDan:ShenQiZiZhiDan;
      
      private var tonglingtianfucanvas:TongLingTianFuCanvas;
      
      private var jinhuaCanvas:SiShengShouZuoQiJinHuaCanvas;
      
      private var food:*;
      
      private var rTime:int;
      
      private var skillPanel:RideAllSkillPanel;
      
      private var niePan:NiePanCanvas;
      
      private var shouYuan:ShouYuanCanvas;
      
      public function RideFeedPanel()
      {
         super();
         this.skin = "panel";
         this.showCloseButton = true;
         width = 347;
         height = 411;
         this.titleText = LanResManager.getLanCommonTextWords("坐骑驯养");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.rideStrengthen = new RideStrengthenCanvas();
         addChild(this.rideStrengthen);
         this.rideStrengthen.setParent(this.$parent);
         this.rideStrengthen.x = 10;
         this.rideStrengthen.y = 0;
         this.rideStrengthen.visible = false;
         this.gradeUpgrade = new GradeUpgradeCanvas();
         addChild(this.gradeUpgrade);
         this.gradeUpgrade.$parent = this.$parent;
         this.gradeUpgrade.x = 10;
         this.gradeUpgrade.y = 22;
         this.gradeUpgrade.visible = false;
         this.tonglingtianfu = new TongLingCanvasNew();
         addChild(this.tonglingtianfu);
         this.tonglingtianfu.$parent = this.$parent;
         this.tonglingtianfu.setParent(this.$parent);
         this.tonglingtianfu.x = 10;
         this.tonglingtianfu.y = 0;
         this.tonglingtianfu.visible = false;
         this.upgradeassembledskillCanvas = new UpgradeAssembledSkillCanvas();
         addChild(this.upgradeassembledskillCanvas);
         this.upgradeassembledskillCanvas.$parent = this.$parent;
         this.upgradeassembledskillCanvas.x = 10;
         this.upgradeassembledskillCanvas.y = 0;
         this.upgradeassembledskillCanvas.visible = false;
         this.tonglingtianfucanvas = new TongLingTianFuCanvas();
         addChild(this.tonglingtianfucanvas);
         this.tonglingtianfucanvas.$parent = this.$parent;
         this.tonglingtianfucanvas.x = 10;
         this.tonglingtianfucanvas.y = 0;
         this.tonglingtianfucanvas.visible = false;
         this.jinhuaCanvas = new SiShengShouZuoQiJinHuaCanvas();
         addChild(this.jinhuaCanvas);
         this.jinhuaCanvas.$parent = this.$parent;
         this.tonglingtianfucanvas.x = 10;
         this.jinhuaCanvas.y = 22;
         this.jinhuaCanvas.visible = false;
         var _loc1_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc1_.push(this.rideStrengthen.energy.bgImg);
         _loc1_.push(this.rideStrengthen.energyAccatk.bgImg);
         _loc1_.push(this.rideStrengthen.energyHealth.bgImg);
         _loc1_.push(this.rideStrengthen.energyLight.bgImg);
         _loc1_.push(this.rideStrengthen.energyQuality.bgImg);
         _loc1_.push(this.rideStrengthen.energyRecovery.bgImg);
         _loc1_.push(this.rideStrengthen.energySavvy.bgImg);
         _loc1_.push(this.gradeUpgrade.bgImg);
         _loc1_.push(this.upgradeassembledskillCanvas.bgImg);
         _loc1_.push(this.jinhuaCanvas.bgImg);
         this.DynamicManageImages = _loc1_;
         this.niePan = new NiePanCanvas();
         addChild(this.niePan);
         this.niePan.setParent = this;
         this.niePan.x = 10;
         this.niePan.y = 22;
         this.niePan.visible = false;
         this.shouYuan = new ShouYuanCanvas();
         addChild(this.shouYuan);
         this.shouYuan.setParent = this;
         this.shouYuan.x = 10;
         this.shouYuan.y = 2;
         this.shouYuan.visible = false;
      }
      
      public function reset() : void
      {
         this.tonglingtianfucanvas.visible = false;
         this.tonglingtianfu.visible = false;
         this.rideStrengthen.visible = false;
         this.gradeUpgrade.visible = false;
         this.upgradeassembledskillCanvas.visible = false;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         this.reset();
         this.setTuPoBtn(true);
         this.ridePanel.setBarLabel(7);
         this.rideStrengthen.setRadioFalse();
         this.ridePanel.ride.disablePartOption(true);
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      public function setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
      }
      
      public function showRenewEnerg(param1:Boolean = false) : void
      {
         this.tonglingtianfucanvas.visible = false;
         this.rideStrengthen.visible = false;
         this.rideStrengthen.reset();
         this.gradeUpgrade.visible = false;
         this.jinhuaCanvas.visible = false;
         this.upgradeassembledskillCanvas.visible = false;
         this.niePan.visible = false;
         this.niePan.showTuPoPanel(false);
         this.shouYuan.visible = false;
      }
      
      public function setNameLevel(param1:String, param2:int) : void
      {
         this.rideStrengthen.setNameLeve(param1,param2);
      }
      
      public function showRideStrengthen(param1:Boolean = false) : void
      {
         this.titleText = LanResManager.getLanCommonTextWords("潜力");
         this.tonglingtianfucanvas.visible = false;
         this.tonglingtianfu.visible = false;
         this.rideStrengthen.visible = true;
         this.rideStrengthen.setParent(this.$parent);
         this.rideStrengthen.reset();
         this.gradeUpgrade.visible = false;
         this.upgradeassembledskillCanvas.visible = false;
         this.jinhuaCanvas.visible = false;
         this.niePan.visible = false;
         this.niePan.showTuPoPanel(false);
         this.shouYuan.visible = false;
      }
      
      public function resetRadio() : void
      {
         this.rideStrengthen.setRadioFalse();
      }
      
      public function setRideStrengthenValue(param1:int, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int, param14:int, param15:int, param16:int) : void
      {
         this.rideStrengthen.setValue(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12,param13,param14,param15,param16);
      }
      
      public function showStrengthenEnergyQuality(param1:String, param2:String, param3:int, param4:String, param5:int, param6:String, param7:int, param8:String, param9:int, param10:String, param11:int, param12:int, param13:Goods = null, param14:Goods = null, param15:Boolean = false) : void
      {
         this.rideStrengthen.showEnergyQuality();
         this.rideStrengthen.energyQuality.setEnergyTip(param1,param2);
         this.rideStrengthen.energyQuality.setRideValue(param3.toString(),param5.toString(),param7.toString(),param9.toString());
         this.rideStrengthen.energyQuality.setAfterEnergyValueInterzone(param4,param6,param8,param10);
         this.rideStrengthen.energyQuality.setEnergyExpendItem(param13,param14,param15);
         this.rideStrengthen.energyQuality.setExpendMoneyAndProbability(param11,param12);
      }
      
      public function setStrengthenEnergyQualityExpendMoneyAndProbability(param1:int, param2:int) : void
      {
         this.rideStrengthen.energyQuality.setExpendMoneyAndProbability(param1,param2);
      }
      
      public function showStrengthenEnergyPotential(param1:Goods) : void
      {
         this.rideStrengthen.showEnergyPotential();
         this.rideStrengthen.energyPotential.setItem(param1);
      }
      
      public function setPotential(param1:int, param2:int) : void
      {
         this.rideStrengthen.energyPotential.setPotential(param1,param2);
      }
      
      public function showStrengthenEnergySavvy(param1:String, param2:String, param3:Object, param4:Array, param5:int, param6:int, param7:Goods = null, param8:Goods = null, param9:Boolean = false) : void
      {
         this.rideStrengthen.energySavvy.setEnergyTip(param1,param2);
         this.rideStrengthen.energySavvy.setRideSkill(param3,param4);
         this.rideStrengthen.energySavvy.setEnergyExpendItem(param7,param8,param9);
         this.rideStrengthen.energySavvy.setExpendMoneyAndProbability(param5,param6);
         this.rideStrengthen.showEnergySavvy();
      }
      
      public function setStrengthenEnergySavvyExpendMoneyAndProbability(param1:int, param2:int) : void
      {
         this.rideStrengthen.energySavvy.setExpendMoneyAndProbability(param1,param2);
      }
      
      public function showStrengthenEnergyAttack(param1:String, param2:String, param3:String, param4:String, param5:int, param6:int, param7:Goods = null, param8:Goods = null, param9:Boolean = false) : void
      {
         this.rideStrengthen.energyAccatk.setEnergyTip(param1,param2);
         this.rideStrengthen.energyAccatk.setRideValue(param3,param4);
         this.rideStrengthen.energyAccatk.setExpendMoneyAndProbability(param5,param6);
         this.rideStrengthen.energyAccatk.setEnergyExpendItem(param7,param8,param9);
         this.rideStrengthen.showEnergyAccatk();
      }
      
      public function setStrengthenEnergyAttackExpendMoneyAndProbability(param1:int, param2:int) : void
      {
         this.rideStrengthen.energyAccatk.setExpendMoneyAndProbability(param1,param2);
      }
      
      public function showStrengthenEnergyRecovery(param1:String, param2:String, param3:String, param4:String, param5:int, param6:int, param7:Goods = null, param8:Goods = null, param9:Boolean = false) : void
      {
         this.rideStrengthen.energyRecovery.setEnergyTip(param1,param2);
         this.rideStrengthen.energyRecovery.setRideValue(param3,param4);
         this.rideStrengthen.energyRecovery.setExpendMoneyAndProbability(param5,param6);
         this.rideStrengthen.energyRecovery.setEnergyExpendItem(param7,param8,param9);
         this.rideStrengthen.showEnergyRecovery();
      }
      
      public function setStrengthenEnergyRecoveryExpendMoneyAndProbability(param1:int, param2:int) : void
      {
         this.rideStrengthen.energyRecovery.setExpendMoneyAndProbability(param1,param2);
      }
      
      public function showStrengthenEnergyLight(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String, param7:int, param8:int, param9:Goods = null, param10:Goods = null, param11:Boolean = false) : void
      {
         this.rideStrengthen.energyLight.setEnergyTip(param1,param2);
         this.rideStrengthen.energyLight.setRideValue(param3,param5);
         this.rideStrengthen.energyLight.setAfterEnergyValueInterzone(param4,param6);
         this.rideStrengthen.energyLight.setExpendMoneyAndProbability(param7,param8);
         this.rideStrengthen.energyLight.setEnergyExpendItem(param9,param10,param11);
         this.rideStrengthen.showEnergyLight();
      }
      
      public function setStrengthenEnergyLightExpendMoneyAndProbability(param1:int, param2:int) : void
      {
         this.rideStrengthen.energyLight.setExpendMoneyAndProbability(param1,param2);
      }
      
      public function showStrengthenEnergyHealth(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String, param7:String, param8:String, param9:int, param10:int, param11:Goods = null, param12:Goods = null, param13:Boolean = false) : void
      {
         this.rideStrengthen.energyHealth.setEnergyTip(param1,param2);
         this.rideStrengthen.energyHealth.setRideValue(param3,param5,param7);
         this.rideStrengthen.energyHealth.setAfterEnergyValueInterzone(param4,param6,param8);
         this.rideStrengthen.energyHealth.setExpendMoneyAndProbability(param9,param10);
         this.rideStrengthen.energyHealth.setEnergyExpendItem(param11,param12,param13);
         this.rideStrengthen.showEnergyHealth();
      }
      
      public function setStrengthenEnergyHealthExpendMoneyAndProbability(param1:int, param2:int) : void
      {
         this.rideStrengthen.energyHealth.setExpendMoneyAndProbability(param1,param2);
      }
      
      public function showSkillPanel(param1:Array) : void
      {
         if(!this.skillPanel)
         {
            this.skillPanel = new RideAllSkillPanel();
         }
         this.skillPanel.visible = true;
         this.skillPanel.setSkill(param1);
         GameInstance.uiInstance.uiContainer.addChild(this.skillPanel);
         this.skillPanel.x = (GameConfig.sceneWidth - this.skillPanel.panelWidth) / 2;
         this.skillPanel.y = (GameConfig.sceneHeight - this.skillPanel.panelHeight) / 2;
      }
      
      public function showShenQizizhidanPanel() : void
      {
         if(!this.shenQiZiZhiDan)
         {
            this.shenQiZiZhiDan = new ShenQiZiZhiDan();
            this.shenQiZiZhiDan.$parent = this;
         }
         this.shenQiZiZhiDan.visible = true;
         POPWindowManager.showWindow(this.shenQiZiZhiDan);
      }
      
      public function isShowShenqizizhidanBtn(param1:Boolean) : void
      {
         this.rideStrengthen.sqzzdBtnVisible = param1;
      }
      
      public function showGradeUpgrade(param1:Boolean = false) : void
      {
         this.titleText = LanResManager.getLanCommonTextWords("进阶");
         this.tonglingtianfucanvas.visible = false;
         this.tonglingtianfu.visible = false;
         this.gradeUpgrade.setParent(this.$parent);
         this.gradeUpgrade.$parent = this.$parent;
         this.rideStrengthen.visible = false;
         this.rideStrengthen.reset();
         this.gradeUpgrade.visible = true;
         this.gradeUpgrade.setRTime(this.rTime);
         this.upgradeassembledskillCanvas.visible = false;
         this.jinhuaCanvas.visible = false;
         this.niePan.visible = false;
         this.niePan.showTuPoPanel(false);
         this.shouYuan.visible = false;
      }
      
      public function setUpgradeGradeName(param1:String, param2:String) : void
      {
         this.gradeUpgrade.setUpgradeGradeName(param1,param2);
      }
      
      public function setUpgradeAvatar(param1:BitmapData, param2:String) : void
      {
         this.gradeUpgrade.setUpgradeAvatar(param1,param2);
      }
      
      public function setUpgradeProbability(param1:Number, param2:Number) : void
      {
         this.gradeUpgrade.setUpgradeProbability(param1,param2);
      }
      
      public function setUpgradeExpendItem(param1:BaseItem = null, param2:BaseItem = null, param3:Boolean = false) : void
      {
         this.gradeUpgrade.setUpgradeExpendItem(param1,param2,param3);
      }
      
      public function setUpgradeExpendMoneyAndProbability(param1:int, param2:int, param3:int = 0) : void
      {
         this.gradeUpgrade.setUpgradeExpend(param1,param2,param3);
      }
      
      public function setUpgradeAddBuff(param1:Buff = null) : void
      {
         this.gradeUpgrade.setAddBuff(param1);
      }
      
      public function isShowShenQiLianGuDanTip(param1:Boolean = false) : void
      {
         this.gradeUpgrade.isShowShenQiLianGuDanTip(param1);
      }
      
      public function isShowShenQiLianGuDanBtn(param1:Boolean) : void
      {
         this.gradeUpgrade.sqlgdBtn.visible = param1;
      }
      
      public function showShenQiLianGuDan() : void
      {
         if(!this.shenQiLianGuDan)
         {
            this.shenQiLianGuDan = new ShenQiLianGuDanPanel();
            this.shenQiLianGuDan.$parent = this.$parent;
         }
         this.shenQiLianGuDan.visible = true;
         POPWindowManager.showWindow(this.shenQiLianGuDan);
      }
      
      private function hideShenQiLianGuDan() : void
      {
         if(Boolean(this.shenQiLianGuDan) && Boolean(this.shenQiLianGuDan.parent))
         {
            POPWindowManager.closeWindow();
         }
      }
      
      public function setRideQuality(param1:String = "") : void
      {
      }
      
      public function setAvatar(param1:BitmapData) : void
      {
         this.rideStrengthen.avatar = param1;
      }
      
      public function setNextAvatar(param1:BitmapData) : void
      {
         this.gradeUpgrade.avatar = param1;
      }
      
      public function showLevelLessPanel(param1:String, param2:int) : void
      {
         var _loc3_:UpgradeLevelLessPanel = new UpgradeLevelLessPanel();
         _loc3_.$parent = this.$parent;
         _loc3_.setData(param1,param2);
         POPWindowManager.showWindow(_loc3_);
      }
      
      public function showTipPanel(param1:Function) : void
      {
         this.gradeUpgrade.showTip(param1);
      }
      
      public function showGradeUpgradeTip() : void
      {
         if(!this.gradeUpgradeTip)
         {
            this.gradeUpgradeTip = new RideGradeUpgradeTipCanvas();
            this.gradeUpgradeTip.$parent = this.$parent;
         }
         POPWindowManager.showWindow(this.gradeUpgradeTip);
      }
      
      public function showUpgradeAssembledSkill(param1:String, param2:String, param3:String, param4:String, param5:int) : void
      {
         this.tonglingtianfucanvas.visible = false;
         this.tonglingtianfu.visible = false;
         this.rideStrengthen.visible = false;
         this.rideStrengthen.reset();
         this.gradeUpgrade.visible = false;
         this.upgradeassembledskillCanvas.$parent = this.$parent;
         this.upgradeassembledskillCanvas.setParent(this.$parent);
         this.upgradeassembledskillCanvas.visible = true;
         this.jinhuaCanvas.visible = false;
         this.niePan.visible = false;
         this.niePan.showTuPoPanel(false);
         this.shouYuan.visible = false;
         this.upgradeassembledskillCanvas.SetInitialize(param1,param2,param3,param4,param5);
         this.tonglingtianfu.SetInitialize(param1,param2,param3,param4,param5);
      }
      
      public function setSkillInitialize(param1:Array) : void
      {
         this.tonglingtianfu.SetSkillInitialize(param1);
      }
      
      public function showTongLingTianFuCanvas() : void
      {
         this.titleText = LanResManager.getLanCommonTextWords("通灵");
         this.tonglingtianfu.visible = true;
         this.tonglingtianfu.$parent = this.$parent;
         this.jinhuaCanvas.visible = false;
         this.rideStrengthen.visible = false;
         this.rideStrengthen.reset();
         this.gradeUpgrade.visible = false;
         this.upgradeassembledskillCanvas.visible = false;
         this.niePan.visible = false;
         this.niePan.showTuPoPanel(false);
         this.shouYuan.visible = false;
         this.tonglingtianfu.setParent(this.$parent);
      }
      
      public function setMC() : void
      {
         this.tonglingtianfu.setMC();
      }
      
      public function setTongLingDan(param1:Goods, param2:int, param3:int, param4:int, param5:int, param6:int) : void
      {
         this.tonglingtianfu.setTongLingDan(param1,param2,param3,param4,param5,param6);
      }
      
      public function setLongQiDan(param1:Goods, param2:int) : void
      {
         this.tonglingtianfu.setLongQiDan(param1,param2);
      }
      
      public function SetInitializeTL(param1:String, param2:String, param3:String, param4:String, param5:int) : void
      {
         this.tonglingtianfu.SetInitialize(param1,param2,param3,param4,param5);
      }
      
      public function SetSkillInitializeTL(param1:Array) : void
      {
         this.tonglingtianfu.SetSkillInitialize(param1);
      }
      
      public function showJinHuaCanvas(param1:Boolean) : void
      {
         this.titleText = LanResManager.getLanCommonTextWords("进化");
         this.jinhuaCanvas.BtnInit(param1);
         this.jinhuaCanvas.visible = true;
         this.jinhuaCanvas.$parent = this.$parent;
         this.JinHuaSetFood();
         this.tonglingtianfucanvas.visible = false;
         this.rideStrengthen.visible = false;
         this.rideStrengthen.reset();
         this.gradeUpgrade.visible = false;
         this.upgradeassembledskillCanvas.visible = false;
         this.niePan.visible = false;
         this.niePan.showTuPoPanel(false);
         this.shouYuan.visible = false;
         this.tonglingtianfu.visible = false;
      }
      
      public function JinHuaCanvasSetIntroduceTextAndAvatar(param1:int) : void
      {
         this.jinhuaCanvas.setIntroduceTextAndAvatar(param1);
      }
      
      public function JinHuaCanvasSetJinJieTiaoJian(param1:int, param2:int, param3:int) : void
      {
         this.jinhuaCanvas.setJinJieTiaoJian(param1,param2,param3);
      }
      
      public function JinHuaCanvasSetPoint(param1:int, param2:int, param3:int, param4:int, param5:int) : void
      {
         this.jinhuaCanvas.setPoint(param1,param2,param3,param4,param5);
      }
      
      public function JinHuaCanvasSetSkill(param1:Object, param2:int) : void
      {
         this.jinhuaCanvas.setSkill(param1,param2);
      }
      
      public function JinHuaCanvasAvatar(param1:BitmapData) : void
      {
         this.jinhuaCanvas.avatar = param1;
      }
      
      public function JinHuaSetFood(param1:Goods = null) : void
      {
         this.food = param1;
         this.jinhuaCanvas.setFood(param1);
      }
      
      public function getFood() : Goods
      {
         return this.food;
      }
      
      public function setRTime(param1:int) : void
      {
         this.rTime = param1;
      }
      
      public function setTuPoBtn(param1:Boolean, param2:int = 0) : void
      {
         switch(param2)
         {
            case 1:
               this.rideStrengthen.energyQuality.setTuPoBtn(param1);
               break;
            case 2:
               this.rideStrengthen.energySavvy.setTuPoBtn(param1);
               break;
            case 3:
               this.rideStrengthen.energyAccatk.setTuPoBtn(param1);
               break;
            case 4:
               this.rideStrengthen.energyRecovery.setTuPoBtn(param1);
               break;
            case 5:
               this.rideStrengthen.energyLight.setTuPoBtn(param1);
               break;
            case 6:
               this.rideStrengthen.energyHealth.setTuPoBtn(param1);
               break;
            case 13:
               this.rideStrengthen.energyPotential.setTuPoBtn(param1);
               break;
            case 0:
               this.rideStrengthen.energyQuality.setTuPoBtn(param1);
               this.rideStrengthen.energySavvy.setTuPoBtn(param1);
               this.rideStrengthen.energyAccatk.setTuPoBtn(param1);
               this.rideStrengthen.energyRecovery.setTuPoBtn(param1);
               this.rideStrengthen.energyLight.setTuPoBtn(param1);
               this.rideStrengthen.energyHealth.setTuPoBtn(param1);
               this.rideStrengthen.energyPotential.setTuPoBtn(param1);
         }
      }
      
      public function reBtnState(param1:int) : Boolean
      {
         var _loc2_:Boolean = false;
         switch(param1)
         {
            case 1:
               _loc2_ = this.rideStrengthen.energyQuality.reBtnState();
               break;
            case 2:
               _loc2_ = this.rideStrengthen.energySavvy.reBtnState();
               break;
            case 3:
               _loc2_ = this.rideStrengthen.energyAccatk.reBtnState();
               break;
            case 4:
               _loc2_ = this.rideStrengthen.energyRecovery.reBtnState();
               break;
            case 5:
               _loc2_ = this.rideStrengthen.energyLight.reBtnState();
               break;
            case 6:
               _loc2_ = this.rideStrengthen.energyHealth.reBtnState();
               break;
            case 13:
               _loc2_ = this.rideStrengthen.energyPotential.reBtnState();
         }
         return _loc2_;
      }
      
      public function showNiePanCanvas(param1:Boolean = true) : void
      {
         this.titleText = LanResManager.getLanCommonTextWords("涅槃");
         this.jinhuaCanvas.visible = false;
         this.tonglingtianfucanvas.visible = false;
         this.rideStrengthen.visible = false;
         this.rideStrengthen.reset();
         this.gradeUpgrade.visible = false;
         this.upgradeassembledskillCanvas.visible = false;
         this.niePan.visible = true;
         this.shouYuan.visible = false;
         this.tonglingtianfu.visible = false;
      }
      
      public function setNiePan(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean) : void
      {
         this.niePan.setData(param1,param2,param3,param4,param5,param6);
      }
      
      public function setNiePanAvatar(param1:BitmapData = null) : void
      {
         this.niePan.avatar = param1;
      }
      
      public function showNiePanTupoPanel(param1:Boolean) : void
      {
         this.niePan.showTuPoPanel(param1);
      }
      
      public function setNiePanGoods(param1:Goods, param2:Boolean, param3:int) : void
      {
         this.niePan.setGoods(param1,param2,param3);
      }
      
      public function setNiePanTuPoBtn(param1:Boolean) : void
      {
         this.niePan.setTuPoBtn(param1);
      }
      
      public function setNiePanDuiHuanResult(param1:Boolean, param2:int) : void
      {
         this.niePan.setDuiHuanResult(param1,param2);
      }
      
      public function showNiePanZhuanYi(param1:int) : void
      {
         this.niePan.showNiePanZhuanYi(param1);
      }
      
      public function isShowNiePanTuPo() : Boolean
      {
         return this.niePan.visible ? this.niePan.isTupoCanvasShow() : false;
      }
      
      public function closeNiePanTupoPanel() : void
      {
         this.niePan.closeTupoPanel();
      }
      
      public function showShouYuanCanvas(param1:Boolean = true) : void
      {
         this.titleText = LanResManager.getLanCommonTextWords("兽元");
         this.jinhuaCanvas.visible = false;
         this.tonglingtianfucanvas.visible = false;
         this.rideStrengthen.visible = false;
         this.rideStrengthen.reset();
         this.gradeUpgrade.visible = false;
         this.upgradeassembledskillCanvas.visible = false;
         this.niePan.visible = false;
         this.shouYuan.visible = true;
         this.tonglingtianfu.visible = false;
      }
      
      public function setShouYuanData(param1:int, param2:int, param3:int, param4:Array, param5:int) : void
      {
         this.shouYuan.setData(param1,param2,param3,param4,param5);
      }
      
      public function showShouYuanTuPo(param1:Boolean) : void
      {
         this.shouYuan.showShouYuanTuPo(param1);
      }
      
      public function selectShouYuan(param1:int) : void
      {
         this.shouYuan.selectShouYuan(param1);
      }
   }
}

