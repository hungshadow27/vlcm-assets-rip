package com.tgame.shell.view.components.meirichongzhi
{
   import com.asQuery.$;
   import com.tgame.PipeConstants;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import flash.events.MouseEvent;
   import game.display.Container;
   import game.skin.ZhenPinGeSkin;
   import game.utils.SkinTools;
   
   public class MeiRiChongZhiPanel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var arr2:Array = [];
      
      private var _container:Container;
      
      private var currType:int;
      
      public function MeiRiChongZhiPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ZhenPinGeSkin.skin,"zhenpinge");
         this._container = new Container();
         addChild(this._container);
         this._container.x = 3;
         this._container.y = 39;
         this.arr1 = [null,[712649,100],[727217,500],[30307,200],[732267,50],[727217,500],[30307,200],[732267,50],[713852,3],[729178,5],[732059,1],[713852,3],[729178,5],[732060,1],[713852,3]];
         this.arr2 = [null,[713127,20],[712649,200],[729176,10],[713127,20],[729748,1],[713852,1],[729176,10],[731515,1],[731562,1],[731568,1],[731582,1],[731615,1],[731621,1],[731600,1]];
         this.init();
      }
      
      private function init() : void
      {
         $("DFZQLQAN1 DFZQLQAN2 DFZQLQAN3 DFZQLQAN4 DFZQLQAN5 DFZQLQAN6 DFZQLQAN7 DFZQLQAN8 DFZQLQAN9 DFZQLQAN10 DFZQLQAN11 DFZQLQAN12 DFZQLQAN13 DFZQLQAN14",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(this.onClick);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben1",this,true).attr("text",param1 + "");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("N");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[this.currType,uint(_loc2_[1])]);
      }
      
      public function setDataGoods(param1:int) : void
      {
         var _loc2_:Array = null;
         var _loc3_:Goods = null;
         this.currType = param1;
         switch(param1)
         {
            case 149:
               _loc2_ = this.arr1;
               break;
            case 192:
               _loc2_ = this.arr2;
         }
         while(this._container.numChildren)
         {
            this._container.removeChildAt(0);
         }
         var _loc4_:int = 1;
         while(_loc4_ < _loc2_.length)
         {
            _loc3_ = new Goods(_loc2_[_loc4_][0]);
            _loc3_.count = _loc2_[_loc4_][1];
            this.item = new ItemFace(_loc3_,65,65);
            this.item.x = 46 + (_loc4_ - 1) % 7 * 90;
            this.item.y = 340 + int((_loc4_ - 1) / 7) * 176;
            this._container.addChild(this.item);
            _loc4_++;
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

