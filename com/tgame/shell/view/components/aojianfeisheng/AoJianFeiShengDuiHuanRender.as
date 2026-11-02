package com.tgame.shell.view.components.aojianfeisheng
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class AoJianFeiShengDuiHuanRender extends Sprite
   {
      
      public var $parent:DisplayObject;
      
      private var miaoShu:FTextArea;
      
      private var shuoming:FTextArea;
      
      private var btnLingQu:SecondButton;
      
      private var currIndex:int = 0;
      
      public function AoJianFeiShengDuiHuanRender()
      {
         var _loc1_:FCanvas = null;
         var _loc2_:TextFormat = null;
         super();
         _loc1_ = new FCanvas();
         _loc1_.skin = "menuBg";
         _loc1_.width = 120;
         _loc1_.height = 80;
         addChild(_loc1_);
         _loc2_ = new TextFormat();
         _loc2_.align = "center";
         this.miaoShu = new FTextArea();
         this.miaoShu.width = 120;
         this.miaoShu.defaultTextFormat = _loc2_;
         this.miaoShu.textColor = StaticValue.YELLOW;
         this.miaoShu.filters = StaticValue.filter;
         this.miaoShu.y = 10;
         this.miaoShu.mouseEnabled = false;
         this.miaoShu.wordWrap = true;
         this.miaoShu.multiline = true;
         addChild(this.miaoShu);
         this.shuoming = new FTextArea();
         this.shuoming.width = 120;
         this.shuoming.defaultTextFormat = _loc2_;
         this.shuoming.textColor = StaticValue.YELLOW;
         this.shuoming.filters = StaticValue.filter;
         this.shuoming.y = 60;
         this.shuoming.mouseEnabled = false;
         addChild(this.shuoming);
         this.btnLingQu = new SecondButton();
         this.btnLingQu.label = "飞升经验丹*1（领取）";
         this.btnLingQu.x = -10;
         this.btnLingQu.y = 95;
         addChild(this.btnLingQu);
         this.btnLingQu.addEventListener(MouseEvent.CLICK,this.onClickLingQuHandler);
      }
      
      private function onClickLingQuHandler(param1:MouseEvent) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(AoJianFeiShengPanel.AOJIANFEISHENG_LINGQU_CLICK,"",this.currIndex));
      }
      
      public function setData(param1:Object) : void
      {
         this.miaoShu.text = param1.miaoShu;
         this.shuoming.text = param1.shuoming;
         this.currIndex = param1.index;
      }
      
      public function setButtonEnabled(param1:Boolean) : void
      {
         this.btnLingQu.enabled = param1;
      }
   }
}

