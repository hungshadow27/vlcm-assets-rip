package com.tgame.shell.view.components.shitu
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class GetExpJiangLiListRender extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      public function GetExpJiangLiListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var ft:FTextArea;
         var btn:SmallButton;
         var tf1:TextFormat;
         var tf:TextFormat = new TextFormat();
         tf.align = "center";
         ft = new FTextArea();
         with(ft)
         {
            x = 0;
            y = 4;
            width = 135;
            height = 18;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
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
            x = 95;
            y = 4;
            width = 100;
            height = 18;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            text = data.level;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 110;
            y = 4;
            width = 200;
            height = 18;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            text = data.exp;
         }
         addChild(ft);
         ft = new FTextArea();
         with(ft)
         {
            x = 178;
            y = 4;
            width = 200;
            height = 18;
            defaultTextFormat = tf;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            text = data.sw;
         }
         addChild(ft);
         btn = new SmallButton();
         tf1 = new TextFormat();
         tf1.align = "center";
         tf1.size = 10;
         btn.textFormat = tf1;
         with(btn)
         {
            x = 302;
            y = 2;
            label = LanResManager.getLanCommonTextWords("领取");
         }
         addChild(btn);
         btn.addEventListener(MouseEvent.CLICK,this.onChick);
      }
      
      private function onChick(param1:MouseEvent) : void
      {
         $parent.dispatchEvent(new BaseEvent(getExpJiangLiPanel.UI_EGTEXPJIANGLIPANEL_LINGQU_BTN,"",int(data.id)));
      }
   }
}

