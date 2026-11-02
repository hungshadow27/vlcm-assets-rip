package com.tgame.shell.view.components.qishazhen
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.skin.ShiWuTianYouHuiSkin;
   import game.utils.SkinTools;
   
   public class ShiWuTianYouHuiPanel extends BasePanel
   {
      
      private var arr:Array;
      
      private var curType:int = 0;
      
      public function ShiWuTianYouHuiPanel()
      {
         var _loc2_:int = 0;
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         super();
         this.skin = SkinTools.getChildSkinByName(ShiWuTianYouHuiSkin.skin,"zhoumorenaohuodong");
         this.arr = [[[729328,1],[727702,1],[727713,1],[728608,1]],[[727823,3000],[728758,10],[729328,1]],[[728608,2],[730236,10]],[[730236,10],[730237,1]],[[729199,2],[730237,1]],[[729209,2],[730237,2]],[[728938,2],[730237,2]],[[730274,1],[730354,50]],[[730274,1],[730336,1]]];
         var _loc1_:int = 0;
         while(_loc1_ < this.arr.length)
         {
            _loc2_ = 0;
            while(_loc2_ < this.arr[_loc1_].length)
            {
               _loc3_ = new Goods(this.arr[_loc1_][_loc2_][0]);
               _loc3_.count = this.arr[_loc1_][_loc2_][1];
               _loc4_ = new ItemFace(_loc3_);
               _loc4_.x = _loc2_ * 65 + 39;
               _loc4_.y = _loc1_ * 76 + 251;
               this.addChild(_loc4_);
               _loc2_++;
            }
            _loc1_++;
         }
         this.init();
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben2",this,true).attr("text",param1 + "");
      }
      
      private function init() : void
      {
         $("lingqu1 lingqu2 lingqu3 lingqu4 lingqu5 lingqu6 lingqu7 lingqu8 lingqu9",this,true).click(this.clickHanlder);
         $("guanbi",this,true).click(this.onClick);
      }
      
      public function setType(param1:int) : void
      {
         this.curType = param1;
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("u");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[231,uint(_loc2_[1])]);
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         if(this.parent)
         {
            this.parent.removeChild(this);
         }
      }
   }
}

