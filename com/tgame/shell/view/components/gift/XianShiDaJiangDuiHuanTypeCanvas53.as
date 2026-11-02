package com.tgame.shell.view.components.gift
{
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.*;
   
   public class XianShiDaJiangDuiHuanTypeCanvas53 extends Sprite
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
      
      private var item:ItemFace;
      
      public function XianShiDaJiangDuiHuanTypeCanvas53()
      {
         super();
         this.tubiaoBg = StaticValue.getBitmapByClassName("ui.tiem.slot");
         addChild(this.tubiaoBg);
         this.tubiaoBg.x = 525;
         this.tubiaoBg.y = 0;
         this.icox = this.tubiaoBg.x;
         this.icoy = this.tubiaoBg.y;
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 5;
            y = 0;
            wordWrap = true;
            width = 520;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            htmlText = "";
         }
         addChild(this.ft);
      }
      
      public function SetInitialize(param1:int, param2:Array) : void
      {
         this.parm1 = param1;
         this.parm2 = param2[0];
         this.ft.htmlText = param2[2][1];
         if(this.item != null && this.item.parent != null)
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(param2[2][0]);
         this.item.x = this.icox + 2;
         this.item.y = this.icoy + 2;
         addChild(this.item);
      }
   }
}

