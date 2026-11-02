package com.tgame.shell.view.components.lliuyueqingzhu
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.MeiTianYouHuiSkin;
   import game.utils.SkinTools;
   
   public class MeiRiYouHuiPanel extends BasePanel
   {
      
      private var _container:Container;
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      public function MeiRiYouHuiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(MeiTianYouHuiSkin.skin,"meitianyouhui");
         this._container = new Container();
         addChild(this._container);
         this.arr1 = [[712649,16],[712649,46],[712649,90],[712649,150],[712649,600],[712649,900],[712649,900]];
         this.init();
      }
      
      private function init() : void
      {
         $("mtyhlingqu1 mtyhlingqu2 mtyhlingqu3 mtyhlingqu4 mtyhlingqu5 mtyhlingqu6 mtyhlingqu7",this,true).click(this.clickHanlder);
         $("mtyhguanbi",this,true).click(this.onClick);
         this.setDataGoods(this.arr1);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("qu");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[333,uint(_loc2_[1])]);
      }
      
      public function setNum(param1:int) : void
      {
         $("youhuiwenzi",this,true).attr("text",param1 + "");
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
            this.item = new ItemFace(_loc2_);
            this.item.x = 38 + 90 * _loc3_;
            this.item.y = 128;
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

