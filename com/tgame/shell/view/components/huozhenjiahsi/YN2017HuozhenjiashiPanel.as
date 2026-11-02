package com.tgame.shell.view.components.huozhenjiahsi
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
   import game.skin.HuoZhenJiaShiSkin;
   import game.utils.SkinTools;
   
   public class YN2017HuozhenjiashiPanel extends BasePanel
   {
      
      private var _container:Container;
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var arr2:Array;
      
      public function YN2017HuozhenjiashiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(HuoZhenJiaShiSkin.skin,"huozhenjiashi");
         this.arr1 = [null,[713107,1],[713107,1],[713107,1],[713107,1],[713107,1],[713107,1],[713107,1]];
         this._container = new Container();
         addChild(this._container);
         this._container.x = 26;
         this._container.y = 120;
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(function():*
         {
            onClose();
         });
      }
      
      public function setData(param1:Array) : void
      {
         this.arr2 = param1;
         this.setDataGoods(this.arr1);
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
            this.item.x = 46 + 90 * (_loc3_ - 1);
            this.item.y = 247;
            this._container.addChild(this.item);
            if(this.arr2[_loc3_ - 1] == 0)
            {
               this.item.filters = Tools.blackWhiteFilter;
            }
            else
            {
               this.item.filters = [];
            }
            _loc3_++;
         }
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("N");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[31]);
      }
   }
}

