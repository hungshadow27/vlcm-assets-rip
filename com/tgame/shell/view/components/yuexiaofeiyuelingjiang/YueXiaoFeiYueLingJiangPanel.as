package com.tgame.shell.view.components.yuexiaofeiyuelingjiang
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.YueXiaoFeiYueLingJiangHuoDongSkin;
   import game.utils.SkinTools;
   
   public class YueXiaoFeiYueLingJiangPanel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var _container:Container;
      
      public function YueXiaoFeiYueLingJiangPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(YueXiaoFeiYueLingJiangHuoDongSkin.skin,"yuexiaofeiyuelingjianghuodong");
         this._container = new Container();
         addChild(this._container);
         this.arr1 = [null,[713234,1],[713234,2],[713234,2],[713234,3],[713234,5],[713234,7],[713234,1],[713234,2],[713234,2],[713234,3],[713234,5],[713234,7],[713234,2],[713234,4],[713234,4],[713234,6],[713234,10],[713234,14],[713234,3],[713234,6],[713234,6],[713234,9],[713234,15],[713234,21]];
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3 DFZQLQAN4 DFZQLQAN5 DFZQLQAN6 DFZQLQAN7 DFZQLQAN8 DFZQLQAN9 DFZQLQAN10 DFZQLQAN11 DFZQLQAN12 DFZQLQAN13 DFZQLQAN14 DFZQLQAN15 DFZQLQAN16 DFZQLQAN17 DFZQLQAN18 DFZQLQAN19 DFZQLQAN20 DFZQLQAN21 DFZQLQAN22 DFZQLQAN23 DFZQLQAN24",this,true).click(this.clickHanlder);
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
         PipeManager.sendMsg(PipeConstants.SEND_53099,[96,uint(_loc2_[1])]);
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
            this.item.x = 136 + (_loc3_ - 1) % 6 * 91;
            this.item.y = 381 + int((_loc3_ - 1) / 6) * 100;
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

