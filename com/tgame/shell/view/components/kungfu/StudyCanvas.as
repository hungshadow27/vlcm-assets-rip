package com.tgame.shell.view.components.kungfu
{
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FBitmapDataBufferManager;
   import com.fireice.util.Tools;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.shell.view.components.KungFuPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class StudyCanvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var skill:ItemFace;
      
      private var skillName:FLabel;
      
      private var lv:FLabel;
      
      private var content:FTextArea;
      
      private var studyQualification:FTextArea;
      
      private var item:ItemFace;
      
      private var btn:SmallButton;
      
      private var studyTip:FLabel;
      
      private var tipICO:Bitmap;
      
      public function StudyCanvas()
      {
         var scroll:FVScorllBar;
         var img:Bitmap = null;
         super();
         this.skillName = new FLabel();
         with(this.skillName)
         {
            x = 65;
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
            text = LanResManager.getLanTextWords(this,0);
         }
         addChild(this.lv);
         this.tipICO = new Bitmap();
         addChild(this.tipICO);
         this.tipICO.x = 55;
         this.tipICO.y = 32;
         this.studyTip = new FLabel();
         with(this.studyTip)
         {
            x = 65;
            y = 30;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
         }
         addChild(this.studyTip);
         this.content = new FTextArea();
         with(this.content)
         {
            x = 4;
            y = 60;
            width = 190;
            height = 198;
            textColor = StaticValue.BlUE20;
            content.mouseWheelEnabled = true;
            wordWrap = true;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,1,[StaticValue.ORANGE_HTML,StaticValue.BLUE_HTML,StaticValue.ORANGE_HTML,StaticValue.GREEN_HTML,StaticValue.ORANGE_HTML,StaticValue.GREEN_HTML,StaticValue.ORANGE_HTML]) + "</textformat>";
         }
         addChild(this.content);
         scroll = new FVScorllBar(this.content,198);
         addChild(scroll);
         scroll.x = 248;
         scroll.y = 60;
         img = StaticValue.getBitmapByClassName("ui.kungfu.text.2");
         addChild(img);
         img.x = (268 - img.width) / 2;
         img.y = 262;
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(img);
         img.x = 223;
         img.y = 290;
         this.studyQualification = new FTextArea();
         with(this.studyQualification)
         {
            x = 8;
            y = 285;
            width = 235;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BlUE20;
            wordWrap = true;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,2,[StaticValue.ORANGE_HTML,StaticValue.WHITE_HTML,StaticValue.ORANGE_HTML,StaticValue.WHITE_HTML]) + "</textformat>";
         }
         addChild(this.studyQualification);
         this.btn = new SmallButton();
         this.btn.label = LanResManager.getLanTextWords(this,3);
         addChild(this.btn);
         this.btn.enabled = false;
         this.btn.x = 223 + (39 - this.btn.width) / 2;
         this.btn.y = 338;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(KungFuPanel.UI_KUNGFU_SKILL_STUDY,"",this.skill.getBaseItem().id));
      }
      
      public function set SKILL(param1:Skill) : void
      {
         if(Boolean(this.skill) && Boolean(this.skill.parent))
         {
            this.skill.parent.removeChild(this.skill);
         }
         this.skill = new ItemFace(param1);
         this.skill.filters = Tools.blackWhiteFilter;
         addChild(this.skill);
         this.skill.x = 16;
         this.skill.y = 10;
         this.skillName.text = param1.res.name;
         if(GameInstance.mainCharData.attributeInfo.lv >= param1.studyLevel)
         {
            this.tipICO.bitmapData = FBitmapDataBufferManager.getBD("ui.kungfu.ico.fit");
            this.studyTip.textColor = StaticValue.GREEN;
            this.studyTip.text = LanResManager.getLanTextWords(this,4);
            this.studyTip.x = 68;
         }
         else
         {
            if(this.tipICO.bitmapData)
            {
               this.tipICO.bitmapData = null;
            }
            this.studyTip.textColor = StaticValue.RED;
            this.studyTip.text = LanResManager.getLanTextWords(this,5);
         }
         this.content.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,6) + "</font>" + (param1.res.useway == 1 ? "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,7) : "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanTextWords(this,9)) + "</font><br>" + (param1.res.useway == 1 ? "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,8) + "</font>" + (param1.buffres.user_scope == 1 ? "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,16) : "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,12)) + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,10) + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1.res.distance + "</font><br>" : "") + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager
         .getLanTextWords(this,11) + "</font><br>" + param1.res.desc + "</textformat>";
         this.studyQualification.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,13) + "</font>" + (GameInstance.mainCharData.attributeInfo.lv >= param1.studyLevel ? "<font color=\'" + StaticValue.GREEN_HTML + "\'>" : "<font color=\'" + StaticValue.RED_HTML + "\'>") + param1.studyLevel + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,14) + "</font>" + (param1.res.wugong_type == 4 ? "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1.res.getMijiName() + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,15) + "</font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + param1.res.bangGong + "</font><br>" : "") + param1.res.source + "</textformat>";
      }
      
      public function set ITEM(param1:Goods) : void
      {
         if(Boolean(this.item) && Boolean(this.item.parent))
         {
            this.item.parent.removeChild(this.item);
         }
         if(!param1)
         {
            this.studyQualification.htmlText = "";
            this.btn.visible = false;
            return;
         }
         this.item = new ItemFace(param1);
         addChild(this.item);
         this.item.x = 225;
         this.item.y = 292;
         this.btn.visible = true;
         if(param1.count == 0)
         {
            this.item.filters = Tools.blackWhiteFilter;
            this.btn.enabled = false;
            if((this.skill.getBaseItem() as Skill).res.wugong_type == 4)
            {
               this.studyQualification.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,13) + "</font>" + (GameInstance.mainCharData.attributeInfo.lv >= (this.skill.getBaseItem() as Skill).studyLevel ? "<font color=\'" + StaticValue.GREEN_HTML + "\'>" : "<font color=\'" + StaticValue.RED_HTML + "\'>") + (this.skill.getBaseItem() as Skill).studyLevel + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,14) + "</font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + (this.skill.getBaseItem() as Skill).res.getMijiName() + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,15) + "</font>" + "<font color=\'" + ((this.skill.getBaseItem() as Skill).res.bangGong > GameInstance.mainCharData.banghuiInfo.banggong ? StaticValue.RED_HTML : StaticValue.GREEN_HTML) + "\'>" + (this.skill.getBaseItem() as Skill).res.bangGong + "</font><br>" + (this
               .skill.getBaseItem() as Skill).res.source + "</textformat>";
            }
            else
            {
               this.studyQualification.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,13) + "</font>" + (GameInstance.mainCharData.attributeInfo.lv >= (this.skill.getBaseItem() as Skill).studyLevel ? "<font color=\'" + StaticValue.GREEN_HTML + "\'>" : "<font color=\'" + StaticValue.RED_HTML + "\'>") + (this.skill.getBaseItem() as Skill).studyLevel + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,14) + "</font>" + "<font color=\'" + StaticValue.RED_HTML + "\'>" + (this.skill.getBaseItem() as Skill).res.getMijiName() + "</font><br>" + (this.skill.getBaseItem() as Skill).res.source + "</textformat>";
            }
         }
         else
         {
            this.btn.enabled = true;
         }
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

