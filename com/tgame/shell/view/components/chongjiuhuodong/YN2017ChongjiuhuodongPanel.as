package com.tgame.shell.view.components.chongjiuhuodong
{
   import com.asQuery.$;
   import com.fireice.text.FTextArea;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.ChongJiuHuoDongSkin;
   import game.utils.SkinTools;
   
   public class YN2017ChongjiuhuodongPanel extends BasePanel
   {
      
      private var _container:Container;
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var fts:FTextArea;
      
      public function YN2017ChongjiuhuodongPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ChongJiuHuoDongSkin.skin,"chongjiuhuodong");
         this.arr1 = [null,[725550,1999],[725550,1999],[42583,999],[727822,99],[724973,1]];
         this._container = new Container();
         addChild(this._container);
         this._container.x = 0;
         this._container.y = 175;
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3 DFZQLQAN4 DFZQLQAN5",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(function():*
         {
            onClose();
         });
         this.setDataGoods(this.arr1);
         this.fts = new FTextArea();
         this.fts.x = 427;
         this.fts.y = 161;
         this.fts.textColor = StaticValue.WHITE;
         this.fts.width = 170;
         this.fts.height = 20;
         addChild(this.fts);
      }
      
      public function setNum(param1:int) : void
      {
         this.fts.text = param1 + "";
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
         PipeManager.sendMsg(PipeConstants.SEND_53099,[28,uint(_loc2_[1])]);
      }
   }
}

