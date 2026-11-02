package com.tgame.shell.view.components.liuyuedi
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.ShiYiYueDi20181128Skin;
   import game.utils.SkinTools;
   
   public class YN2017LiuyuediPanel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var _container:Container;
      
      public function YN2017LiuyuediPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ShiYiYueDi20181128Skin.skin,"shiyiyuedi");
         this._container = new Container();
         addChild(this._container);
         this._container.x = -19;
         this._container.y = 32;
         this.arr1 = [null,[729089,1],[729167,3],[729089,1],[728771,1],[728932,1]];
         this.init();
      }
      
      private function init() : void
      {
         var i:int;
         var goods:Goods = null;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         i = 1;
         while(i < this.arr1.length)
         {
            goods = new Goods(this.arr1[i][0]);
            goods.count = this.arr1[i][1];
            this.item = new ItemFace(goods,65,65);
            this.item.y = 262 + 88 * (i - 1);
            this.item.x = 512;
            this._container.addChild(this.item);
            i++;
         }
         $("anniuanniuAN1 anniuanniuAN2 anniuanniuAN3 anniuanniuAN4 anniuanniuAN5",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(function():void
         {
            onClose();
         });
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("N");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[7,uint(_loc2_[1])]);
      }
      
      public function setDataGoods(param1:int, param2:int) : void
      {
         $("wenben1",this,true).attr("text",param1 + "");
         $("wenben2",this,true).attr("text",param2 + "");
      }
   }
}

