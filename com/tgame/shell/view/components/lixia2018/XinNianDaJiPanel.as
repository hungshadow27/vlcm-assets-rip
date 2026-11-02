package com.tgame.shell.view.components.lixia2018
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.XinNianDaJiSkin;
   import game.utils.SkinTools;
   
   public class XinNianDaJiPanel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var _container:Container;
      
      public function XinNianDaJiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(XinNianDaJiSkin.skin,"xinniandaji");
         this._container = new Container();
         addChild(this._container);
         this._container.x = -133;
         this._container.y = 44;
         this.arr1 = [null,[730386,1],[711308,3000],[730385,1],[1355,20000],[732167,1],[713894,1]];
         this.init();
      }
      
      private function init() : void
      {
         $("anniuanniuAN1 anniuanniuAN2 anniuanniuAN3 anniuanniuAN4 anniuanniuAN5 anniuanniuAN6",this,true).click(this.clickHanlder);
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
         PipeManager.sendMsg(PipeConstants.SEND_53099,[274,uint(_loc2_[1])]);
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
            this.item = new ItemFace(_loc2_);
            this.item.x = 575;
            this.item.y = 266 + 59 * (_loc3_ - 1);
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

