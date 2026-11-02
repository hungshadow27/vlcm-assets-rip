package com.tgame.shell.view.components.shiJieBei
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.DisplayObject;
   import flash.text.TextFormat;
   
   public class ShiJieBeiList extends FListCellRenderer
   {
      
      private var tf:TextFormat;
      
      private var ditu:DisplayObject;
      
      private var nam:FTextArea;
      
      public function ShiJieBeiList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 25;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.ditu = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijiebei/nameBg.swf");
         this.ditu.x = 2;
         this.ditu.y = 2;
         addChild(this.ditu);
         if(data.isOut)
         {
            this.ditu.filters = Tools.blackWhiteFilter;
         }
         else
         {
            this.ditu.filters = [];
         }
         this.nam = new FTextArea();
         addChild(this.nam);
         this.nam.multiline = true;
         this.nam.defaultTextFormat = this.tf;
         this.nam.filters = StaticValue.filter;
         this.nam.wordWrap = true;
         this.nam.width = 170;
         this.nam.x = -22;
         this.nam.y = 3;
         this.nam.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'>" + data.name + "</font>";
      }
   }
}

