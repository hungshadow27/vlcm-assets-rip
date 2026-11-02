package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Sprite;
   
   public class ButtonContainer extends Sprite
   {
      
      public var shuanxiu:FSimpleButton;
      
      public var guaji:FSimpleButton;
      
      public var biguan:FSimpleButton;
      
      public var xinfa:FSimpleButton;
      
      public var liaoshang:FSimpleButton;
      
      public function ButtonContainer()
      {
         super();
         this.shuanxiu = new FSimpleButton();
         this.shuanxiu.skin = "shuangxiuButton";
         this.shuanxiu.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"进入双人同时打坐修炼状态") + "</font>";
         addChild(this.shuanxiu);
         this.xinfa = new FSimpleButton();
         this.xinfa.skin = "xinfaButton";
         addChild(this.xinfa);
         this.xinfa.x = this.shuanxiu.x + this.shuanxiu.width + 10;
         this.liaoshang = new FSimpleButton();
         this.liaoshang.skin = "liangshangButton";
         addChild(this.liaoshang);
         this.liaoshang.x = this.xinfa.x + this.xinfa.width + 10;
         this.guaji = new FSimpleButton();
         this.guaji.skin = "guajiButton";
         this.guaji.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"进入在线自动挂机战斗状态") + "</font>";
         addChild(this.guaji);
         this.guaji.x = this.liaoshang.x + this.liaoshang.width + 10;
         this.biguan = new FSimpleButton();
         this.biguan.skin = "biguanButton";
         this.biguan.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"领取您的闭关收益") + "</font>";
         addChild(this.biguan);
         this.biguan.x = this.guaji.x + this.guaji.width + 10;
      }
      
      public function setType(param1:Boolean) : void
      {
         this.shuanxiu.enabled = !param1;
         this.xinfa.enabled = !param1;
         this.liaoshang.enabled = !param1;
      }
   }
}

