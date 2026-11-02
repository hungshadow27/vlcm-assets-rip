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
   import game.skin.XinShangXian20240618Skin;
   import game.utils.SkinTools;
   
   public class XinShangXianPanel extends BasePanel
   {
      
      private var _container:Container;
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      public function XinShangXianPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(XinShangXian20240618Skin.skin,"xinshangxian");
         this._container = new Container();
         addChild(this._container);
         this._container.x = -71;
         this._container.y = -32;
         this.arr1 = [[736647,1],[714924,1],[739772,1],[727217,1000]];
         this.init();
      }
      
      private function init() : void
      {
         $("shijian",this,true).attr("text","06/05-06/11");
         $("wenbenshang",this,true).attr("text","1000");
         $("xinshangxiananniu",this,true).click(this.clickHanlder);
         $("guanbian",this,true).click(this.onClick);
         this.setDataGoods(this.arr1);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         PipeManager.sendMsg(PipeConstants.SEND_53099,[316,1]);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenbenxia",this,true).attr("text",param1 + "");
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
            this.item.x = 119 + 118 * _loc3_;
            this.item.y = 285;
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

