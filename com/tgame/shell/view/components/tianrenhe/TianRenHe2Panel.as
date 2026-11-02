package com.tgame.shell.view.components.tianrenhe
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.TianRenHe20180709Skin;
   import game.utils.SkinTools;
   
   public class TianRenHe2Panel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var arr2:Array = [];
      
      private var arr3:Array = [];
      
      private var _container:Container;
      
      private var currType:int;
      
      public function TianRenHe2Panel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(TianRenHe20180709Skin.skin,"tianrenhe");
         this._container = new Container();
         addChild(this._container);
         this.arr1 = [null,[713285,3],[727823,100],[723896,5],[711308,100],[729089,1]];
         this.arr2 = [null,[713285,3],[727823,100],[723896,5],[711308,100],[729089,1]];
         this.arr3 = [null,[713285,3],[727823,100],[723896,5],[711308,100],[729089,1]];
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3 DFZQLQAN4 DFZQLQAN5",this,true).click(this.clickHanlder);
         $("guanbi",this,true).click(this.onClick);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben1",this,true).attr("text",param1 + "");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("N");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[this.currType,uint(_loc2_[1])]);
      }
      
      public function setDataGoods(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Goods = null;
         this.currType = param1;
         switch(param1)
         {
            case 80:
               _loc2_ = this.arr1;
               break;
            case 140:
               _loc2_ = this.arr2;
               break;
            case 141:
               _loc2_ = this.arr3;
         }
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         var _loc4_:int = 1;
         while(_loc4_ < this.arr1.length)
         {
            _loc3_ = new Goods(_loc2_[_loc4_][0]);
            _loc3_.count = _loc2_[_loc4_][1];
            this.item = new ItemFace(_loc3_,65,65);
            this.item.x = 484;
            this.item.y = 319 + (_loc4_ - 1) * 76;
            this._container.addChild(this.item);
            _loc4_++;
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

