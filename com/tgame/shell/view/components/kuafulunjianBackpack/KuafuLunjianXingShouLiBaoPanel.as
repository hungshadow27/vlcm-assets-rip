package com.tgame.shell.view.components.kuafulunjianBackpack
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.KuafuLunjianBackpack;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class KuafuLunjianXingShouLiBaoPanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      private var lv:FLabel;
      
      private var slots:Sprite;
      
      private var copper:FLabel;
      
      private var lijin:FLabel;
      
      private var tip:FLabel;
      
      private var btn:SecondButton;
      
      public function KuafuLunjianXingShouLiBaoPanel()
      {
         var img:Bitmap;
         var fb:FLabel;
         super();
         skin = "panel_btn";
         dragAble = false;
         showCloseButton = true;
         width = 210;
         height = 298;
         titleText = LanResManager.getLanCommonTextWords("傲剑有礼");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         img = StaticValue.getBitmapByClassName("ui.aojianyouli.ui");
         addChild(img);
         img.x = 10;
         img.y = 2;
         fb = new FLabel();
         with(fb)
         {
            x = 12;
            y = 6;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("打开等级：");
         }
         addChild(fb);
         this.lv = new FLabel();
         with(this.lv)
         {
            x = 76;
            y = 6;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("打开等级：");
         }
         addChild(this.lv);
         this.slots = new Sprite();
         addChild(this.slots);
         with(this.slots)
         {
            x = 31;
            y = 36;
            graphics.beginFill(4095,0);
            graphics.drawRect(0,0,149,111);
            graphics.endFill();
         }
         fb = new FLabel();
         with(fb)
         {
            x = 38;
            y = 157;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("铜钱：");
         }
         addChild(fb);
         fb = new FLabel();
         with(fb)
         {
            x = 38;
            y = 180;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("礼金：");
         }
         addChild(fb);
         img = StaticValue.getBitmapByClassName("ui.ico.money.copper");
         addChild(img);
         img.x = 76;
         img.y = 157;
         img = StaticValue.getBitmapByClassName("ui.ico.money.silver");
         addChild(img);
         img.x = 76;
         img.y = 180;
         this.copper = new FLabel();
         with(this.copper)
         {
            x = 105;
            y = 157;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("礼金：");
         }
         addChild(this.copper);
         this.lijin = new FLabel();
         with(this.lijin)
         {
            x = 105;
            y = 180;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("礼金：");
         }
         addChild(this.lijin);
         this.tip = new FLabel();
         with(this.tip)
         {
            x = 40;
            y = 203;
            textColor = StaticValue.RED;
            filters = StaticValue.filter;
            text = LanResManager.getLanTextWords(this,"很报歉");
         }
         addChild(this.tip);
         this.btn = new SecondButton();
         this.btn.label = LanResManager.getLanCommonTextWords("打开礼包");
         addChild(this.btn);
         this.btn.x = (width - this.btn.width) / 2;
         this.btn.y = 234;
         this.btn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
         this.$parent.dispatchEvent(new BaseEvent(KuafuLunjianBackpack.UI_KUAFULUNJIAN_XINSHOULIBAO_OPEN));
      }
      
      private function initItem(param1:Array) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc5_:ItemFace = null;
         while(this.slots.numChildren > 0)
         {
            this.slots.removeChildAt(0);
         }
         var _loc4_:int = int(param1.length);
         _loc2_ = 0;
         loop1:
         while(_loc2_ < 3)
         {
            _loc3_ = 0;
            while(_loc3_ < 4)
            {
               if(_loc2_ * 4 + _loc3_ == _loc4_)
               {
                  break loop1;
               }
               _loc5_ = new ItemFace(param1[_loc2_ * 4 + _loc3_]);
               this.slots.addChild(_loc5_);
               _loc5_.x = _loc3_ * 38;
               _loc5_.y = _loc2_ * 38;
               _loc3_++;
            }
            _loc2_++;
         }
      }
      
      public function setItem(param1:int, param2:Array, param3:int, param4:int, param5:Boolean) : void
      {
         this.lv.text = param1.toString();
         this.initItem(param2);
         this.copper.text = param3.toString();
         this.lijin.text = param4.toString();
         if(param5)
         {
            this.tip.visible = false;
            this.btn.enabled = true;
         }
         else
         {
            this.tip.visible = true;
            this.btn.enabled = false;
         }
      }
   }
}

