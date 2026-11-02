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
   import game.skin.CaiFuBuDuanSkin;
   import game.utils.SkinTools;
   
   public class XinShouQiZhen3Panel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var arr2:Array = [];
      
      private var _container:Container;
      
      private var curType:int = 0;
      
      public function XinShouQiZhen3Panel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(CaiFuBuDuanSkin.skin,"caifubuduan");
         this._container = new Container();
         addChild(this._container);
         this._container.x = -166;
         this._container.y = -2;
         this.arr1 = [null,[729089,5],[45459,1000],[42651,1],[45459,4000],[713399,20],[733238,1]];
         this.arr2 = [null,[730266,5],[713399,20],[713852,30],[713343,50],[732746,1],[734507,1]];
         this.init();
      }
      
      private function init() : void
      {
         $("anniuanniuAN1 anniuanniuAN2 anniuanniuAN3 anniuanniuAN4 anniuanniuAN5 anniuanniuAN6",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(this.onClick);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben1",this,true).attr("text",param1 + "");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("N");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[this.curType,uint(_loc2_[1])]);
      }
      
      private function setDataGoods(param1:Array) : void
      {
         var _loc2_:Goods = null;
         var _loc3_:int = 0;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         _loc3_ = 1;
         while(_loc3_ < param1.length)
         {
            _loc2_ = new Goods(param1[_loc3_][0]);
            _loc2_.count = param1[_loc3_][1];
            this.item = new ItemFace(_loc2_);
            this.item.x = 575;
            this.item.y = 266 + 48 * (_loc3_ - 1);
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
      
      public function setType(param1:int) : void
      {
         this.curType = param1;
         if(param1 == 265)
         {
            this.setDataGoods(this.arr1);
         }
         else if(param1 == 270)
         {
            this.setDataGoods(this.arr2);
         }
      }
   }
}

