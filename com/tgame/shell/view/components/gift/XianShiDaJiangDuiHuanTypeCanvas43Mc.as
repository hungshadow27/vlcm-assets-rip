package com.tgame.shell.view.components.gift
{
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.XianshiDajiangDuihuanPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class XianShiDaJiangDuiHuanTypeCanvas43Mc extends Sprite
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
      
      private var tishi:String;
      
      private var contentSpr:Sprite;
      
      public function XianShiDaJiangDuiHuanTypeCanvas43Mc()
      {
         super();
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 5;
            y = 0;
            wordWrap = true;
            width = 550;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.ft);
         this.contentSpr = new Sprite();
         this.contentSpr.x = 430;
         this.contentSpr.y = 0;
         addChild(this.contentSpr);
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanCommonTextWords("领取奖励");
         addChild(this.btn);
         this.btn.x = 490;
         this.btn.y = 30;
         this.btn.enabled = true;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btn:
               this._parent.dispatchEvent(new BaseEvent(XianshiDajiangDuihuanPanel.UI_GIFTPANEL_XIANSHIDAJIANGDUIHUAN_BTN_LINGQU,"",[this.parm1,this.parm2,this.parm3,this.tishi]));
         }
      }
      
      public function set $parent(param1:DisplayObject) : void
      {
         this._parent = param1;
      }
      
      public function SetInitialize(param1:int, param2:Array) : void
      {
         var _loc3_:ItemFace = null;
         var _loc4_:Bitmap = null;
         this.parm1 = param1;
         this.parm2 = param2[0];
         this.parm3 = param2[2][3];
         this.ft.htmlText = param2[2][2];
         this.contentSpr.y = this.ft.y + this.ft.height;
         this.btn.y = this.ft.y + this.ft.height + 20;
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
         this.tishi = param2[2][5];
         while(this.contentSpr.numChildren > 0)
         {
            this.contentSpr.removeChildAt(0);
         }
         var _loc5_:int = 0;
         while(_loc5_ < param2[2][0].length)
         {
            _loc3_ = new ItemFace(param2[2][0][_loc5_]);
            _loc3_.x = _loc5_ * -40;
            this.contentSpr.addChild(_loc3_);
            _loc5_++;
         }
      }
   }
}

