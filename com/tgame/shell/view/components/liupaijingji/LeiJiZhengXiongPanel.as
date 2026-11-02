package com.tgame.shell.view.components.liupaijingji
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.LeiJiZhenXiong20210331Skin;
   import game.utils.SkinTools;
   
   public class LeiJiZhengXiongPanel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var _container:Container;
      
      public function LeiJiZhengXiongPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(LeiJiZhenXiong20210331Skin.skin,"leijizhengxiong");
         this._container = new Container();
         addChild(this._container);
         this._container.x = -170;
         this._container.y = 29;
         this.arr1 = [[[713765,1],[713766,1],[713767,1],[713768,1]],[[713774,1],null,null,[713769,1]],[[713773,1],[713772,1],[713771,1],[713770,1]]];
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3 DFZQLQAN4 DFZQLQAN5 DFZQLQAN6 DFZQLQAN7 DFZQLQAN8 DFZQLQAN9 DFZQLQAN10",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(this.onClick);
         this.setDataGoods(this.arr1);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben1",this,true).attr("text",param1 + "");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("N");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[260,uint(_loc2_[1])]);
      }
      
      private function setDataGoods(param1:Array) : void
      {
         var _loc2_:Goods = null;
         var _loc4_:int = 0;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         var _loc3_:int = 0;
         while(_loc3_ < this.arr1.length)
         {
            _loc4_ = 0;
            while(_loc4_ < this.arr1[_loc3_].length)
            {
               if(param1[_loc3_][_loc4_] != null)
               {
                  _loc2_ = new Goods(param1[_loc3_][_loc4_][0]);
                  _loc2_.count = param1[_loc3_][_loc4_][1];
                  this.item = new ItemFace(_loc2_);
                  this.item.x = 252 + 100 * _loc4_;
                  this.item.y = 126 + 98 * _loc3_;
                  this._container.addChild(this.item);
               }
               _loc4_++;
            }
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

