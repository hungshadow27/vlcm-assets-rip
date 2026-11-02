package com.tgame.shell.view.components.shijian902
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.Shijian902Skin;
   import game.utils.SkinTools;
   
   public class YN2017Shijian902Panel extends BasePanel
   {
      
      private var _container:Container;
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      public function YN2017Shijian902Panel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(Shijian902Skin.skin,"Shijian902");
         this.arr1 = [null,[727986,1],[713112,1],[724973,1],[727702,1]];
         this._container = new Container();
         addChild(this._container);
         this._container.x = 67;
         this._container.y = 174;
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3 DFZQLQAN4",this,true).click(this.clickHanlder);
         $("guanbi",this,true).click(function():*
         {
            onClose();
         });
         this.setDataGoods(this.arr1);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben1",this,true).attr("text",param1 + "");
      }
      
      private function setDataGoods(param1:Array) : void
      {
         var _loc2_:Goods = null;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         var _loc3_:int = 1;
         while(_loc3_ < this.arr1.length)
         {
            _loc2_ = new Goods(param1[_loc3_][0]);
            _loc2_.count = param1[_loc3_][1];
            this.item = new ItemFace(_loc2_,65,65);
            this.item.y = 46 + 76 * (_loc3_ - 1);
            this.item.x = 437;
            this._container.addChild(this.item);
            _loc3_++;
         }
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("N");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[25,uint(_loc2_[1])]);
      }
   }
}

