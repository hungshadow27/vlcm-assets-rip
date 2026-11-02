package com.tgame.shell.view.components
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
   
   public class XinfaPanel extends FPanel
   {
      
      public static const UI_XINFAPANEL_OK:String = "UI_XINFAPANEL_OK";
      
      private var skillName:FTextArea;
      
      private var btn:FSimpleButton;
      
      private var menuContainer:FCanvas;
      
      private var skillContainer:Sprite;
      
      private var scroll:FVScorllBar;
      
      private var skill:ItemFace;
      
      private var okBtn:SecondButton;
      
      private var cancelBtn:SecondButton;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      public function XinfaPanel()
      {
         var img:Bitmap;
         var v:Vector.<Bitmap>;
         var tips:FTextArea;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         width = 286;
         height = 283;
         titleText = LanResManager.getLanCommonTextWords("心法修炼");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = new Bitmap();
         img.name = "ui.xinfa.ui";
         addChild(img);
         img.x = 10;
         img.y = 2;
         v = new Vector.<Bitmap>();
         v.push(img);
         DynamicManageImages = v;
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
            height = 40;
            wordWrap = true;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("打坐时您不但可以获得经验与真气收益，还可以选择修炼一种心法，增加熟练度") + "</textformat>";
         }
         addChild(tips);
         tips = new FTextArea();
         with(tips)
         {
            x = 20;
            y = 59;
            width = 80;
            height = 40;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,"请在本处选择一种心法") + "</textformat>";
         }
         addChild(tips);
         tips = new FTextArea();
         with(tips)
         {
            x = 20;
            y = 108;
            width = 245;
            height = 90;
            wordWrap = true;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("温馨提示") + "：<br></font>" + LanResManager.getLanCommonTextWords("当") + "<font color=\'" + StaticValue.BLUE_HTML + "\'><u>" + LanResManager.getLanTextWords(this,"武功或心法的熟练度") + "</textformat>";
         }
         addChild(tips);
         tips.addEventListener(MouseEvent.MOUSE_OVER,this.onTip);
         tips.addEventListener(MouseEvent.MOUSE_OUT,this.onTip);
         this.skillName = new FTextArea();
         with(this.skillName)
         {
            x = 155;
            y = 55;
            height = 40;
            wordWrap = true;
            textColor = StaticValue.YELLOW;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanTextWords(this,"心法层数",["<br><font color=\'" + StaticValue.ORANGE_HTML + "\'>"]) + "：999</font></textformat>";
         }
         addChild(this.skillName);
         this.btn = new FSimpleButton();
         this.btn.skin = "bottomButton";
         addChild(this.btn);
         this.btn.x = 154;
         this.btn.y = 75;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.menuContainer = new FCanvas();
         this.menuContainer.skin = "backGroud";
         addChild(this.menuContainer);
         this.menuContainer.width = 39;
         this.menuContainer.height = 79;
         this.menuContainer.x = 115;
         this.menuContainer.y = 93;
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
         this.okBtn.y = 217;
         this.okBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.cancelBtn = new SecondButton();
         this.cancelBtn.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.cancelBtn);
         this.cancelBtn.x = panelWidth - this.cancelBtn.width - 40;
         this.cancelBtn.y = 217;
         this.cancelBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onTip(param1:MouseEvent) : void
      {
         var _loc2_:FTextArea = null;
         var _loc3_:int = 0;
         _loc2_ = param1.target as FTextArea;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               _loc2_.addEventListener(MouseEvent.MOUSE_MOVE,this.onTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc3_ = _loc2_.getCharIndexAtPoint(_loc2_.mouseX,_loc2_.mouseY);
               if(_loc3_ >= _loc2_.text.indexOf(LanResManager.getLanCommonTextWords("武功或心法的熟练度")) && _loc3_ <= _loc2_.text.indexOf(LanResManager.getLanCommonTextWords("武功或心法的熟练度")) + 8)
               {
                  this.showTip("<textformat leading=\'\'><font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanTextWords(this,"武功层数信息") + "<br></font>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanTextWords(this,"武功熟练度信息") + "<br></font>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanTextWords(this,"武功熟练度信息2") + "</font></textformat>");
               }
               else if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               _loc2_.removeEventListener(MouseEvent.MOUSE_MOVE,this.onTip);
         }
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
               dispatchEvent(new BaseEvent(UI_XINFAPANEL_OK,"",this.skill.getBaseItem()));
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
         this.skill.y = 56;
         this.skillName.htmlText = "<textformat leading=\'6\'>" + param1.res.name + "<br>       <font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("当前层数") + "：" + param1.level + "</font></textformat>";
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
      
      public function set Skills(param1:Array) : void
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

