package com.tgame.shell.view.components.party
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.text.TextFormat;
   
   public class Party_managerListRender extends FListCellRenderer
   {
      
      public function Party_managerListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var tf:TextFormat;
         var ft:FTextArea;
         _height = 17;
         tf = new TextFormat();
         tf.align = "center";
         ft = new FTextArea();
         with(ft)
         {
            x = 0;
            width = 98;
            height = 17;
            defaultTextFormat = tf;
            textColor = StaticValue.GREEN;
            filters = StaticValue.filter;
            if(data.label.charAt(0) == "[" && data.label.indexOf("]") != -1)
            {
               text = data.label.split("]")[1];
            }
            else
            {
               text = data.label;
            }
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 98;
            width = 53;
            height = 17;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.lv;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 150;
            width = 70;
            height = 17;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.job;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 220;
            width = 95;
            height = 17;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            if(data.chenghao.charAt(0) == "[" && data.chenghao.indexOf("]") != -1)
            {
               text = data.chenghao.split("]")[1];
            }
            else
            {
               text = data.chenghao;
            }
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 316;
            width = 110;
            height = 17;
            defaultTextFormat = tf;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = data.gongxian;
         }
         addChild(ft);
      }
   }
}

