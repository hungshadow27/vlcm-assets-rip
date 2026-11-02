package com.tgame.shell.view.components
{
   import com.fireice.panel.FCanvas;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class HuaYuShuoMingCanvas extends Sprite
   {
      
      private var bgCanvas:FCanvas;
      
      private var neirong:FTextArea;
      
      private var bg1:DisplayObject;
      
      public function HuaYuShuoMingCanvas()
      {
         var _loc1_:FTextArea = null;
         var _loc2_:FTextArea = null;
         super();
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/qingrenjiexianhua/huayubg.swf");
         this.bg1.x = 2;
         this.bg1.y = 2;
         addChild(this.bg1);
         this.neirong = new FTextArea();
         addChild(this.neirong);
         this.neirong.multiline = true;
         this.neirong.wordWrap = true;
         this.neirong.width = 200 + 30 + 30 - 15;
         this.neirong.height = 120;
         this.neirong.x = 15 + 10 - 5;
         this.neirong.y = 42 + 10 - 5 - 10 + 30 - 5;
         this.neirong.htmlText = "<font size = \'16\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("520朵") + "<br>" + LanResManager.getLanCommonTextWords("999朵") + "<br>" + LanResManager.getLanCommonTextWords("1314朵") + "</font>";
         _loc1_ = new FTextArea();
         addChild(_loc1_);
         _loc1_.multiline = true;
         _loc1_.wordWrap = true;
         _loc1_.width = 200 + 30 + 30 - 15;
         _loc1_.height = 120;
         _loc1_.x = 15 + 150 - 20 - 8;
         _loc1_.y = 42 + 10 - 5 - 10 + 30 - 5;
         _loc1_.htmlText = "<font size = \'16\' color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("我爱你") + "<br>" + LanResManager.getLanCommonTextWords("999朵花语描述") + "<br>" + LanResManager.getLanCommonTextWords("一生一世") + "</font>";
         _loc2_ = new FTextArea();
         addChild(_loc2_);
         _loc2_.multiline = true;
         _loc2_.wordWrap = true;
         _loc2_.width = 200 + 30 + 30 - 15 + 30;
         _loc2_.height = 120;
         _loc2_.x = 15 - 3;
         _loc2_.y = 42 + 10 - 5 - 10 + 166 + 16 - 90;
         _loc2_.htmlText = "<font  color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("注：单次赠送以上数量的鲜花，会有意外惊喜哦") + "</font>";
      }
   }
}

