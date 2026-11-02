package com.tgame.shell.view.components.lliuyueyuanman
{
   import com.asQuery.$;
   import com.tgame.common.ui.componets.BasePanel;
   import flash.events.MouseEvent;
   import game.display.ScrollBar;
   import game.skin.ZheKouShangDianSkin;
   import game.utils.SkinTools;
   
   public class ZheKouShangDian20240116Panel extends BasePanel
   {
      
      private var scrollBar:ScrollBar;
      
      private var content:ZheKouShangDianContent;
      
      public function ZheKouShangDian20240116Panel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(ZheKouShangDianSkin.skin,"zhekoushangdian");
         this.content = new ZheKouShangDianContent();
         addChild(this.content);
         this.scrollBar.target = this.content;
      }
      
      override protected function createVariableReference() : void
      {
         $("zhekoushangdian",this,true).click(this.onClick);
         this.scrollBar = getChildByName("huatiao") as ScrollBar;
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

import com.asQuery.$;
import com.tgame.PipeConstants;
import com.tgame.common.ui.componets.BasePanel;
import com.tgame.common.ui.componets.ItemFace;
import com.tgame.common.vo.item.Goods;
import com.tgame.manager.PipeManager;
import flash.events.MouseEvent;
import game.display.Container;
import game.skin.ZheKouShangDianSkin;
import game.utils.SkinTools;

class ZheKouShangDianContent extends BasePanel
{
   
   private var _container:Container;
   
   private var item:ItemFace;
   
   private var arr:Array = [];
   
   public function ZheKouShangDianContent()
   {
      super();
      this.skin = SkinTools.getChildSkinByName(ZheKouShangDianSkin.skin,"zhekoushangdianneirong");
      this._container = new Container();
      addChild(this._container);
      this.arr = [[737132,1],[737412,1],[737656,1],[737835,1],[738021,1],[738255,1],[738452,1],[738675,1],[738854,1],[739038,1],[739254,1],[739434,1],[713852,10],[723896,3],[727823,3],[712649,20],[729176,1],[729177,1],[30307,1],[729089,1],[730266,1],[729843,1],[713399,10],[713127,10]];
      $("zhekoushangdiananniu1 zhekoushangdiananniu2",this,true).click(this.clickHanlder);
      this.setDataGoods(this.arr);
   }
   
   private function setDataGoods(param1:Array) : void
   {
      var _loc2_:Goods = null;
      var _loc3_:int = 0;
      var _loc4_:int = 0;
      while(this._container.numChildren)
      {
         this._container.removeChildAt(0);
      }
      _loc3_ = 0;
      while(_loc3_ < param1.length)
      {
         _loc2_ = new Goods(param1[_loc3_][0]);
         _loc2_.count = param1[_loc3_][1];
         this.item = new ItemFace(_loc2_,65,65);
         this.item.x = 87 * (_loc3_ % 6);
         _loc4_ = int(_loc3_ / 6);
         if(_loc4_ == 0)
         {
            this.item.x += 52;
            this.item.y = 76;
         }
         else if(_loc4_ == 1)
         {
            this.item.x += 52;
            this.item.y = 162;
         }
         else if(_loc4_ == 2)
         {
            this.item.x += 51;
            this.item.y = 386;
         }
         else if(_loc4_ == 3)
         {
            this.item.x += 51;
            this.item.y = 473;
         }
         this._container.addChild(this.item);
         _loc3_++;
      }
   }
   
   private function clickHanlder(param1:MouseEvent) : void
   {
      var _loc2_:Array = String(param1.target.name).split("anniu");
      PipeManager.sendMsg(PipeConstants.SEND_53099,[314,uint(_loc2_[1])]);
   }
}
