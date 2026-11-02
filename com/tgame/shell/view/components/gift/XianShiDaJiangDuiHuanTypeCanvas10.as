package com.tgame.shell.view.components.gift
{
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.XianshiDajiangDuihuanPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class XianShiDaJiangDuiHuanTypeCanvas10 extends Sprite
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
      
      public function XianShiDaJiangDuiHuanTypeCanvas10()
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
         this.tubiaoBg = StaticValue.getBitmapByClassName("ui.tiem.slot.big");
         this.tubiaoBg.x = 490;
         this.tubiaoBg.y = 0;
         addChild(this.tubiaoBg);
         this.icox = this.tubiaoBg.x;
         this.icoy = this.tubiaoBg.y;
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanCommonTextWords("领取奖励");
         addChild(this.btn);
         this.btn.x = this.tubiaoBg.x;
         this.btn.y = this.tubiaoBg.y + this.tubiaoBg.height + 2;
         this.btn.enabled = true;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               this._parent.dispatchEvent(new BaseEvent(XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_BTN_GOUMAI,"",[this.parm1,this.parm2,this.parm3]));
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function SetInitialize(param1:int, param2:Array) : void
      {
         this.parm1 = param1;
         this.parm2 = param2[0];
         this.parm3 = param2[2][3];
         this.ft.htmlText = param2[2][2];
         if(param2[2][1])
         {
            this.btn.enabled = true;
            this.btn.label = param2[2][4];
         }
         else
         {
            this.btn.enabled = false;
            this.btn.label = param2[2][4];
         }
         if(this.obj1 != null && this.obj1.parent != null)
         {
            this.obj1.parent.removeChild(this.obj1);
         }
         this.obj1 = FLoader.startLoad(param2[2][0],65,65);
         addChild(this.obj1);
         this.obj1.x = this.icox + 2;
         this.obj1.y = this.icoy + 2;
      }
   }
}

