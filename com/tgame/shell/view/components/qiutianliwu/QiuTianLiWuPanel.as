package com.tgame.shell.view.components.qiutianliwu
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.QiuTianLiWu20181009Skin;
   import game.utils.SkinTools;
   
   public class QiuTianLiWuPanel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var arr2:Array = [];
      
      private var _container:Container;
      
      private var currType:int;
      
      public function QiuTianLiWuPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(QiuTianLiWu20181009Skin.skin,"qiutianliwu");
         this._container = new Container();
         addChild(this._container);
         this._container.x = 37;
         this._container.y = 70;
         this.arr1 = [null,[713337,3],[713337,3],[713337,3],[713337,3],[713337,3],[713337,3],[713337,3],[723896,5],[726642,5],[728758,10],[723896,5],[726642,5],[723896,5],[728758,10]];
         this.arr2 = [null,[713337,2],[713337,2],[713337,2],[713337,2],[713337,2],[713337,2],[713337,2],[723896,4],[726642,4],[728758,5],[723896,4],[726642,4],[723896,4],[728758,5]];
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3 DFZQLQAN4 DFZQLQAN5 DFZQLQAN6 DFZQLQAN7 DFZQLQAN8 DFZQLQAN9 DFZQLQAN10 DFZQLQAN11 DFZQLQAN12 DFZQLQAN13 DFZQLQAN14",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(this.onClick);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben1",this,true).attr("text","");
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
            case 131:
               _loc2_ = this.arr1;
               break;
            case 132:
               _loc2_ = this.arr2;
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
            this.item.x = 46 + (_loc4_ - 1) % 7 * 90;
            this.item.y = 340 + int((_loc4_ - 1) / 7) * 167;
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

