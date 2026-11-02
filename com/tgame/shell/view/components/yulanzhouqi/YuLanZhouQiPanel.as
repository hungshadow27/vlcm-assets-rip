package com.tgame.shell.view.components.yulanzhouqi
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.YuLanZhouQiSkin;
   import game.utils.SkinTools;
   
   public class YuLanZhouQiPanel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var _container:Container;
      
      public function YuLanZhouQiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(YuLanZhouQiSkin.skin,"wangzhezhouqi");
         this._container = new Container();
         addChild(this._container);
         this._container.x = 44;
         this._container.y = -21;
         this.arr1 = [null,[713312,1],[713312,1],[713312,1],[713312,1],[713312,1],[713312,1],[713312,1],[723896,4],[726642,5],[728758,4],[723896,4],[726642,5],[723896,4],[728758,4]];
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3 DFZQLQAN4 DFZQLQAN5 DFZQLQAN6 DFZQLQAN7 DFZQLQAN8 DFZQLQAN9 DFZQLQAN10 DFZQLQAN11 DFZQLQAN12 DFZQLQAN13 DFZQLQAN14",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(this.onClick);
         this.setDataGoods(this.arr1);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben1",this,true).attr("text","");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("N");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[116,uint(_loc2_[1])]);
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
            this.item.x = 46 + (_loc3_ - 1) % 7 * 90;
            this.item.y = 340 + int((_loc3_ - 1) / 7) * 167;
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

