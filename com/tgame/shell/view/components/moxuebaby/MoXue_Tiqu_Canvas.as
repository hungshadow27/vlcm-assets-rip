package com.tgame.shell.view.components.moxuebaby
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.shell.view.components.MoXueBabyPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class MoXue_Tiqu_Canvas extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var container:FCanvas;
      
      private var putBtn:SmallButton;
      
      public var startBtn:SecondButton;
      
      private var tip:FTextArea;
      
      private var MoxuewawaMan:ItemFace;
      
      private var Gushuxuepo:ItemFace;
      
      private var Xuemokongjian:FTextArea;
      
      private var Liulimoxue:FTextArea;
      
      public function MoXue_Tiqu_Canvas()
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
         ft.htmlText = "<textformat leading=\'3\'><font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("同样出自“轩辕柏”，与制作魔血娃娃的材料其同连") + LanResManager.getLanCommonTextWords("枝，将魔血从娃娃中提取出来，所必需用到的材料。提") + LanResManager.getLanCommonTextWords("取其他人的魔血时，此物可作为引子，将魔血引出。") + "</font>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("将“魔血娃娃（满）”放入后，点击提取可将魔血引入您的魔血池中，届时魔血娃娃会被摧毁。每天提炼的越频繁，所需古树血魄也会越多。") + "</font></textformat>";
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
         img.rotation = 90;
         img.x = 95;
         img.y = 170;
         fb = new FLabel();
         with(fb)
         {
            x = 96;
            y = 140;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("古树血魄");
         }
         this.container.addChild(fb);
         img = StaticValue.getBitmapByClassName("ui.tiem.slot");
         this.container.addChild(img);
         img.x = 100;
         img.y = 160;
         fb = new FLabel();
         with(fb)
         {
            x = 225;
            y = 140;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("血池空间：");
         }
         this.container.addChild(fb);
         this.Xuemokongjian = new FTextArea();
         this.Xuemokongjian.x = 300;
         this.Xuemokongjian.y = 140;
         this.Xuemokongjian.filters = StaticValue.filter;
         this.Xuemokongjian.autoSize = TextFieldAutoSize.LEFT;
         this.Xuemokongjian.htmlText = "<font ></font>";
         addChild(this.Xuemokongjian);
         fb = new FLabel();
         with(fb)
         {
            x = 155;
            y = 140 + 20;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("娃娃魔血：");
         }
         this.container.addChild(fb);
         this.Liulimoxue = new FTextArea();
         this.Liulimoxue.x = 230 + 30;
         this.Liulimoxue.y = 140 + 20;
         this.Liulimoxue.filters = StaticValue.filter;
         this.Liulimoxue.autoSize = TextFieldAutoSize.LEFT;
         this.Liulimoxue.htmlText = "<font ></font>";
         addChild(this.Liulimoxue);
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 155;
            y = 158 + 20;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<textformat leading=\'\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("本次提炼需要血引一枚") + "</font></textformat>";
         }
         this.container.addChild(this.tip);
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("开始提取");
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
               this.$parent.dispatchEvent(new BaseEvent(MoXueBabyPanel.UI_MOXUEBABYPANEL_PUT_BABY_EMPTYCANVAS));
               break;
            case this.startBtn:
               this.$parent.dispatchEvent(new BaseEvent(MoXueBabyPanel.UI_MOXUEBABYPANEL_SATR_GET));
         }
      }
      
      public function setItem(param1:Goods, param2:Goods) : void
      {
         if(Boolean(this.MoxuewawaMan) && Boolean(this.MoxuewawaMan.parent))
         {
            this.MoxuewawaMan.parent.removeChild(this.MoxuewawaMan);
         }
         if(Boolean(this.Gushuxuepo) && Boolean(this.Gushuxuepo.parent))
         {
            this.Gushuxuepo.parent.removeChild(this.Gushuxuepo);
         }
         if(param1)
         {
            this.MoxuewawaMan = new ItemFace(param1);
            this.container.addChild(this.MoxuewawaMan);
            this.MoxuewawaMan.x = 22;
            this.MoxuewawaMan.y = 162;
         }
         else if(Boolean(this.MoxuewawaMan) && Boolean(this.MoxuewawaMan.parent))
         {
            this.container.removeChild(this.MoxuewawaMan);
         }
         if(param2)
         {
            this.Gushuxuepo = new ItemFace(param2);
            this.container.addChild(this.Gushuxuepo);
            this.Gushuxuepo.x = 102;
            this.Gushuxuepo.y = 162;
            if(param2.count == 0)
            {
               this.Gushuxuepo.filters = Tools.blackWhiteFilter;
            }
         }
         else if(Boolean(this.Gushuxuepo) && Boolean(this.Gushuxuepo.parent))
         {
            this.container.removeChild(this.Gushuxuepo);
         }
      }
      
      public function setMoXue(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:String = String(param1);
         var _loc5_:String = String(param2);
         this.Xuemokongjian.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + _loc4_ + "</font>";
         this.Liulimoxue.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + _loc5_ + "</font>";
         this.tip.htmlText = "<textformat leading=\'\'><font color=\'" + StaticValue.RED_HTML + "\'>" + LanResManager.getLanCommonTextWords("本次提炼需要血引") + param3 + LanResManager.getLanCommonTextWords("枚") + "</font></textformat>";
      }
   }
}

