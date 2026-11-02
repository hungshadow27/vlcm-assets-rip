package com.tgame.shell.view.components.aojianfeisheng
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class AoJianFeiShengPanelRender extends Sprite
   {
      
      private var miaoShu:FTextArea;
      
      private var pro:FTextArea;
      
      private var shuoming:FTextArea;
      
      public function AoJianFeiShengPanelRender()
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
         this.miaoShu.textColor = StaticValue.GREEN;
         this.miaoShu.filters = StaticValue.filter;
         this.miaoShu.y = 10;
         this.miaoShu.mouseEnabled = false;
         addChild(this.miaoShu);
         this.pro = new FTextArea();
         this.pro.width = 120;
         this.pro.defaultTextFormat = _loc2_;
         this.pro.textColor = StaticValue.YELLOW;
         this.pro.filters = StaticValue.filter;
         this.pro.y = 28;
         this.pro.mouseEnabled = false;
         addChild(this.pro);
         this.shuoming = new FTextArea();
         this.shuoming.width = 120;
         this.shuoming.defaultTextFormat = _loc2_;
         this.shuoming.textColor = StaticValue.GREEN;
         this.shuoming.filters = StaticValue.filter;
         this.shuoming.y = 46;
         this.shuoming.mouseEnabled = false;
         addChild(this.shuoming);
      }
      
      public function setData(param1:Object) : void
      {
         this.miaoShu.text = param1.misohu;
         if(param1.currPro >= param1.totalPro)
         {
            param1.currPro = param1.totalPro;
         }
         this.pro.text = param1.currPro + "/" + param1.totalPro;
         this.shuoming.text = param1.shuoming;
      }
   }
}

