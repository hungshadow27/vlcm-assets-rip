package com.tgame.shell.view.components.instanceportal
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.text.TextFormat;
   
   public class ProcessionListRender extends FListCellRenderer
   {
      
      public function ProcessionListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var tf:TextFormat;
         var ft:FTextArea;
         _height = 28;
         tf = new TextFormat();
         tf.align = "center";
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            width = 75;
            height = 23;
            x = 2;
            y = 5;
            textColor = StaticValue.BLUE;
            if(data.name.charAt(0) == "[" && data.name.indexOf("]") != -1)
            {
               text = data.name.split("]")[1];
            }
            else
            {
               text = data.name;
            }
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            x = 78;
            y = 5;
            width = 35;
            height = 23;
            textColor = StaticValue.WHITE;
            text = data.grade + LanResManager.getLanCommonTextWords("级");
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            x = 120;
            y = 5;
            width = 40;
            height = 23;
            textColor = StaticValue.WHITE;
            text = data.school;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            x = 165;
            y = 5;
            width = 45;
            height = 23;
            if(data.state == 1)
            {
               textColor = StaticValue.GREEN;
               text = LanResManager.getLanCommonTextWords("同意");
            }
            else if(data.state == 2)
            {
               textColor = StaticValue.RED;
               text = LanResManager.getLanCommonTextWords("拒绝");
            }
            else if(data.state == 3)
            {
               textColor = StaticValue.ORANGE;
               text = LanResManager.getLanTextWords(this,0);
            }
            else if(data.state == 4)
            {
               textColor = StaticValue.WHITE;
               text = LanResManager.getLanTextWords(this,1);
            }
         }
         addChild(ft);
      }
   }
}

