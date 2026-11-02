package com.tgame.shell.view.components.team
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.TeamPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class XinzengqingyuListRender extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      private var pkBtn:FSimpleButton;
      
      public function XinzengqingyuListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var ft:FTextArea;
         var tf:TextFormat = new TextFormat();
         tf.align = "left";
         ft = new FTextArea();
         with(ft)
         {
            defaultTextFormat = tf;
            x = 8;
            y = 2;
            width = 140;
            wordWrap = true;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = "   ";
         }
         if(data.color == 2)
         {
            ft.htmlText = "   <font color=\'" + StaticValue.GREEN_HTML + "\'>【" + data.time + "】" + LanResManager.getLanTextWords(this,"TA说") + "：</font>" + data.content;
         }
         else if(data.color == 1)
         {
            ft.htmlText = "   <font color=\'" + StaticValue.BLUE_HTML + "\'>【" + data.time + "】" + LanResManager.getLanTextWords(this,"您说") + "：</font>" + data.content;
         }
         addChild(ft);
         this.pkBtn = new FSimpleButton();
         this.pkBtn.skin = "closeButton";
         addChild(this.pkBtn);
         this.pkBtn.x = 2;
         this.pkBtn.y = 2;
         this.pkBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         _height = ft.height;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.pkBtn:
               $parent.dispatchEvent(new BaseEvent(TeamPanel.UI_XINZENGXINYUPANEL_DELECT_XINZENG,"",data.id));
         }
      }
   }
}

