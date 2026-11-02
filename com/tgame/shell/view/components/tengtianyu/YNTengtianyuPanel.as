package com.tgame.shell.view.components.tengtianyu
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.tengtianyu0706Skin;
   import game.utils.SkinTools;
   
   public class YNTengtianyuPanel extends BasePanel
   {
      
      private var _container:Container;
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      public function YNTengtianyuPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(tengtianyu0706Skin.skin,"tengtianyu");
         this._container = new Container();
         addChild(this._container);
         this._container.y = -22;
         this.arr1 = [null,[725550,300],[725550,500],[725550,500],[725550,300],[725550,500],[725550,500],[725550,700]];
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3 DFZQLQAN4 DFZQLQAN5 DFZQLQAN6 DFZQLQAN7",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(this.onClick);
         $("wenben2",this,true).attr("text",LanResManager.getLanCommonTextWords("腾天羽活动时间"));
         this.setDataGoods1(this.arr1);
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("N");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[4,uint(_loc2_[1])]);
      }
      
      private function setDataGoods1(param1:Array) : void
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
            this.item.y = 372;
            this._container.addChild(this.item);
            _loc3_++;
         }
      }
      
      public function setDataGoods(param1:int) : void
      {
         $("wenben1",this,true).attr("text",param1 + "");
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

