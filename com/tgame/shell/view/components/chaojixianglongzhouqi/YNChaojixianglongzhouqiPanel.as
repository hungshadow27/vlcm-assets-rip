package com.tgame.shell.view.components.chaojixianglongzhouqi
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.ChaoJiXiangLong20180619Skin;
   import game.utils.SkinTools;
   
   public class YNChaojixianglongzhouqiPanel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var _container:Container;
      
      public function YNChaojixianglongzhouqiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ChaoJiXiangLong20180619Skin.skin,"chaojixianglong");
         this._container = new Container();
         addChild(this._container);
         this._container.x = 29;
         this._container.y = 24;
         this.arr1 = [null,[711308,10],[711308,10],[711308,10],[711308,10],[711308,10],[711308,10],[711308,10]];
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3 DFZQLQAN4 DFZQLQAN5 DFZQLQAN6 DFZQLQAN7",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(this.onClick);
         this.setDataGoods(this.arr1);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("N");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[55,uint(_loc2_[1])]);
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
            this.item.y = 300;
            this.item.x = 85 + 91 * (_loc3_ - 1);
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

