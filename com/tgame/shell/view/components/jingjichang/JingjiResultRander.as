package com.tgame.shell.view.components.jingjichang
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.text.TextFormat;
   
   public class JingjiResultRander extends FListCellRenderer
   {
      
      public function JingjiResultRander()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var color:uint;
         var tf:TextFormat;
         var lb:FTextArea;
         _height = 15;
         color = uint(StaticValue.RED);
         if(data.suoshu == "1")
         {
            color = uint(StaticValue.YELLOW);
         }
         else if(data.suoshu == "2")
         {
            color = uint(StaticValue.BLUE);
         }
         tf = new TextFormat();
         tf.align = "center";
         lb = new FTextArea();
         with(lb)
         {
            x = 0;
            y = 0;
            width = 42;
            height = _height;
            textColor = StaticValue.BLUE;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.paiming;
         }
         addChild(lb);
         lb = new FTextArea();
         with(lb)
         {
            x = 40;
            y = 0;
            width = 86;
            height = _height;
            textColor = color;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            if(data.userName.charAt(0) == "[" && data.userName.indexOf("]") != -1)
            {
               text = data.userName.split("]")[1];
            }
            else
            {
               text = data.userName;
            }
         }
         addChild(lb);
         lb = new FTextArea();
         with(lb)
         {
            x = 127;
            y = 0;
            width = 63;
            height = _height;
            textColor = color;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.team;
         }
         addChild(lb);
         lb = new FTextArea();
         with(lb)
         {
            x = 188;
            y = 0;
            width = 95;
            height = _height;
            textColor = color;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.qizhiNum;
         }
         addChild(lb);
         lb = new FTextArea();
         with(lb)
         {
            x = 283;
            y = 0;
            width = 43;
            height = _height;
            textColor = color;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.shenglv;
         }
         addChild(lb);
         lb = new FTextArea();
         with(lb)
         {
            x = 324;
            y = 0;
            width = 81;
            height = _height;
            textColor = color;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.jibaiNum;
         }
         addChild(lb);
         lb = new FTextArea();
         with(lb)
         {
            x = 402;
            y = 0;
            width = 74;
            height = _height;
            textColor = color;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            text = data.beiJibaiNum;
         }
         addChild(lb);
      }
   }
}

