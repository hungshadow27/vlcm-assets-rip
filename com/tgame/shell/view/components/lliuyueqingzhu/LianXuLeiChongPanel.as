package com.tgame.shell.view.components.lliuyueqingzhu
{
   import com.asQuery.$;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.LianXuLeiChongSkin;
   import game.utils.SkinTools;
   
   public class LianXuLeiChongPanel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr:Array = [];
      
      private var arr1:Array = [];
      
      private var _container:Container;
      
      private var _container1:Container;
      
      private var curT:int;
      
      public function LianXuLeiChongPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(LianXuLeiChongSkin.skin,"lianxuleichong");
         this._container = new Container();
         addChild(this._container);
         this._container1 = new Container();
         addChild(this._container1);
         this.arr = [[735550,1],[735550,1],[735550,1],[735550,1],[735550,1],[735550,1],[735550,1]];
         this.arr1 = [[715241,1],[715242,1],[715243,1],[715244,1]];
         this.init();
      }
      
      private function init() : void
      {
         $("nhanAN1 nhanAN2 nhanAN3 nhanAN4",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(this.onClick);
         this.setDataGoods();
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben",this,true).attr("text",param1 + "");
      }
      
      public function setLeiChongTianShu(param1:int) : void
      {
         var _loc2_:Goods = null;
         var _loc3_:int = 0;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         _loc3_ = 0;
         while(_loc3_ < this.arr.length)
         {
            _loc2_ = new Goods(this.arr[_loc3_][0]);
            _loc2_.count = this.arr[_loc3_][1];
            this.item = new ItemFace(_loc2_,65,65);
            this.item.setShowCount(false);
            this.item.x = 74 * _loc3_ + 106;
            this.item.y = 313;
            this.item.mouseEnabled = false;
            this._container.addChild(this.item);
            this.item.filters = _loc3_ < param1 ? [] : Tools.blackWhiteFilter;
            _loc3_++;
         }
      }
      
      public function setType(param1:int) : void
      {
         this.curT = param1;
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("N");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[this.curT,uint(_loc2_[1])]);
      }
      
      private function setDataGoods() : void
      {
         var _loc1_:Goods = null;
         var _loc2_:int = 0;
         while(this._container1.numChildren)
         {
            this._container1.removeChildAt(0);
         }
         _loc2_ = 0;
         while(_loc2_ < this.arr1.length)
         {
            _loc1_ = new Goods(this.arr1[_loc2_][0]);
            _loc1_.count = this.arr1[_loc2_][1];
            this.item = new ItemFace(_loc1_,65,65);
            this.item.x = 149 * _loc2_ + 106;
            this.item.y = 433;
            this._container1.addChild(this.item);
            _loc2_++;
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

