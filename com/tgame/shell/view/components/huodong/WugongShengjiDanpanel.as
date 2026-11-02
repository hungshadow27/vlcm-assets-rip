package com.tgame.shell.view.components.huodong
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Skill;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class WugongShengjiDanpanel extends FPanel
   {
      
      public static const UI_WUGONGSHENGJIDAN_OK:String = "UI_WUGONGSHENGJIDAN_OK";
      
      private var skillName:FTextArea;
      
      private var btn:FSimpleButton;
      
      private var menuContainer:FCanvas;
      
      private var skillContainer:Sprite;
      
      private var scroll:FVScorllBar;
      
      private var skill:ItemFace;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var line:Bitmap;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      public function WugongShengjiDanpanel(param1:Array)
      {
         var tips:FTextArea;
         var ar:Array = param1;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 286;
         height = 220;
         titleText = LanResManager.getLanCommonTextWords("武功升级丹");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         tips = new FTextArea();
         with(tips)
         {
            x = 20;
            y = 5;
            width = 245;
            height = 80;
            wordWrap = true;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'8\'>" + LanResManager.getLanTextWords(this,"武功升级丹可以用来提",[StaticValue.ORANGE_HTML,StaticValue.GREEN_HTML,StaticValue.RED_HTML]) + "</textformat>";
         }
         addChild(tips);
         tips = new FTextArea();
         with(tips)
         {
            x = 20;
            y = 99;
            width = 80;
            height = 40;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,"请在本处选择一种武功") + "</textformat>";
         }
         addChild(tips);
         this.skillName = new FTextArea();
         with(this.skillName)
         {
            x = 175;
            y = 99;
            width = 90;
            height = 40;
            wordWrap = true;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            htmlText = "";
         }
         addChild(this.skillName);
         this.line = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.line);
         this.line.x = 115;
         this.line.y = 94;
         this.btn = new FSimpleButton();
         this.btn.skin = "bottomButton";
         addChild(this.btn);
         this.btn.x = 154;
         this.btn.y = 115;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.menuContainer = new FCanvas();
         this.menuContainer.skin = "backGroud";
         addChild(this.menuContainer);
         this.menuContainer.width = 39;
         this.menuContainer.height = 79;
         this.menuContainer.x = 115;
         this.menuContainer.y = 133;
         this.menuContainer.visible = false;
         this.skillContainer = new Sprite();
         with(this.skillContainer.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,35,75);
            endFill();
         }
         this.skillContainer.x = this.skillContainer.y = 2;
         this.menuContainer.addChild(this.skillContainer);
         this.skillContainer.addEventListener(MouseEvent.CLICK,this.onSelect);
         this.scroll = new FVScorllBar(this.skillContainer,75);
         this.menuContainer.addChild(this.scroll);
         this.scroll.x = 40;
         this.scroll.y = 2;
         this.okBtn = new SecondButton();
         this.okBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.okBtn);
         this.okBtn.x = 40;
         this.okBtn.y = 217 - 63;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = panelWidth - this.cancelBtn.width - 40;
         this.cancelBtn.y = 217 - 63;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.Skills(ar);
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 15;
      }
      
      private function onSelect(param1:MouseEvent) : void
      {
         this.menuContainer.visible = false;
         if(param1.target is ItemFace)
         {
            this.item = Skill((param1.target as ItemFace).getBaseItem());
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               this.menuContainer.visible = !this.menuContainer.visible;
               break;
            case this.okBtn:
               dispatchEvent(new BaseEvent(UI_WUGONGSHENGJIDAN_OK,"",this.skill.getBaseItem()));
               this.onClose();
               break;
            case this.cancelBtn:
               this.onClose();
         }
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function set item(param1:Skill) : void
      {
         if(Boolean(this.skill) && Boolean(this.skill.parent))
         {
            this.skill.parent.removeChild(this.skill);
         }
         this.skill = new ItemFace(param1);
         addChild(this.skill);
         this.skill.x = 117;
         this.skill.y = 96;
         this.skillName.htmlText = "<textformat leading=\'6\'>" + param1.res.name + "<br><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前层数") + "：" + param1.level + "</font></textformat>";
      }
      
      private function reset() : void
      {
         while(this.skillContainer.numChildren > 0)
         {
            this.skillContainer.removeChildAt(0);
         }
         this.skillName.htmlText = "";
         if(Boolean(this.skill) && Boolean(this.skill.parent))
         {
            this.skill.parent.removeChild(this.skill);
         }
      }
      
      public function Skills(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc4_:ItemFace = null;
         this.reset();
         if(!param1 || param1.length == 0)
         {
            this.okBtn.enabled = false;
            return;
         }
         var _loc3_:int = int(param1.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            _loc4_ = new ItemFace(param1[_loc2_] as Skill);
            this.skillContainer.addChild(_loc4_);
            _loc4_.y = _loc2_ * 35;
            _loc2_++;
         }
         this.scroll.update();
         this.item = param1[0] as Skill;
         this.okBtn.enabled = true;
      }
   }
}

