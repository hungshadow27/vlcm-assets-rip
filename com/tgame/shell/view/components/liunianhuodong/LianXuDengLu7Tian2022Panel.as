package com.tgame.shell.view.components.liunianhuodong
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.ShengRiSkin;
   import game.utils.SkinTools;
   
   public class LianXuDengLu7Tian2022Panel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var _container:Container;
      
      public function LianXuDengLu7Tian2022Panel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ShengRiSkin.skin,"shengri");
         this._container = new Container();
         addChild(this._container);
         this._container.x = -42;
         this._container.y = -125;
         this.arr1 = [[[711955,10],[723896,9],[735146,1],[727823,100]],[[711955,20],[723896,9],[735146,1],[713852,100]],[[711955,30],[723896,18],[735146,3],[727821,100]],[[711955,40],[723896,9],[735146,1],[30307,100]],[[711955,50],[723896,38],[735146,3],[736658,1]],[[711955,60],[723896,9],[735146,1],[729089,10]],[[711955,120],[723896,88],[735146,5],[726642,5]]];
         this.init();
      }
      
      private function init() : void
      {
         $("lingquanniu11 lingquanniu12 lingquanniu13 lingquanniu14 lingquanniu15 lingquanniu16 lingquanniu17",this,true).click(this.clickHanlder);
         $("guanbi1111",this,true).click(this.onClick);
         this.setDataGoods(this.arr1);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben1",this,true).attr("text",param1 + "");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("u1");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[284,uint(_loc2_[1])]);
      }
      
      private function setDataGoods(param1:Array) : void
      {
         var _loc2_:Goods = null;
         var _loc4_:int = 0;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc4_ = 0;
            while(_loc4_ < param1[_loc3_].length)
            {
               _loc2_ = new Goods(param1[_loc3_][_loc4_][0]);
               _loc2_.count = param1[_loc3_][_loc4_][1];
               this.item = new ItemFace(_loc2_);
               this.item.x = 104 + _loc3_ * 85;
               this.item.y = 266 + _loc4_ * 61;
               this._container.addChild(this.item);
               _loc4_++;
            }
            _loc3_++;
         }
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

