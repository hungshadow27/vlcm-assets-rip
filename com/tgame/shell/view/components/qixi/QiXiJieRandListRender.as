package com.tgame.shell.view.components.qixi
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.text.TextFormat;
   
   public class QiXiJieRandListRender extends FListCellRenderer
   {
      
      internal var tf:TextFormat;
      
      public function QiXiJieRandListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var _loc1_:FTextArea = null;
         var _loc2_:FTextArea = null;
         var _loc3_:FTextArea = null;
         _height = 27;
         this.tf = new TextFormat();
         this.tf.align = "center";
         _loc1_ = new FTextArea();
         _loc1_.wordWrap = true;
         _loc1_.width = 130;
         _loc1_.height = 30;
         _loc1_.x = 5 + 2;
         _loc1_.y = 0;
         _loc1_.filters = StaticValue.filter;
         _loc1_.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'>" + data.mingci + "</font>";
         addChild(_loc1_);
         _loc2_ = new FTextArea();
         _loc2_.wordWrap = true;
         _loc2_.width = 130;
         _loc2_.height = 30;
         _loc2_.x = 10 + 38;
         _loc2_.y = 0;
         _loc2_.filters = StaticValue.filter;
         _loc2_.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'>" + data.name + "</font>";
         addChild(_loc2_);
         _loc3_ = new FTextArea();
         _loc3_.wordWrap = true;
         _loc3_.width = 92;
         _loc3_.height = 30;
         _loc3_.defaultTextFormat = this.tf;
         _loc3_.x = 130 + 23;
         _loc3_.y = 0;
         _loc3_.filters = StaticValue.filter;
         _loc3_.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'>" + data.cishu + "</font>";
         addChild(_loc3_);
      }
   }
}

