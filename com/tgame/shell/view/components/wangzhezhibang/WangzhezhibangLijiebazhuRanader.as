package com.tgame.shell.view.components.wangzhezhibang
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.DisplayObject;
   
   public class WangzhezhibangLijiebazhuRanader extends FListCellRenderer
   {
      
      public function WangzhezhibangLijiebazhuRanader()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var _loc1_:FTextArea = null;
         _height = 28;
         _loc1_ = new FTextArea();
         _loc1_.x = 25;
         _loc1_.y = 8;
         _loc1_.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + data.index + "</font>";
         _loc1_.width = 50;
         addChild(_loc1_);
         _loc1_ = new FTextArea();
         _loc1_.x = 90;
         _loc1_.y = 8;
         _loc1_.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + data.time + "</font>";
         _loc1_.width = 80;
         addChild(_loc1_);
         var _loc2_:int = int(data.pingtaiID);
         if(_loc2_ != 106 || _loc2_ != 110 || _loc2_ != 111)
         {
            _loc2_ = 106;
         }
         var _loc3_:DisplayObject = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/biwudahuiKPT/" + data.pingtaiID + "_small.png",30,30);
         if(_loc3_)
         {
            _loc3_.x = 170;
            _loc3_.y = 0;
            addChild(_loc3_);
         }
         _loc1_ = new FTextArea();
         _loc1_.x = 205;
         _loc1_.y = 8;
         _loc1_.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + data.name + "</font>";
         _loc1_.width = 135;
         addChild(_loc1_);
         _loc1_ = new FTextArea();
         _loc1_.x = 360;
         _loc1_.y = 8;
         _loc1_.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + data.playerName + "</font>";
         _loc1_.width = 135;
         addChild(_loc1_);
      }
   }
}

