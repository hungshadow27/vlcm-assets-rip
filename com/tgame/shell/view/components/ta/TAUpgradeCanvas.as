package com.tgame.shell.view.components.ta
{
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Skill;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.text.*;
   
   public class TAUpgradeCanvas extends Sprite
   {
      
      private var skill:ItemFace;
      
      private var skillName:FLabel;
      
      private var lv:FLabel;
      
      private var colorBar:ColorBar;
      
      private var content:FTextArea;
      
      private var colorBarBg:Bitmap;
      
      public function TAUpgradeCanvas()
      {
         super();
         this.skillName = new FLabel();
         with(this.skillName)
         {
            x = 74;
            y = 10;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("武功名字");
         }
         addChild(this.skillName);
         this.lv = new FLabel();
         with(this.lv)
         {
            x = 74;
            y = 30;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("层数");
         }
         addChild(this.lv);
         this.content = new FTextArea();
         with(this.content)
         {
            x = 8;
            y = 60;
            width = 194;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BlUE20;
            wordWrap = true;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanTextWords(this,"武学类型威力说明2",[StaticValue.ORANGE_HTML,StaticValue.BLUE_HTML,StaticValue.ORANGE_HTML,StaticValue.ORANGE_HTML,StaticValue.GREEN_HTML,StaticValue.ORANGE_HTML,StaticValue.GREEN_HTML,StaticValue.ORANGE_HTML]);
         }
         addChild(this.content);
         this.colorBarBg = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.colorBarBg);
         this.colorBarBg.x = 70;
         this.colorBarBg.y = 80;
         this.colorBar = new ColorBar(5,123,5,true,true);
         addChild(this.colorBar);
         this.colorBar.x = 74;
         this.colorBar.y = 83;
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
         this.lv.text = LanResManager.getLanCommonTextWords("武功层数") + param1.level;
         if(param1.isTop == 1)
         {
            this.colorBarBg.visible = this.colorBar.visible = false;
            this.content.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("武学类型：") + "</font>" + (param1.res.useway == 1 ? "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("主动技能") : "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("被动技能")) + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("修炼进度：已达上限") + "</font><br>" + (param1.res.useway == 1 ? "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击目标：") + "</font>" + (param1.buffres.user_scope == 1 ? "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("单体") : "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("范围")) + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击范围：") + "</font>" + "<font color=\'" + StaticValue
            .GREEN_HTML + "\'>" + param1.res.distance + "</font><br>" : "") + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("效果说明：") + "</font><br>" + param1.res.desc + "</textformat>";
         }
         else
         {
            this.colorBarBg.visible = this.colorBar.visible = true;
            this.colorBar.setValue(param1.shulianCurrent,param1.shulianTotal);
            this.content.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("武学类型：") + "</font>" + (param1.res.useway == 1 ? "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("主动技能") : "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("被动技能")) + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("修炼进度：") + "</font><br>" + (param1.res.useway == 1 ? "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击目标：") + "</font>" + (param1.buffres.user_scope == 1 ? "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("单体") : "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("范围")) + "</font><br>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("攻击范围：") + "</font>" + "<font color=\'" + StaticValue
            .GREEN_HTML + "\'>" + param1.res.distance + "</font><br>" : "") + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("效果说明：") + "</font><br>" + param1.res.desc + "</textformat>";
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

