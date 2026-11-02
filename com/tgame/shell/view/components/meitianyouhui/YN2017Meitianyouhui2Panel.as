package com.tgame.shell.view.components.meitianyouhui
{
   import com.asQuery.$;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.MeiTianYouHuiMianBanSkin;
   import game.utils.SkinTools;
   
   public class YN2017Meitianyouhui2Panel extends BasePanel
   {
      
      public static const MEITIANYOUHUI:String = "MEITIANYOUHUILINGJIANG20170607";
      
      private var _container:Container;
      
      private var item:ItemFace;
      
      private var buy1:int;
      
      private var buy2:int;
      
      private var buy3:int;
      
      private var buy4:int;
      
      private var buy5:int;
      
      private var buy6:int;
      
      private var buy7:int;
      
      public function YN2017Meitianyouhui2Panel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(MeiTianYouHuiMianBanSkin.skin,"meitianyouhuimianban");
         this._container = new Container();
         addChild(this._container);
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3 DFZQLQAN4 DFZQLQAN5 DFZQLQAN6 DFZQLQAN7",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(this.onClick);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("N");
         dispatchEvent(new BaseEvent(MEITIANYOUHUI,"",this["buy" + _loc2_[1]]));
      }
      
      public function setDataGoods(param1:Object) : void
      {
         var _loc3_:Goods = null;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         var _loc2_:Array = param1.arr;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ = new Goods(_loc2_[_loc4_].id);
            _loc3_.count = _loc2_[_loc4_].count;
            this.item = new ItemFace(_loc3_,65,65);
            this.item.x = 47 + 90 * _loc4_;
            this.item.y = 310;
            this["buy" + int(_loc4_ + 1)] = _loc2_[_loc4_].buyid;
            this._container.addChild(this.item);
            _loc4_++;
         }
         $("wenben1",this,true).attr("text",param1.time);
         $("wenben2",this,true).attr("text",param1.jifen);
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

