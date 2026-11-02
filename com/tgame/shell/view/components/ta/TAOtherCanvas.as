package com.tgame.shell.view.components.ta
{
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Skill;
   import flash.display.Sprite;
   import flash.text.*;
   
   public class TAOtherCanvas extends Sprite
   {
      
      private var skill:ItemFace;
      
      private var skillName:FLabel;
      
      private var content:FTextArea;
      
      public function TAOtherCanvas()
      {
         super();
         this.skillName = new FLabel();
         with(this.skillName)
         {
            x = 74;
            y = 20;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("武功名字");
         }
         addChild(this.skillName);
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
            htmlText = LanResManager.getLanTextWords(this,"效果说明初入江湖",[StaticValue.ORANGE_HTML]);
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
         this.content.htmlText = LanResManager.getLanTextWords(this,"效果说明",[StaticValue.ORANGE_HTML,param1.res.desc]);
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

