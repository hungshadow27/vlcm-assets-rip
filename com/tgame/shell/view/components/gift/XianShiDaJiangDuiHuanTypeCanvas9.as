package com.tgame.shell.view.components.gift
{
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.XianshiDajiangDuihuanPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class XianShiDaJiangDuiHuanTypeCanvas9 extends Sprite
   {
      
      private var _parent:DisplayObject;
      
      private var ft:FTextArea;
      
      private var tubiaoBg:Bitmap;
      
      private var icox:int;
      
      private var icoy:int;
      
      private var btn:SecondButton;
      
      private var obj1:DisplayObject;
      
      private var parm1:int;
      
      private var parm2:int;
      
      private var parm3:int;
      
      private var slotSpr:Sprite;
      
      private var item:ItemFace;
      
      public function XianShiDaJiangDuiHuanTypeCanvas9()
      {
         super();
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 5;
            y = 0;
            wordWrap = true;
            width = 480;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.ft);
         this.slotSpr = new Sprite();
         this.slotSpr.x = 480;
         this.slotSpr.y = 0;
         addChild(this.slotSpr);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         this._parent.dispatchEvent(new BaseEvent(XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_BTN_LINGQU,"",[this.parm1,this.parm2,int(param1.currentTarget.name)]));
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function SetInitialize(param1:int, param2:Array) : void
      {
         this.parm1 = param1;
         this.parm2 = param2[0];
         this.ft.htmlText = param2[2][0];
         while(this.slotSpr.numChildren > 0)
         {
            this.slotSpr.removeChildAt(0);
         }
         var _loc3_:int = 0;
         while(_loc3_ < param2[2][1].length)
         {
            this.tubiaoBg = StaticValue.getBitmapByClassName("ui.tiem.slot");
            this.slotSpr.addChild(this.tubiaoBg);
            this.tubiaoBg.x = _loc3_ % 2 * 45;
            this.tubiaoBg.y = int(_loc3_ / 2) * 70;
            this.item = new ItemFace(param2[2][1][_loc3_][0]);
            this.item.x = _loc3_ % 2 * 45 + 2;
            this.item.y = int(_loc3_ / 2) * 70 + 2;
            this.slotSpr.addChild(this.item);
            this.btn = new SecondButton();
            this.btn.label = param2[2][1][_loc3_][4];
            this.slotSpr.addChild(this.btn);
            this.btn.x = this.tubiaoBg.x - 3;
            this.btn.y = this.tubiaoBg.y + this.tubiaoBg.height + 2;
            this.btn.enabled = true;
            this.btn.name = String(param2[2][1][_loc3_][3]);
            this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
            _loc3_++;
         }
      }
   }
}

