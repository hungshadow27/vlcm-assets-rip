package com.tgame.shell.view.components._1908
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.YN1908Skin;
   import game.utils.SkinTools;
   
   public class YN2017_1908Panel extends BasePanel
   {
      
      private var _container:Container;
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      public function YN2017_1908Panel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(YN1908Skin.skin,"yijiubaling");
         this.arr1 = [null,[727829,1],[713102,1],[724973,1],[727702,1]];
         this._container = new Container();
         addChild(this._container);
         this._container.x = 20;
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
         PipeManager.sendMsg(PipeConstants.SEND_53099,[21,uint(_loc2_[1])]);
      }
   }
}

