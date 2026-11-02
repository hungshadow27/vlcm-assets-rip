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
   import game.skin.XinShouZhan20210609Skin;
   import game.utils.SkinTools;
   
   public class XinShouZhanPanel extends BasePanel
   {
      
      private var item:ItemFace;
      
      private var arr1:Array = [];
      
      private var _container:Container;
      
      private var currtType:int = 0;
      
      public function XinShouZhanPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(XinShouZhan20210609Skin.skin,"xinshouzhan");
         this._container = new Container();
         addChild(this._container);
         this._container.x = -166;
         this._container.y = 58;
         this.arr1 = [[[41939,200],[45600,100],[713944,1],[713852,1]],[[41939,500],[45600,300],[713944,1],[713852,1]],[[41939,1200],[45600,600],[713944,1],[713852,3]],[[41939,400],[45600,200],[712649,5],[713852,1]]];
         this.init();
      }
      
      private function init() : void
      {
         $("anniu1 anniu2 anniu3 anniu4",this,true).click(this.clickHanlder);
         $("YBZLGBAN",this,true).click(this.onClick);
         this.setDataGoods(this.arr1);
      }
      
      public function setNum(param1:int) : void
      {
         $("wenben1",this,true).attr("text",param1 + "");
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         var _loc2_:Array = String(param1.target.name).split("iu");
         PipeManager.sendMsg(PipeConstants.SEND_53099,[this.currtType,uint(_loc2_[1])]);
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
                  this.item.y = 137;
                  if(_loc3_ == 0)
                  {
                     this.item.x = 211 + 49 * _loc4_;
                  }
                  else if(_loc3_ == 1)
                  {
                     this.item.x = 435 + 49 * _loc4_;
                  }
                  else if(_loc3_ == 2)
                  {
                     this.item.x = 660 + 49 * _loc4_;
                  }
                  else if(_loc3_ == 3)
                  {
                     this.item.x = 435 + 49 * _loc4_;
                     this.item.y = 383;
                  }
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
      
      public function setType(param1:int) : void
      {
         this.currtType = param1;
      }
   }
}

