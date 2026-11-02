package com.tgame.moudels.login.view.compoents.ui
{
   import com.fireice.list.FListCellRenderer;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.utils.getDefinitionByName;
   
   public class CreateCharListRender extends FListCellRenderer
   {
      
      public var mcSelected:MovieClip;
      
      public function CreateCharListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var _loc1_:String = null;
         var _loc4_:String = null;
         _height = 67;
         _loc1_ = "ui.login.chuangjian." + data.name + ".txt";
         var _loc2_:Bitmap = StaticValue.getBitmapByClassName(_loc1_);
         addChild(_loc2_);
         _loc2_.x = 0;
         _loc2_.y = 50;
         var _loc3_:Class = getDefinitionByName("ui.login.rolelist.selected") as Class;
         this.mcSelected = new _loc3_() as MovieClip;
         this.mcSelected.stop();
         this.mcSelected.visible = false;
         this.mcSelected.x = 50;
         this.mcSelected.y = 50;
         this.mcSelected.mouseEnabled = false;
         addChildAt(this.mcSelected,numChildren - 2);
         _loc4_ = "ui.login.chuangjian.touxiang." + data.name;
         _loc2_ = StaticValue.getBitmapByClassName(_loc4_);
         addChildAt(_loc2_,numChildren - 1);
         _loc2_.x = -13;
         _loc2_.y = -31;
      }
      
      public function showMC(param1:Boolean = true) : void
      {
         if(this.mcSelected)
         {
            if(param1)
            {
               this.mcSelected.play();
            }
            else
            {
               this.mcSelected.stop();
            }
            this.mcSelected.visible = param1;
         }
      }
   }
}

