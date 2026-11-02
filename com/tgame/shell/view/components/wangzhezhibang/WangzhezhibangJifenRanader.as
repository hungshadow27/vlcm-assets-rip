package com.tgame.shell.view.components.wangzhezhibang
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import flash.display.DisplayObject;
   
   public class WangzhezhibangJifenRanader extends FListCellRenderer
   {
      
      public function WangzhezhibangJifenRanader()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var _loc1_:DisplayObject = null;
         var _loc2_:FTextArea = null;
         var _loc3_:DisplayObject = null;
         _height = 30;
         if(int(data.index) % 2 == 0)
         {
            _loc1_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/jifen_qian.swf");
         }
         else
         {
            _loc1_ = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/wangzhezhibang/jifen_shen.swf");
         }
         _loc1_.x = 0;
         addChild(_loc1_);
         _loc2_ = new FTextArea();
         _loc2_.x = 12;
         _loc2_.y = 2;
         _loc2_.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + data.index + "</font>";
         _loc2_.width = 50;
         addChild(_loc2_);
         _loc3_ = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/biwudahuiKPT/" + data.pingtaiID + "_small.png",30,30);
         if(_loc3_)
         {
            _loc3_.x = 30;
            _loc3_.y = 0;
            addChild(_loc3_);
         }
         _loc2_ = new FTextArea();
         _loc2_.x = 60;
         _loc2_.y = 2;
         _loc2_.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + data.name + "</font>";
         _loc2_.width = 135;
         addChild(_loc2_);
         _loc2_ = new FTextArea();
         _loc2_.x = 175;
         _loc2_.y = 2;
         _loc2_.htmlText = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + data.count + "</font>";
         _loc2_.width = 135;
         addChild(_loc2_);
      }
   }
}

