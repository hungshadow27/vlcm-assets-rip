package com.tgame.shell.view.components.lliuyueyuanman
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.TeBieShangDianSkin;
   import game.utils.SkinTools;
   
   public class TeBieShangDianPanel extends BasePanel
   {
      
      private var _container:Container;
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      public function TeBieShangDianPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(TeBieShangDianSkin.skin,"youhui");
         this._container = new Container();
         addChild(this._container);
         this.arr1 = [[737782,1],[738397,1],[738358,1],[60902,1],[713833,88]];
         this.init();
      }
      
      private function init() : void
      {
         $("youhuijiemiananniu",this,true).click(this.clickHanlder);
         $("zhekoushangdian",this,true).click(this.onClick);
         this.setDataGoods(this.arr1);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53099,[332,1]);
      }
      
      public function setNum(param1:int) : void
      {
         $("youhuiwenzi",this,true).attr("text",param1 + "");
      }
      
      private function setDataGoods(param1:Array) : void
      {
         var _loc2_:Goods = null;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.arr1.length)
         {
            _loc2_ = new Goods(param1[_loc3_][0]);
            _loc2_.count = param1[_loc3_][1];
            this.item = new ItemFace(_loc2_,65,65);
            this.item.x = 76 + 89 * _loc3_;
            this.item.y = 196;
            this._container.addChild(this.item);
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

