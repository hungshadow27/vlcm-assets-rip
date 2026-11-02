package com.tgame.shell.view.components.moxuebaby
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.MoXueBabyPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class MoXue_Guanzhu_Canvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var container:FCanvas;
      
      private var putBtn:SmallButton;
      
      public var startBtn:SecondButton;
      
      private var moxueBar:ColorBar;
      
      private var tip:FTextArea;
      
      private var GuanzhuQian:ItemFace;
      
      private var GuanzhuHou:ItemFace;
      
      private var Dangqianmoxue:FTextArea;
      
      public function MoXue_Guanzhu_Canvas()
      {
         var fb:FLabel;
         var ft:FTextArea = null;
         var img:Bitmap = null;
         super();
         this.container = new FCanvas();
         this.container.skin = "box";
         addChild(this.container);
         this.container.width = 354;
         this.container.height = 210;
         ft = new FTextArea();
         ft.x = 4;
         ft.y = 15;
         ft.width = 345;
         ft.height = 135;
         ft.multiline = true;
         ft.wordWrap = true;
         ft.filters = StaticValue.filter;
         ft.autoSize = TextFieldAutoSize.LEFT;
         ft.htmlText = "<textformat leading=\'1\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("从古树“轩辕柏”上截取下来的枝条，在经过长久研究之") + LanResManager.getLanCommonTextWords("后，研制了另一种用法，利用枝条亦可将魔血浸入其") + LanResManager.getLanCommonTextWords("中，各门派发现此用途之后，亦大量研究此物。") + "</font>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将“魔血娃娃（空）”放入后，点灌注即可将您身上") + LanResManager.getLanCommonTextWords("的魔血充入到魔血娃娃中，您将得到另一个道具“魔血娃") + LanResManager.getLanCommonTextWords("娃（满）”。灌注时您身上所有的魔血全部灌入") + LanResManager.getLanCommonTextWords("娃娃中，请慎重使用。") + "</font></textformat>";
         addChild(ft);
         img = StaticValue.getBitmapByClassName("ui.line");
         this.container.addChild(img);
         img.width = 350;
         img.x = 2;
         img.y = 136;
         this.putBtn = new SmallButton();
         this.putBtn.label = LanResManager.getLanCommonTextWords("放入娃娃");
         addChild(this.putBtn);
         this.putBtn.x = 12;
         this.putBtn.y = 140;
         this.putBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.container.addChild(img);
         img.x = 20;
         img.y = 160;
         img = StaticValue.getBitmapByClassName("ui.kungfu.tree.line.light.7");
         this.container.addChild(img);
         img.rotation = -90;
         img.x = 65;
         img.y = 190;
         fb = new FLabel();
         with(fb)
         {
            x = 99;
            y = 140;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("提炼后");
         }
         this.container.addChild(fb);
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.container.addChild(img);
         img.x = 100;
         img.y = 160;
         fb = new FLabel();
         with(fb)
         {
            x = 220;
            y = 140;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("当前魔血：");
         }
         this.container.addChild(fb);
         this.tip = new FTextArea();
         this.tip.x = 155;
         this.tip.y = 158;
         this.tip.width = 185;
         this.tip.height = 45;
         this.tip.multiline = true;
         this.tip.wordWrap = true;
         this.tip.filters = StaticValue.filter;
         this.tip.autoSize = TextFieldAutoSize.LEFT;
         this.tip.htmlText = "<textformat leading=\'\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("当提取魔血后，可将当前所有魔血注入道具中。") + "<br></font></textformat>";
         this.container.addChild(this.tip);
         this.Dangqianmoxue = new FTextArea();
         this.Dangqianmoxue.x = 300;
         this.Dangqianmoxue.y = 142;
         this.Dangqianmoxue.filters = StaticValue.filter;
         this.Dangqianmoxue.autoSize = TextFieldAutoSize.LEFT;
         this.Dangqianmoxue.htmlText = "<font ></font>";
         addChild(this.Dangqianmoxue);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("开始灌注");
         addChild(this.startBtn);
         this.startBtn.enabled = true;
         this.startBtn.x = (width - this.startBtn.width) / 2;
         this.startBtn.y = 220;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.putBtn:
               this.$parent.dispatchEvent(new BaseEvent(MoXueBabyPanel.UI_MOXUEBABYPANEL_PUT_BABY_FULLCANVAS));
               break;
            case this.startBtn:
               this.$parent.dispatchEvent(new BaseEvent(MoXueBabyPanel.UI_MOXUEBABYPANEL_SATR_FULL));
         }
      }
      
      public function setItem(param1:Goods, param2:Goods) : void
      {
         if(Boolean(this.GuanzhuQian) && Boolean(this.GuanzhuQian.parent))
         {
            this.GuanzhuQian.parent.removeChild(this.GuanzhuQian);
         }
         if(Boolean(this.GuanzhuHou) && Boolean(this.GuanzhuHou.parent))
         {
            this.GuanzhuHou.parent.removeChild(this.GuanzhuHou);
         }
         if(param1)
         {
            this.GuanzhuQian = new ItemFace(param1);
            this.container.addChild(this.GuanzhuQian);
            this.GuanzhuQian.x = 22;
            this.GuanzhuQian.y = 162;
         }
         else if(Boolean(this.GuanzhuQian) && Boolean(this.GuanzhuQian.parent))
         {
            this.container.removeChild(this.GuanzhuQian);
         }
         if(param2)
         {
            this.GuanzhuHou = new ItemFace(param2);
            this.container.addChild(this.GuanzhuHou);
            this.GuanzhuHou.x = 102;
            this.GuanzhuHou.y = 162;
         }
         else if(Boolean(this.GuanzhuHou) && Boolean(this.GuanzhuHou.parent))
         {
            this.container.removeChild(this.GuanzhuHou);
         }
      }
      
      public function setMoXue(param1:int) : void
      {
         this.Dangqianmoxue.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + String(param1) + "</font>";
         if(param1 == 0)
         {
            this.tip.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("魔血不足，无法注入。") + "</font>";
         }
         else
         {
            this.tip.htmlText = "<textformat leading=\'6\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("当提取魔血后，可将当前") + "<br>" + LanResManager.getLanCommonTextWords("所有魔血注入道具中。") + "</font>";
         }
      }
   }
}

