package com.tgame.shell.view.components.kungfu
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FBitmapDataBufferManager;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.KungFuPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class UpgradeCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var skill:ItemFace;
      
      private var skillName:FLabel;
      
      private var lv:FLabel;
      
      private var colorBar:ColorBar;
      
      private var contentContainer:Sprite;
      
      private var content:FTextArea;
      
      private var studyQualification:FTextArea;
      
      private var btn:FSimpleButton;
      
      private var colorBarBg:Bitmap;
      
      private var gradeTip:FLabel;
      
      private var tipICO:Bitmap;
      
      private var scroll:FVScorllBar;
      
      private var check:FCheckBox;
      
      private var checkLabel:FLabel;
      
      public function UpgradeCanvas()
      {
         var img:Bitmap;
         super();
         this.skillName = new FLabel();
         with(this.skillName)
         {
            x = 58;
            y = 10;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(OtherCanvas,0);
         }
         addChild(this.skillName);
         this.lv = new FLabel();
         with(this.lv)
         {
            x = 185;
            y = 10;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(StudyCanvas,0);
         }
         addChild(this.lv);
         this.tipICO = new Bitmap();
         addChild(this.tipICO);
         this.tipICO.x = 55;
         this.tipICO.y = 32;
         this.gradeTip = new FLabel();
         with(this.gradeTip)
         {
            x = 58;
            y = 30;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
         }
         addChild(this.gradeTip);
         this.contentContainer = new Sprite();
         addChild(this.contentContainer);
         this.contentContainer.x = 4;
         this.contentContainer.y = 56;
         this.contentContainer.graphics.beginFill(0,0);
         this.contentContainer.graphics.drawRect(0,0,180,198);
         this.contentContainer.graphics.endFill();
         this.content = new FTextArea();
         with(this.content)
         {
            width = 190;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BlUE20;
            content.mouseWheelEnabled = false;
            wordWrap = true;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'2\'>" + LanResManager.getLanTextWords(this,1,[StaticValue.ORANGE_HTML,StaticValue.BLUE_HTML,StaticValue.ORANGE_HTML,StaticValue.ORANGE_HTML,StaticValue.GREEN_HTML,StaticValue.ORANGE_HTML,StaticValue.GREEN_HTML,StaticValue.ORANGE_HTML]) + "</textformat>";
         }
         this.contentContainer.addChild(this.content);
         this.colorBarBg = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         this.contentContainer.addChild(this.colorBarBg);
         this.colorBarBg.width = 118;
         this.colorBarBg.x = 62;
         this.colorBarBg.y = 20;
         this.colorBar = new ColorBar(5,110,5,true,true);
         this.contentContainer.addChild(this.colorBar);
         this.colorBar.x = 66;
         this.colorBar.y = 23;
         this.scroll = new FVScorllBar(this.contentContainer,198);
         addChild(this.scroll);
         this.scroll.x = 248;
         this.scroll.y = 60;
         img = StaticValue.getBitmapByClassName("ui.kungfu.text.1");
         addChild(img);
         img.x = (268 - img.width) / 2;
         img.y = 262;
         this.studyQualification = new FTextArea();
         with(this.studyQualification)
         {
            x = 8;
            y = 295;
            width = 235;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BlUE20;
            wordWrap = true;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,1) + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>10</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,2) + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>50</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,3) + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>50</font><br>" + "</textformat>";
         }
         addChild(this.studyQualification);
         this.btn = new FSimpleButton();
         this.btn.skin = "bigUpgradBtn";
         addChild(this.btn);
         this.btn.enabled = false;
         this.btn.x = 212;
         this.btn.y = 305;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.check = new FCheckBox();
         addChild(this.check);
         this.check.x = 10;
         this.check.y = 350;
         this.checkLabel = new FLabel();
         with(this.checkLabel)
         {
            x = check.x + 25;
            --check.y;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("使用武功升级丹");
         }
         addChild(this.checkLabel);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.btn.skin == "bigUpgradBtn")
         {
            this.$parent.dispatchEvent(new BaseEvent(KungFuPanel.UI_KUNGFU_SKILL_UPGRADE,"",[this.skill.getBaseItem().id,this.check.selectState ? 1 : 0]));
         }
         else
         {
            this.$parent.dispatchEvent(new BaseEvent(KungFuPanel.UI_KUNGFU_SKILL_TUPO,"",this.skill.getBaseItem().id));
         }
      }
      
      public function set SKILL(param1:Skill) : void
      {
         if(Boolean(this.skill) && Boolean(this.skill.parent))
         {
            this.skill.parent.removeChild(this.skill);
         }
         this.skill = new ItemFace(param1);
         addChild(this.skill);
         this.skill.x = 16;
         this.skill.y = 10;
         this.skillName.text = param1.res.name;
         this.lv.text = LanResManager.getLanTextWords(this,4) + param1.level;
         if(GameInstance.mainCharData.attributeInfo.lv <= param1.studyLevel)
         {
            if(this.tipICO.bitmapData)
            {
               this.tipICO.bitmapData = null;
            }
            this.gradeTip.textColor = StaticValue.GREEN;
            this.gradeTip.text = LanResManager.getLanTextWords(this,5);
         }
         else if(GameInstance.mainCharData.moneyInfo.copper < param1.copper || GameInstance.mainCharData.attributeInfo.gqNow < param1.zhenqi)
         {
            if(this.tipICO.bitmapData)
            {
               this.tipICO.bitmapData = null;
            }
            this.gradeTip.textColor = StaticValue.BLUE;
            this.gradeTip.text = LanResManager.getLanTextWords(this,6,[GameInstance.mainCharData.attributeInfo.lv]);
         }
         else
         {
            this.tipICO.bitmapData = FBitmapDataBufferManager.getBD("ui.kungfu.ico.add");
            this.gradeTip.textColor = StaticValue.GREEN;
            this.gradeTip.text = LanResManager.getLanTextWords(this,7);
            this.gradeTip.x = 68;
         }
         if(param1.isPingJingSkill == 1)
         {
            this.btn.skin = "breakthroughBtn";
         }
         else
         {
            this.btn.skin = "bigUpgradBtn";
         }
         if(param1.isTop == 1)
         {
            this.colorBarBg.visible = this.colorBar.visible = false;
            this.content.htmlText = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(StudyCanvas,6) + "</font>" + (param1.res.useway == 1 ? "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(StudyCanvas,7) : "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanTextWords(StudyCanvas,9)) + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,8) + "</font><br>" + (param1.res.useway == 1 ? "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(StudyCanvas,8) + "</font>" + (param1.buffres.user_scope == 1 ? "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(StudyCanvas,16) : "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(StudyCanvas,12)) + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(StudyCanvas,10) + "</font>" + "<font color=\'" + StaticValue
            .GREEN_HTML + "\'>" + param1.res.distance + "</font><br>" : "") + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(StudyCanvas,11) + "</font><br>" + param1.res.desc + "</textformat>";
            this.studyQualification.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(StudyCanvas,13) + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>0</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,2) + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>0</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,3) + "</font>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>0</font><br>" + "</textformat>";
            this.btn.enabled = false;
         }
         else
         {
            this.colorBarBg.visible = this.colorBar.visible = true;
            this.colorBar.setValue(param1.shulianCurrent,param1.shulianTotal);
            this.content.htmlText = "<textformat leading=\'2\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(StudyCanvas,6) + "</font>" + (param1.res.useway == 1 ? "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(StudyCanvas,7) : "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanTextWords(StudyCanvas,9)) + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,9) + "</font><br>" + (param1.res.useway == 1 ? "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(StudyCanvas,8) + "</font>" + (param1.buffres.user_scope == 1 ? "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(StudyCanvas,16) : "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(StudyCanvas,12)) + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(StudyCanvas,10) + "</font>" + "<font color=\'" + StaticValue
            .GREEN_HTML + "\'>" + param1.res.distance + "</font><br>" : "") + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(StudyCanvas,11) + "</font><br>" + param1.res.desc + "</textformat>";
            this.studyQualification.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(StudyCanvas,13) + "</font>" + (GameInstance.mainCharData.attributeInfo.lv >= param1.studyLevel ? "<font color=\'" + StaticValue.GREEN_HTML + "\'>" : "<font color=\'" + StaticValue.RED_HTML + "\'>") + param1.studyLevel + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,2) + "</font>" + (GameInstance.mainCharData.moneyInfo.copper >= param1.copper ? "<font color=\'" + StaticValue.GREEN_HTML + "\'>" : "<font color=\'" + StaticValue.RED_HTML + "\'>") + param1.copper + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,3) + "</font>" + (GameInstance.mainCharData.attributeInfo.gqNow >= param1.zhenqi ? "<font color=\'" + StaticValue.GREEN_HTML + "\'>" : "<font color=\'" + StaticValue.RED_HTML + "\'>") + param1.zhenqi + "</font><br>";
            if(param1.isPingJingSkill == 1)
            {
               this.btn.enabled = true;
            }
            else
            {
               this.btn.enabled = true;
            }
         }
         this.scroll.update();
      }
      
      public function refresh() : void
      {
         if(!this.skill || !this.skill.parent)
         {
            return;
         }
         this.SKILL = this.skill.getBaseItem() as Skill;
      }
   }
}

