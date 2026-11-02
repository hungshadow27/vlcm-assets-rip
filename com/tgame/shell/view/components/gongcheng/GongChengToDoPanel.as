package com.tgame.shell.view.components.gongcheng
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.text.*;
   
   public class GongChengToDoPanel extends FPanel
   {
      
      private var container:Sprite;
      
      private var scroll:FVScorllBar;
      
      public function GongChengToDoPanel()
      {
         super();
         skin = "sceondPanel";
         dragAble = true;
         showCloseButton = true;
         width = 284;
         height = 264;
         titleText = LanResManager.getLanCommonTextWords("攻城日程查询");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.container = new Sprite();
         with(this.container.graphics)
         {
            beginFill(0,0);
            drawRect(0,0,252,230);
            endFill();
         }
         addChild(this.container);
         this.container.x = 6;
         this.container.y = 2;
         this.scroll = new FVScorllBar(this.container,230);
         addChild(this.scroll);
         this.scroll.x = 258;
         this.scroll.y = 2;
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function setTodoValue(param1:Array) : void
      {
         var lineBD:BitmapData;
         var px:int;
         var i:int = 0;
         var j:int = 0;
         var len:int = 0;
         var len1:int = 0;
         var title:FTextArea = null;
         var content:FTextArea = null;
         var str:String = null;
         var date:Date = null;
         var line:Bitmap = null;
         var value:Array = param1;
         while(this.container.numChildren > 0)
         {
            this.container.removeChildAt(0);
         }
         lineBD = StaticValue.getBitmapByClassName("ui.line").bitmapData;
         px = 5;
         len = int(value.length);
         i = 0;
         while(i < len)
         {
            title = new FTextArea();
            with(title)
            {
               
               x = 15;
               y = px;
               autoSize = TextFieldAutoSize.LEFT;
               textColor = StaticValue.ORANGE;
               filters = StaticValue.filter;
               htmlText = LanResManager.getLanTextWords(this,0);
            }
            this.container.addChild(title);
            len1 = int(value[i][2].length);
            str = "";
            j = 0;
            while(j < len1)
            {
               str += value[i][2][j] + "<br>";
               j++;
            }
            date = value[i][0] as Date;
            content = new FTextArea();
            with(content)
            {
               
               x = 84;
               y = px;
               autoSize = TextFieldAutoSize.LEFT;
               textColor = StaticValue.WHITE;
               filters = StaticValue.filter;
               htmlText = "<textformat leading = \'6\'>" + date.fullYear + "-" + (date.month + 1) + "-" + date.date + "    19:00-20:00<br><font color=\'" + StaticValue.BLUE_HTML + "\'>" + value[i][1] + "</font><br><font color=\'" + StaticValue.RED_HTML + "\'>" + str + "</font></textformat>";
            }
            this.container.addChild(content);
            line = new Bitmap(lineBD);
            this.container.addChild(line);
            line.width = 252;
            line.y = content.y + content.height + 5;
            px = line.y + 5;
            i++;
         }
         this.scroll.update();
      }
   }
}

