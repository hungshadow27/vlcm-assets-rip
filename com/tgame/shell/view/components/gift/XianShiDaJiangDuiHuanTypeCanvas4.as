package com.tgame.shell.view.components.gift
{
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.XianshiDajiangDuihuanPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class XianShiDaJiangDuiHuanTypeCanvas4 extends Sprite
   {
      
      private var _parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var line:Bitmap;
      
      private var progressBar:ColorBar;
      
      private var slotBit:Bitmap;
      
      private var btn:SecondButton;
      
      private var parm1:int;
      
      private var parm2:int;
      
      private var parm3:int;
      
      private var item:ItemFace;
      
      private var icox:int;
      
      private var icoy:int;
      
      public function XianShiDaJiangDuiHuanTypeCanvas4()
      {
         super();
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 120;
            y = 5;
            wordWrap = true;
            width = 560;
            autoSize = TextFieldAutoSize.LEFT;
            htmlText = "<textformat leading=\'10\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,0) + "</font>" + "</textformat>";
         }
         addChild(this.ft);
         this.line = StaticValue.getBitmapByClassName("ui.kungfu.exp.bg");
         addChild(this.line);
         this.line.x = 67;
         this.line.y = this.ft.y + this.ft.height;
         this.line.width = 200;
         this.progressBar = new ColorBar(5,190,5);
         addChild(this.progressBar);
         this.progressBar.x = 72;
         this.progressBar.y = this.ft.y + this.ft.height + 3;
         this.progressBar.setValue(1,1);
         this.slotBit = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.slotBit);
         this.slotBit.x = 290;
         this.slotBit.y = 10;
         this.icox = this.slotBit.x;
         this.icoy = this.slotBit.y;
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanCommonTextWords("点此领取");
         addChild(this.btn);
         this.btn.x = this.slotBit.x + this.slotBit.width + 5;
         this.btn.y = this.slotBit.y + this.slotBit.height / 2 - 10;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               this._parent.dispatchEvent(new BaseEvent(XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_BTN_LINGQU,"",[this.parm1,this.parm2,this.parm3]));
         }
      }
      
      public function SetInitialize(param1:int, param2:Array) : void
      {
         this.parm1 = param1;
         this.parm2 = param2[0];
         this.parm3 = param2[2][3];
         this.progressBar.setValue(param2[2][0][0],param2[2][0][1]);
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param2[2][1]);
         this.item.x = this.icox + 2;
         this.item.y = this.icoy + 2;
         addChild(this.item);
         if(param2[2][2])
         {
            this.btn.enabled = true;
            this.btn.label = param2[2][4];
         }
         else
         {
            this.btn.enabled = false;
            this.btn.label = LanResManager.getLanCommonTextWords("全部已领");
         }
      }
   }
}

