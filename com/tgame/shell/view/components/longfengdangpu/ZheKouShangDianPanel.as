package com.tgame.shell.view.components.longfengdangpu
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.ZheKoShangDianSkin;
   import game.utils.SkinTools;
   
   public class ZheKouShangDianPanel extends BasePanel
   {
      
      private var _container:Container;
      
      private var item:ItemFace;
      
      private var arr:Array = [];
      
      public function ZheKouShangDianPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ZheKoShangDianSkin.skin,"zhekoushangdian");
         this._container = new Container();
         addChild(this._container);
         this._container.x = 18;
         this._container.y = 160;
         this.arr = [[733097,1],[733325,1],[733513,1],[733641,1],[733814,1],[734026,1],[734134,1],[734324,1],[734459,1],[734608,1],[734802,1],[713852,10],[713852,10],[713852,10],[713852,10],[713852,10],[713852,10],[713852,10],[713852,10],[713852,10],[713852,10],[713852,10]];
         this.init();
      }
      
      private function init() : void
      {
         $("anniu1 anniu2",this,true).click(this.clickHanlder);
         $("guanbi",this,true).click(this.onClick);
         this.setDataGoods(this.arr);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("u");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[314,uint(_loc2_[1])]);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben1",this,true).attr("text",param1 + "");
      }
      
      private function setDataGoods(param1:Array) : void
      {
         var _loc2_:Goods = null;
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            _loc2_ = new Goods(param1[_loc3_][0]);
            _loc2_.count = param1[_loc3_][1];
            this.item = new ItemFace(_loc2_,65,65);
            this.item.x = 61 + 87 * (_loc3_ % 11);
            this.item.y = 226 + 225 * int(_loc3_ / 11);
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

