package com.tgame.shell.view.components.ride
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.radioBox.FRadioBox;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.RidePanel;
   import com.tgame.shell.view.components.ride.strengthen.EnergyAccatkCanvas;
   import com.tgame.shell.view.components.ride.strengthen.EnergyCanvas;
   import com.tgame.shell.view.components.ride.strengthen.EnergyHealthCanvas;
   import com.tgame.shell.view.components.ride.strengthen.EnergyLightCanvas;
   import com.tgame.shell.view.components.ride.strengthen.EnergyPotentialCanvas;
   import com.tgame.shell.view.components.ride.strengthen.EnergyQualityCanvas;
   import com.tgame.shell.view.components.ride.strengthen.EnergyRecoveryCanvas;
   import com.tgame.shell.view.components.ride.strengthen.EnergySavvyCanvas;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class RideStrengthenCanvas extends Sprite
   {
      
      private var selectGrade:FLabel;
      
      private var selectBtn:FSimpleButton;
      
      private var selectList:FList;
      
      private var listContainer:FCanvas;
      
      public var energy:EnergyCanvas;
      
      public var energyQuality:EnergyQualityCanvas;
      
      public var energySavvy:EnergySavvyCanvas;
      
      public var energyAccatk:EnergyAccatkCanvas;
      
      public var energyRecovery:EnergyRecoveryCanvas;
      
      public var energyLight:EnergyLightCanvas;
      
      public var energyHealth:EnergyHealthCanvas;
      
      public var energyPotential:EnergyPotentialCanvas;
      
      private var $parent:DisplayObject;
      
      private var rad1:FRadioBox;
      
      private var rad2:FRadioBox;
      
      private var rad3:FRadioBox;
      
      private var rad4:FRadioBox;
      
      private var rad5:FRadioBox;
      
      private var rad6:FRadioBox;
      
      private var rad7:FRadioBox;
      
      private var ft:FTextArea;
      
      private var ft_wx:FTextArea;
      
      private var ft_pj:FTextArea;
      
      private var bar1:ColorBar;
      
      private var bar2:ColorBar;
      
      private var bar3:ColorBar;
      
      private var bar4:ColorBar;
      
      private var bar5:ColorBar;
      
      private var bit:Bitmap;
      
      public function RideStrengthenCanvas()
      {
         super();
         this.energy = new EnergyCanvas();
         this.energy.y = 115;
         addChild(this.energy);
         this.energyQuality = new EnergyQualityCanvas();
         this.energyQuality.y = 115;
         addChild(this.energyQuality);
         this.energyQuality.visible = false;
         this.energySavvy = new EnergySavvyCanvas();
         this.energySavvy.y = 115;
         this.energySavvy.visible = false;
         addChild(this.energySavvy);
         this.energyAccatk = new EnergyAccatkCanvas();
         this.energyAccatk.y = 115;
         this.energyAccatk.visible = false;
         addChild(this.energyAccatk);
         this.energyRecovery = new EnergyRecoveryCanvas();
         this.energyRecovery.y = 115;
         this.energyRecovery.visible = false;
         addChild(this.energyRecovery);
         this.energyLight = new EnergyLightCanvas();
         this.energyLight.y = 115;
         this.energyLight.visible = false;
         addChild(this.energyLight);
         this.energyHealth = new EnergyHealthCanvas();
         this.energyHealth.y = 115;
         this.energyHealth.visible = false;
         addChild(this.energyHealth);
         this.energyPotential = new EnergyPotentialCanvas();
         this.energyPotential.y = 160 - 13;
         this.energyPotential.visible = false;
         addChild(this.energyPotential);
         this.init();
      }
      
      private function init() : void
      {
         var barBg:Bitmap = null;
         var text:FLabel = new FLabel();
         with(text)
         {
            x = 32;
            y = 2;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("请选择要强化的属性");
         }
         addChild(text);
         this.selectGrade = new FLabel();
         with(this.selectGrade)
         {
            x = 155;
            y = 10;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("点击右侧下拉按钮");
         }
         this.bit = StaticValue.getBitmapByClassName("ui.line");
         this.bit.x = 0;
         this.bit.y = 22;
         this.bit.width = 330;
         addChild(this.bit);
         barBg = StaticValue.getBitmapByClassName("ui.char.attribute.venation.jindutiao");
         barBg.width = 215;
         addChild(barBg);
         barBg.x = 70;
         barBg.y = 53;
         barBg = StaticValue.getBitmapByClassName("ui.char.attribute.venation.jindutiao");
         barBg.width = 215;
         addChild(barBg);
         barBg.x = 70;
         barBg.y = 73;
         barBg = StaticValue.getBitmapByClassName("ui.char.attribute.venation.jindutiao");
         barBg.width = 215;
         addChild(barBg);
         barBg.x = 70;
         barBg.y = 93;
         barBg = StaticValue.getBitmapByClassName("ui.char.attribute.venation.jindutiao");
         barBg.width = 215;
         addChild(barBg);
         barBg.x = 70;
         barBg.y = 113;
         barBg = StaticValue.getBitmapByClassName("ui.char.attribute.venation.jindutiao");
         barBg.width = 215;
         addChild(barBg);
         barBg.x = 71;
         barBg.y = 133;
         this.bar1 = new ColorBar(5,210,5);
         addChild(this.bar1);
         this.bar1.x = 72;
         this.bar1.y = 55;
         this.bar2 = new ColorBar(5,210,5);
         addChild(this.bar2);
         this.bar2.x = 72;
         this.bar2.y = 75;
         this.bar3 = new ColorBar(5,210,5);
         addChild(this.bar3);
         this.bar3.x = 72;
         this.bar3.y = 95;
         this.bar4 = new ColorBar(5,210,5);
         addChild(this.bar4);
         this.bar4.x = 72;
         this.bar4.y = 115;
         this.bar5 = new ColorBar(5,210,5);
         addChild(this.bar5);
         this.bar5.x = 72;
         this.bar5.y = 135;
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 30;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("悟性：") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 175;
         this.ft.y = 30;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("品级：") + "</font>";
         addChild(this.ft);
         this.ft_wx = new FTextArea();
         this.ft_wx.x = 50 + 15;
         this.ft_wx.y = 30;
         addChild(this.ft_wx);
         this.ft_pj = new FTextArea();
         this.ft_pj.x = 225 + 5;
         this.ft_pj.y = 30;
         addChild(this.ft_pj);
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 50;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("出战潜力：") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 70;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击潜力：") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 90;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("防御潜力：") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 110;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("轻身潜力：") + "</font>";
         addChild(this.ft);
         this.ft = new FTextArea();
         this.ft.x = 10;
         this.ft.y = 130;
         this.ft.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("健体潜力：") + "</font>";
         addChild(this.ft);
         this.rad1 = new FRadioBox();
         this.rad1.name = "2";
         this.rad1.textColor = StaticValue.WHITE;
         this.rad1.x = 10 + 70 + 15;
         this.rad1.y = 40 - 10;
         this.rad1.selectState = false;
         addChild(this.rad1);
         this.rad1.addEventListener(MouseEvent.CLICK,this.onClick);
         this.rad2 = new FRadioBox();
         this.rad2.name = "1";
         this.rad2.textColor = StaticValue.WHITE;
         this.rad2.x = 175 + 90 + 15;
         this.rad2.y = 40 - 10;
         addChild(this.rad2);
         this.rad2.selectState = false;
         this.rad2.addEventListener(MouseEvent.CLICK,this.onClick);
         this.rad3 = new FRadioBox();
         this.rad3.name = "7";
         this.rad3.textColor = StaticValue.WHITE;
         this.rad3.x = 10 + 220 + 70;
         this.rad3.y = 60 - 10;
         addChild(this.rad3);
         this.rad3.selectState = false;
         this.rad3.addEventListener(MouseEvent.CLICK,this.onClick);
         this.rad4 = new FRadioBox();
         this.rad4.name = "3";
         this.rad4.textColor = StaticValue.WHITE;
         this.rad4.x = 10 + 220 + 70;
         this.rad4.y = 80 - 10;
         addChild(this.rad4);
         this.rad4.selectState = false;
         this.rad4.addEventListener(MouseEvent.CLICK,this.onClick);
         this.rad5 = new FRadioBox();
         this.rad5.name = "4";
         this.rad5.textColor = StaticValue.WHITE;
         this.rad5.x = 10 + 220 + 70;
         this.rad5.y = 100 - 10;
         addChild(this.rad5);
         this.rad5.selectState = false;
         this.rad5.addEventListener(MouseEvent.CLICK,this.onClick);
         this.rad6 = new FRadioBox();
         this.rad6.selectState = false;
         this.rad6.name = "5";
         this.rad6.textColor = StaticValue.WHITE;
         this.rad6.x = 10 + 220 + 70;
         this.rad6.y = 120 - 10;
         addChild(this.rad6);
         this.rad6.addEventListener(MouseEvent.CLICK,this.onClick);
         this.rad7 = new FRadioBox();
         this.rad7.name = "6";
         this.rad7.textColor = StaticValue.WHITE;
         this.rad7.x = 10 + 220 + 70;
         this.rad7.y = 140 - 10;
         addChild(this.rad7);
         this.rad7.selectState = false;
         this.rad7.addEventListener(MouseEvent.CLICK,this.onClick);
         this.bit = StaticValue.getBitmapByClassName("ui.line");
         this.bit.x = 0;
         this.bit.y = 150;
         this.bit.width = 330;
         addChild(this.bit);
      }
      
      private function onSelect(param1:MouseEvent) : void
      {
      }
      
      private function showSelectList(param1:MouseEvent) : void
      {
         this.listContainer.visible = !this.listContainer.visible;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:BaseEvent = null;
         switch(param1.target.name)
         {
            case "1":
               this.rad2.selectState = true;
               this.rad1.selectState = this.rad3.selectState = this.rad4.selectState = this.rad5.selectState = this.rad6.selectState = this.rad7.selectState = false;
               this.energyQuality.setTuPoBtn(true);
               _loc2_ = new BaseEvent(RidePanel.GET_RENEWENERGR_ENERGYQUALITY_SHOW,"","panel");
               break;
            case "2":
               this.rad1.selectState = true;
               this.rad2.selectState = this.rad3.selectState = this.rad4.selectState = this.rad5.selectState = this.rad6.selectState = this.rad7.selectState = false;
               this.energySavvy.setTuPoBtn(true);
               _loc2_ = new BaseEvent(RidePanel.GET_RENEWENERGR_ENERGYSAVVY_SHOW,"","panel");
               break;
            case "3":
               this.rad4.selectState = true;
               this.rad1.selectState = this.rad2.selectState = this.rad3.selectState = this.rad5.selectState = this.rad6.selectState = this.rad7.selectState = false;
               this.energyAccatk.setTuPoBtn(true);
               _loc2_ = new BaseEvent(RidePanel.GET_RENEWENERGR_ENERGYACCATK_SHOW,"","panel");
               break;
            case "4":
               this.rad5.selectState = true;
               this.rad1.selectState = this.rad2.selectState = this.rad4.selectState = this.rad3.selectState = this.rad6.selectState = this.rad7.selectState = false;
               this.energyRecovery.setTuPoBtn(true);
               _loc2_ = new BaseEvent(RidePanel.GET_RENEWENERGR_ENERGYRECOVERY_SHOW,"","panel");
               break;
            case "5":
               this.rad6.selectState = true;
               this.rad1.selectState = this.rad3.selectState = this.rad2.selectState = this.rad5.selectState = this.rad4.selectState = this.rad7.selectState = false;
               this.energyLight.setTuPoBtn(true);
               _loc2_ = new BaseEvent(RidePanel.GET_RENEWENERGR_ENERGYLIGHT_SHOW,"","panel");
               break;
            case "6":
               this.rad7.selectState = true;
               this.rad1.selectState = this.rad3.selectState = this.rad4.selectState = this.rad2.selectState = this.rad6.selectState = this.rad5.selectState = false;
               this.energyHealth.setTuPoBtn(true);
               _loc2_ = new BaseEvent(RidePanel.GET_RENEWENERGR_ENERGYHEALTH_SHOW,"","panel");
               break;
            case "7":
               this.rad3.selectState = true;
               this.rad1.selectState = this.rad2.selectState = this.rad4.selectState = this.rad5.selectState = this.rad6.selectState = this.rad7.selectState = false;
               this.energyPotential.setTuPoBtn(true);
               _loc2_ = new BaseEvent(RidePanel.GET_RENEWENERGR_ENERGYCHUZHANSHOW,"","panel");
         }
         this.$parent.dispatchEvent(_loc2_);
      }
      
      public function setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         this.energyQuality.$parent = param1;
         this.energySavvy.$parent = param1;
         this.energyAccatk.$parent = param1;
         this.energyRecovery.$parent = param1;
         this.energyLight.$parent = param1;
         this.energyHealth.$parent = param1;
         this.energyPotential.$parent = param1;
      }
      
      public function reset() : void
      {
         this.energy.visible = true;
         this.energyQuality.visible = false;
         this.energySavvy.visible = false;
         this.energyAccatk.visible = false;
         this.energyRecovery.visible = false;
         this.energyLight.visible = false;
         this.energyHealth.visible = false;
         this.energyPotential.visible = false;
      }
      
      public function setRadioFalse() : void
      {
         this.rad1.selectState = false;
         this.rad2.selectState = false;
         this.rad3.selectState = false;
         this.rad4.selectState = false;
         this.rad5.selectState = false;
         this.rad6.selectState = false;
         this.rad7.selectState = false;
      }
      
      public function showEnergyQuality() : void
      {
         this.energy.visible = false;
         this.energyQuality.visible = true;
         this.energySavvy.visible = false;
         this.energyAccatk.visible = false;
         this.energyRecovery.visible = false;
         this.energyLight.visible = false;
         this.energyHealth.visible = false;
         this.energyPotential.visible = false;
      }
      
      public function showEnergySavvy() : void
      {
         this.energy.visible = false;
         this.energyQuality.visible = false;
         this.energySavvy.visible = true;
         this.energyAccatk.visible = false;
         this.energyRecovery.visible = false;
         this.energyLight.visible = false;
         this.energyHealth.visible = false;
         this.energyPotential.visible = false;
      }
      
      public function showEnergyAccatk() : void
      {
         this.energy.visible = false;
         this.energyQuality.visible = false;
         this.energySavvy.visible = false;
         this.energyAccatk.visible = true;
         this.energyRecovery.visible = false;
         this.energyLight.visible = false;
         this.energyHealth.visible = false;
         this.energyPotential.visible = false;
      }
      
      public function showEnergyRecovery() : void
      {
         this.energy.visible = false;
         this.energyQuality.visible = false;
         this.energySavvy.visible = false;
         this.energyAccatk.visible = false;
         this.energyRecovery.visible = true;
         this.energyLight.visible = false;
         this.energyHealth.visible = false;
         this.energyPotential.visible = false;
      }
      
      public function showEnergyLight() : void
      {
         this.energy.visible = false;
         this.energyQuality.visible = false;
         this.energySavvy.visible = false;
         this.energyAccatk.visible = false;
         this.energyRecovery.visible = false;
         this.energyLight.visible = true;
         this.energyHealth.visible = false;
         this.energyPotential.visible = false;
      }
      
      public function showEnergyHealth() : void
      {
         this.energy.visible = false;
         this.energyQuality.visible = false;
         this.energySavvy.visible = false;
         this.energyAccatk.visible = false;
         this.energyRecovery.visible = false;
         this.energyLight.visible = false;
         this.energyHealth.visible = true;
         this.energyPotential.visible = false;
      }
      
      public function showEnergyPotential() : void
      {
         this.energy.visible = false;
         this.energyQuality.visible = false;
         this.energySavvy.visible = false;
         this.energyAccatk.visible = false;
         this.energyRecovery.visible = false;
         this.energyLight.visible = false;
         this.energyHealth.visible = false;
         this.energyPotential.visible = true;
      }
      
      public function setNameLeve(param1:String, param2:int) : void
      {
         this.energy.setEnergyRideNameLevel(param1,param2);
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this.energy.avatar = param1;
      }
      
      public function set sqzzdBtnVisible(param1:Boolean) : void
      {
         this.energyQuality.sqzzdBtn.visible = this.energySavvy.sqzzdBtn.visible = this.energyAccatk.sqzzdBtn.visible = this.energyRecovery.sqzzdBtn.visible = this.energyLight.sqzzdBtn.visible = this.energyHealth.sqzzdBtn.visible = param1;
      }
      
      public function setValue(param1:int, param2:String, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:int, param12:int, param13:int, param14:int, param15:int, param16:int) : void
      {
         this.ft_pj.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param2 + "</font>";
         this.ft_wx.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + param1 + "</font>";
         this.bar1.setValue(param3,param4);
         this.bar2.setValue(param5,param6,param7);
         this.bar3.setValue(param8,param9,param10);
         this.bar4.setValue(param11,param12,param13);
         this.bar5.setValue(param14,param15,param16);
      }
   }
}

