package com.tgame.shell.view.components.party
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.text.TextFormat;
   
   public class PartyFlag_memberListRedner extends FListCellRenderer
   {
      
      public function PartyFlag_memberListRedner()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var tf:TextFormat;
         var ft:FTextArea;
         _height = 20;
         tf = new TextFormat();
         tf.align = "center";
         ft = new FTextArea();
         with(ft)
         {
            x = 0;
            y = 2;
            width = 84;
            height = 18;
            textColor = StaticValue.GREEN;
            defaultTextFormat = tf;
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
            x = 84;
            y = 2;
            width = 46;
            height = 18;
            textColor = StaticValue.WHITE;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.lv;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 130;
            y = 2;
            width = 70;
            height = 18;
            textColor = StaticValue.WHITE;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.zhiwu;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 201;
            y = 2;
            width = 57;
            height = 18;
            textColor = StaticValue.WHITE;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.bangzhuling;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 258;
            y = 2;
            width = 58;
            height = 18;
            textColor = StaticValue.WHITE;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.qinglong;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 317;
            y = 2;
            width = 58;
            height = 18;
            textColor = StaticValue.WHITE;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.baihu;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 374;
            y = 2;
            width = 58;
            height = 18;
            textColor = StaticValue.WHITE;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.zhuque;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 432;
            y = 2;
            width = 58;
            height = 18;
            textColor = StaticValue.WHITE;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.xuanwu;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 490;
            y = 2;
            width = 70;
            height = 18;
            textColor = StaticValue.WHITE;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.copper;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 562;
            y = 2;
            width = 72;
            height = 18;
            textColor = StaticValue.WHITE;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.lisi;
         }
         addChild(ft);
      }
   }
}

