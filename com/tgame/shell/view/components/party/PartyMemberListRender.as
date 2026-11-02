package com.tgame.shell.view.components.party
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.text.TextFormat;
   
   public class PartyMemberListRender extends FListCellRenderer
   {
      
      public function PartyMemberListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var tf:TextFormat;
         var bg:Bitmap = null;
         var ft:FTextArea = null;
         _height = 24;
         tf = new TextFormat();
         tf.align = "center";
         if(data.isLine == "1")
         {
            ft = new FTextArea();
            with(ft)
            {
               
               x = 0;
               y = 4;
               width = 92;
               height = 20;
               defaultTextFormat = tf;
               filters = StaticValue.filter;
               textColor = StaticValue.GREEN;
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
            if(data.lvIsTop == "1")
            {
               bg = StaticValue.getBitmapByClassName("ui.party.list.bg");
               addChild(bg);
               bg.x = 92;
               bg.y = 2;
               bg.width = 47;
            }
            ft = new FTextArea();
            with(ft)
            {
               
               x = 92;
               y = 4;
               width = 47;
               height = 20;
               defaultTextFormat = tf;
               filters = StaticValue.filter;
               textColor = StaticValue.WHITE;
               text = data.lv;
            }
            addChild(ft);
            ft = new FTextArea();
            with(ft)
            {
               
               x = 140;
               y = 4;
               width = 52;
               height = 20;
               defaultTextFormat = tf;
               filters = StaticValue.filter;
               textColor = StaticValue.PURPLE;
               text = data.job;
            }
            addChild(ft);
            ft = new FTextArea();
            with(ft)
            {
               
               x = 192;
               y = 4;
               width = 82;
               height = 20;
               defaultTextFormat = tf;
               filters = StaticValue.filter;
               textColor = StaticValue.BLUE;
               if(data.nickName.charAt(0) == "[" && data.nickName.indexOf("]") != -1)
               {
                  text = data.nickName.split("]")[1];
               }
               else
               {
                  text = data.nickName;
               }
            }
            addChild(ft);
            if(data.kungfuLvIsTop == "1")
            {
               bg = StaticValue.getBitmapByClassName("ui.party.list.bg");
               addChild(bg);
               bg.x = 275;
               bg.y = 2;
               bg.width = 71;
            }
            ft = new FTextArea();
            with(ft)
            {
               
               x = 275;
               y = 4;
               width = 71;
               height = 20;
               defaultTextFormat = tf;
               filters = StaticValue.filter;
               textColor = StaticValue.WHITE;
               text = data.kungfuLv;
            }
            addChild(ft);
            if(data.jingmaiLvIsTop == "1")
            {
               bg = StaticValue.getBitmapByClassName("ui.party.list.bg");
               addChild(bg);
               bg.x = 345;
               bg.y = 2;
               bg.width = 73;
            }
            ft = new FTextArea();
            with(ft)
            {
               
               x = 345;
               y = 4;
               width = 73;
               height = 20;
               defaultTextFormat = tf;
               filters = StaticValue.filter;
               textColor = StaticValue.WHITE;
               text = data.jingmaiLv;
            }
            addChild(ft);
            if(data.chengjiuLvIsTop == "1")
            {
               bg = StaticValue.getBitmapByClassName("ui.party.list.bg");
               addChild(bg);
               bg.x = 418;
               bg.y = 2;
               bg.width = 73;
            }
            ft = new FTextArea();
            with(ft)
            {
               
               x = 418;
               y = 4;
               width = 73;
               height = 20;
               defaultTextFormat = tf;
               filters = StaticValue.filter;
               textColor = StaticValue.WHITE;
               text = data.chengjiuLv;
            }
            addChild(ft);
            if(data.shengwangIsTop == "1")
            {
               bg = StaticValue.getBitmapByClassName("ui.party.list.bg");
               addChild(bg);
               bg.x = 492;
               bg.y = 2;
               bg.width = 73;
            }
            ft = new FTextArea();
            with(ft)
            {
               
               x = 492;
               y = 4;
               width = 73;
               height = 20;
               defaultTextFormat = tf;
               filters = StaticValue.filter;
               textColor = StaticValue.WHITE;
               text = data.shengwang;
            }
            addChild(ft);
            if(data.bossIsTop == "1")
            {
               bg = StaticValue.getBitmapByClassName("ui.party.list.bg");
               addChild(bg);
               bg.x = 565;
               bg.y = 2;
               bg.width = 73;
            }
            ft = new FTextArea();
            with(ft)
            {
               
               x = 565;
               y = 4;
               width = 73;
               height = 20;
               defaultTextFormat = tf;
               filters = StaticValue.filter;
               textColor = StaticValue.RED;
               text = data.boss;
            }
            addChild(ft);
         }
         else
         {
            ft = new FTextArea();
            with(ft)
            {
               
               x = 0;
               y = 4;
               width = 92;
               height = 20;
               defaultTextFormat = tf;
               filters = StaticValue.filter;
               textColor = 6052956;
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
            if(data.lvIsTop == "1")
            {
               bg = StaticValue.getBitmapByClassName("ui.party.list.bg");
               addChild(bg);
               bg.x = 92;
               bg.y = 2;
               bg.width = 47;
            }
            ft = new FTextArea();
            with(ft)
            {
               
               x = 92;
               y = 4;
               width = 47;
               height = 20;
               defaultTextFormat = tf;
               filters = StaticValue.filter;
               textColor = 6052956;
               text = data.lv;
            }
            addChild(ft);
            ft = new FTextArea();
            with(ft)
            {
               
               x = 140;
               y = 4;
               width = 52;
               height = 20;
               defaultTextFormat = tf;
               filters = StaticValue.filter;
               textColor = 6052956;
               text = data.job;
            }
            addChild(ft);
            ft = new FTextArea();
            with(ft)
            {
               
               x = 192;
               y = 4;
               width = 82;
               height = 20;
               defaultTextFormat = tf;
               filters = StaticValue.filter;
               textColor = 6052956;
               if(data.nickName.charAt(0) == "[" && data.nickName.indexOf("]") != -1)
               {
                  text = data.nickName.split("]")[1];
               }
               else
               {
                  text = data.nickName;
               }
            }
            addChild(ft);
            if(data.kungfuLvIsTop == "1")
            {
               bg = StaticValue.getBitmapByClassName("ui.party.list.bg");
               addChild(bg);
               bg.x = 275;
               bg.y = 2;
               bg.width = 71;
            }
            ft = new FTextArea();
            with(ft)
            {
               
               x = 275;
               y = 4;
               width = 71;
               height = 20;
               defaultTextFormat = tf;
               filters = StaticValue.filter;
               textColor = 6052956;
               text = data.kungfuLv;
            }
            addChild(ft);
            if(data.jingmaiLvIsTop == "1")
            {
               bg = StaticValue.getBitmapByClassName("ui.party.list.bg");
               addChild(bg);
               bg.x = 345;
               bg.y = 2;
               bg.width = 73;
            }
            ft = new FTextArea();
            with(ft)
            {
               
               x = 345;
               y = 4;
               width = 73;
               height = 20;
               defaultTextFormat = tf;
               filters = StaticValue.filter;
               textColor = 6052956;
               text = data.jingmaiLv;
            }
            addChild(ft);
            if(data.chengjiuLvIsTop == "1")
            {
               bg = StaticValue.getBitmapByClassName("ui.party.list.bg");
               addChild(bg);
               bg.x = 418;
               bg.y = 2;
               bg.width = 73;
            }
            ft = new FTextArea();
            with(ft)
            {
               
               x = 418;
               y = 4;
               width = 73;
               height = 20;
               defaultTextFormat = tf;
               filters = StaticValue.filter;
               textColor = 6052956;
               text = data.chengjiuLv;
            }
            addChild(ft);
            if(data.shengwangIsTop == "1")
            {
               bg = StaticValue.getBitmapByClassName("ui.party.list.bg");
               addChild(bg);
               bg.x = 492;
               bg.y = 2;
               bg.width = 73;
            }
            ft = new FTextArea();
            with(ft)
            {
               
               x = 492;
               y = 4;
               width = 73;
               height = 20;
               defaultTextFormat = tf;
               filters = StaticValue.filter;
               textColor = 6052956;
               text = data.shengwang;
            }
            addChild(ft);
            if(data.bossIsTop == "1")
            {
               bg = StaticValue.getBitmapByClassName("ui.party.list.bg");
               addChild(bg);
               bg.x = 565;
               bg.y = 2;
               bg.width = 73;
            }
            ft = new FTextArea();
            with(ft)
            {
               
               x = 565;
               y = 4;
               width = 73;
               height = 20;
               defaultTextFormat = tf;
               filters = StaticValue.filter;
               textColor = 6052956;
               text = data.boss;
            }
            addChild(ft);
         }
      }
   }
}

