package com.tgame.shell.view.components.qishazhen
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.skin.JingYingLeiJiSkin;
   import game.utils.SkinTools;
   
   public class JingYingLeiJiPanel extends BasePanel
   {
      
      private var arr:Array;
      
      private var curType:int = 0;
      
      public function JingYingLeiJiPanel()
      {
         var _loc2_:int = 0;
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         super();
         this.skin = SkinTools.getChildSkinByName(JingYingLeiJiSkin.skin,"zhoumorenaohuodong");
         this.arr = [[[725564,1],[727702,1],[727713,1],[728608,1]],[[713852,10],[733948,1]],[[713852,10],[733948,1]],[[713852,20],[733948,2]],[[713852,20],[733948,2]],[[713852,40],[733948,4]],[[713852,80],[733948,10]]];
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
         $("lingqu1 lingqu2 lingqu3 lingqu4 lingqu5 lingqu6 lingqu7",this,true).click(this.clickHanlder);
         $("guanbi",this,true).click(this.onClick);
      }
      
      public function setType(param1:int) : void
      {
         this.curType = param1;
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("u");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[this.curType,uint(_loc2_[1])]);
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

