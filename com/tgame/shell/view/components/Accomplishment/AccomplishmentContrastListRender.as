package com.tgame.shell.view.components.Accomplishment
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.fireice.util.Tools;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.text.*;
   
   public class AccomplishmentContrastListRender extends FListCellRenderer
   {
      
      private var img:Bitmap;
      
      private var Fname:FLabel;
      
      private var ft:FTextArea;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var CjBar:ColorBar;
      
      public function AccomplishmentContrastListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var obj:DisplayObject;
         _height = 112;
         this.img = StaticValue.getBitmapByClassName("ui.active.temp.timeGift.title.bg");
         this.img.y = 0;
         this.img.width = 213;
         addChild(this.img);
         this.Fname = new FLabel();
         with(this.Fname)
         {
            x = 80;
            y = 4;
            filters = StaticValue.filter;
            textColor = StaticValue.GREEN_STRONG;
            text = data.name;
         }
         addChild(this.Fname);
         this.img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.slot.big");
         addChild(this.img);
         this.img.x = 10;
         this.img.y = 25;
         obj = FLoader.startLoad(data.icoPath,65,65);
         addChild(obj);
         obj.x = 12;
         obj.y = 27;
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 82;
            y = 28;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            x = 165;
            y = 28;
            wordWrap = true;
            width = 65;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "";
         }
         addChild(this.ft2);
         if(data.isAccomplish == false)
         {
            this.img = StaticValue.getBitmapByClassName("ui.char.attribute.accomplishment.colorBar.bg");
            addChild(this.img);
            this.img.x = 82;
            this.img.y = 77;
            this.CjBar = new ColorBar(1,95,11);
            addChild(this.CjBar);
            this.CjBar.x = 97;
            this.CjBar.y = 80;
            this.CjBar.setValue(data.CjNow,data.CjMax);
            this.Fname.textColor = StaticValue.BLUE;
            this.ft1.htmlText = "<textformat leading=\'0.1\'>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("成就点数：") + "</font><br>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("加成血量：") + "</font><br>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanCommonTextWords("奖励礼金：") + "</font><br>" + "</textformat>";
            this.ft2.htmlText = "<textformat leading=\'0.1\'>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + data.cjds + "</font><br>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + data.jcxl + "</font><br>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + data.jllj + "</font><br>" + "</textformat>";
            obj.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.Fname.textColor = StaticValue.GREEN_STRONG;
            this.ft1.htmlText = "<textformat leading=\'0.1\'>" + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("成就点数：") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("加成血量：") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("奖励礼金：") + "</font><br>" + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("成就状态：") + "</font>" + "</textformat>";
            this.ft2.htmlText = "<textformat leading=\'0.1\'>" + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + data.cjds + "</font><br>" + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + data.jcxl + "</font><br>" + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + data.jllj + "</font><br>" + "<font color=\'" + StaticValue.GREEN_STRONG_HTML + "\'>" + LanResManager.getLanCommonTextWords("【已达成】") + "</font>" + "</textformat>";
         }
      }
   }
}

