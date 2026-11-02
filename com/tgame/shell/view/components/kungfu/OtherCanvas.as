package com.tgame.shell.view.components.kungfu
{
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Skill;
   import flash.display.Sprite;
   import flash.text.*;
   
   public class OtherCanvas extends Sprite
   {
      
      private var skill:ItemFace;
      
      private var skillName:FLabel;
      
      private var content:FTextArea;
      
      public function OtherCanvas()
      {
         super();
         this.skillName = new FLabel();
         with(this.skillName)
         {
            x = 74;
            y = 20;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,0);
         }
         addChild(this.skillName);
         this.content = new FTextArea();
         with(this.content)
         {
            x = 4;
            y = 60;
            width = 190;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BlUE20;
            wordWrap = true;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,1) + "</font><br>" + LanResManager.getLanTextWords(this,2) + "</textformat>";
         }
         addChild(this.content);
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
         this.content.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,1) + "</font><br>" + param1.res.desc + "</textformat>";
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

