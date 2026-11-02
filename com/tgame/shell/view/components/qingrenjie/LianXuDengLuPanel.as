package com.tgame.shell.view.components.qingrenjie
{
   import com.asQuery.$;
   import com.tgame.common.ui.componets.BasePanel;
   import flash.events.MouseEvent;
   import game.display.ScrollBar;
   import game.skin.LianXuDengLuSkin;
   import game.utils.SkinTools;
   
   public class LianXuDengLuPanel extends BasePanel
   {
      
      private var scrollBar:ScrollBar;
      
      public function LianXuDengLuPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(LianXuDengLuSkin.skin,"lianxudenglu");
         $("YBZLGBAN",this,true).click(this.onClick);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
      
      override protected function createVariableReference() : void
      {
         var _loc1_:LianXuDengLuContent = new LianXuDengLuContent();
         addChild(_loc1_);
         this.scrollBar = getChildByName("huatiao") as ScrollBar;
         this.scrollBar.target = _loc1_;
      }
   }
}

import com.asQuery.$;
import com.tgame.PipeConstants;
import com.tgame.common.ui.componets.BasePanel;
import com.tgame.common.ui.componets.ItemFace;
import com.tgame.common.vo.item.Goods;
import com.tgame.manager.PipeManager;
import flash.events.MouseEvent;
import game.skin.LianXuDengLuSkin;
import game.utils.SkinTools;

class LianXuDengLuContent extends BasePanel
{
   
   public var arr:Array = [[[729843,5],[723919,1],[728886,10]],[[729843,5],[723930,1],[727823,800]],[[729843,5],[723941,1],[40289,9999]],[[729843,5],[723952,1],[723468,50]],[[729089,10]],[[729843,5],[724532,1],[60836,1]],[[729843,5],[724543,1],[728758,50]],[[729843,5],[724554,1],[728608,1]],[[729843,5],[724565,1],[725564,1]],[[723896,9]],[[729843,5],[42756,200],[728633,1]],[[729843,5],[44936,200],[728633,1]],[[729843,5],[727821,100],[728522,10]],[[729843,5],[727589,20],[728085,1000]],[[712649,50]]];
   
   public function LianXuDengLuContent()
   {
      var _loc2_:int = 0;
      var _loc3_:Goods = null;
      var _loc4_:ItemFace = null;
      super();
      this.skin = SkinTools.getChildSkinByName(LianXuDengLuSkin.skin,"neirong");
      $("^DFZQLQAN[0-9]{1,2}",this,true).click(this.onClickHandler);
      var _loc1_:int = 0;
      while(_loc1_ < this.arr.length)
      {
         _loc2_ = 0;
         while(_loc2_ < this.arr[_loc1_].length)
         {
            _loc3_ = new Goods(this.arr[_loc1_][_loc2_][0]);
            _loc3_.count = this.arr[_loc1_][_loc2_][1];
            _loc4_ = new ItemFace(_loc3_);
            if(_loc1_ == 4 || _loc1_ == 9 || _loc1_ == 14)
            {
               _loc4_.x = _loc2_ * 63 + 206;
            }
            else
            {
               _loc4_.x = _loc2_ * 63 + 143;
            }
            _loc4_.y = _loc1_ * 41 + 6;
            addChild(_loc4_);
            _loc2_++;
         }
         _loc1_++;
      }
   }
   
   private function onClickHandler(param1:MouseEvent) : void
   {
      var _loc2_:Array = String(param1.target.name).split("N");
      PipeManager.sendMsg(PipeConstants.SEND_53099,[219,uint(_loc2_[1])]);
   }
}
