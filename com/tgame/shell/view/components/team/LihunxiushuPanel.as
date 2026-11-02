package com.tgame.shell.view.components.team
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FCanvas;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.TeamPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class LihunxiushuPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var tipCanvas:FCanvas;
      
      private var btn1:SecondButton;
      
      private var btn2:SecondButton;
      
      private var btn3:SecondButton;
      
      public function LihunxiushuPanel()
      {
         var csft:FTextArea;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         this.dragRestrict = false;
         width = 350;
         height = 290;
         titleText = LanResManager.getLanCommonTextWords("离婚休书");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "box";
         this.tipCanvas.x = 10;
         this.tipCanvas.y = 2;
         this.tipCanvas.width = 330;
         this.tipCanvas.height = 212;
         addChild(this.tipCanvas);
         csft = new FTextArea();
         with(csft)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 15;
            y = 10;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'3\'>" + LanResManager.getLanTextWords(this,"您希望解除当前的夫妻关系吗协议休书会向对方发出一纸休书需对方",[StaticValue.RED_HTML,StaticValue.YELLOW_HTML,StaticValue.WHITE_HTML,StaticValue.WHITE_HTML,StaticValue.WHITE_HTML,StaticValue.YELLOW_HTML,StaticValue.WHITE_HTML,StaticValue.WHITE_HTML,StaticValue.YELLOW_HTML,StaticValue.WHITE_HTML,StaticValue.WHITE_HTML]) + "</textformat>";
         }
         addChild(csft);
         this.btn1 = new SecondButton();
         this.btn1.label = LanResManager.getLanTextWords(this,"发送协议休书");
         addChild(this.btn1);
         this.btn1.x = 40;
         this.btn1.y = 225;
         this.btn1.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.btn2 = new SecondButton();
         this.btn2.label = LanResManager.getLanTextWords(this,"立即强制离婚");
         addChild(this.btn2);
         this.btn2.x = this.btn1.x + this.btn1.width + 10;
         this.btn2.y = 225;
         this.btn2.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
         this.btn3 = new SecondButton();
         this.btn3.label = LanResManager.getLanCommonTextWords("取消");
         addChild(this.btn3);
         this.btn3.x = this.btn2.x + this.btn2.width + 10;
         this.btn3.y = 225;
         this.btn3.addEventListener(MouseEvent.MOUSE_UP,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn1:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_LIHUNXIUSHU_FASONGXIEYIXIUSHU_CLICK));
               break;
            case this.btn2:
               this.$parent.dispatchEvent(new BaseEvent(TeamPanel.UI_LIHUNXIUSHU_QIANGZHILIHUN_CLICK));
               break;
            case this.btn3:
               this.onClose();
         }
      }
   }
}

